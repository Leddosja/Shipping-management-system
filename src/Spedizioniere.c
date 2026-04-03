#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "dipendencies/include/libpq-fe.h"
#define PG_HOST "127.0.0.1"
#define PG_USER "postgres" // il vostro nome utente
#define PG_DB "Spedizioniere" // il nome del database
#define PG_PORT 5431

void checkResults(PGresult *res ,const PGconn *conn ) {
    if( PQresultStatus(res) !=PGRES_TUPLES_OK ) {
        printf("%s\n",PQerrorMessage(conn));
        PQclear(res);
        exit(1);
    }
}

void esegui_query_spaziato(PGconn* conn, char query[250]) {
    printf("\nRISULTATO:\n");
    PGresult *res = PQexec(conn, query);
    checkResults(res, conn);
    int tuple = PQntuples(res);
    int attributi = PQnfields(res);
    // Calcolo larghezza massima per ogni colonna !!!
    int larghezze[attributi];
    for (int i = 0; i < attributi; i++) {
        larghezze[i] = strlen(PQfname(res, i)); 
        for (int j = 0; j < tuple; j++) {
            int lung = strlen(PQgetvalue(res, j, i));
            if (lung > larghezze[i]) {
                larghezze[i] = lung;
            }
        }
        larghezze[i] += 2;
    }
    // header
    for (int i = 0; i < attributi; i++) {
        printf("%-*s", larghezze[i], PQfname(res, i));
    }
    printf("\n");
    for (int i = 0; i < attributi; i++) {
        for (int k = 0; k < larghezze[i]; k++) printf("-");
    }
    printf("\n");
    // info
    for (int i = 0; i < tuple; i++) {
        for (int j = 0; j < attributi; j++) {
            printf("%-*s", larghezze[j], PQgetvalue(res, i, j));
        }
        printf("\n");
    }
    PQclear(res);
}

int main(int args, char* argsv[]){
    char conninfo[250];
    sprintf (conninfo,"user=%s dbname=%s hostaddr=%s port=%d",PG_USER,PG_DB,PG_HOST,PG_PORT);
    PGconn *conn = PQconnectdb(conninfo);

    if( PQstatus(conn) == CONNECTION_OK ){
        printf("****************Connessione riuscita****************\n");
    }
    else{
        printf("Connessione non riuscita: ERRORE: %s\n\n\n\n",PQerrorMessage(conn));
    }
    char query[512];
    // 1 
    printf("Di quale magazzino vuoi vedere la situazione a livello di pacchi?\n"
        "In seguito visualizzerai i vari magazzini disponibili\n");
    esegui_query_spaziato(conn,"SELECT codice_magazzino, citta, nome FROM magazzino");
    printf("\n\n\n");

    int codice_magazzino; 
    printf("Codice magazzino: ");
    scanf("%d", &codice_magazzino);
    snprintf(query, sizeof(query),"SELECT tipo_contenuto, COUNT(*) as quantita, AVG(p.peso) as media_peso FROM pacco p, magazzino m " 
        "WHERE p.codice_magazzino = m.codice_magazzino " 
        "AND p.codice_magazzino = %d " 
        "AND ( p.stato='In magazzino' OR p.stato='In attesa') "
        "GROUP BY tipo_contenuto " 
        "ORDER BY tipo_contenuto", codice_magazzino);
    esegui_query_spaziato(conn,query);

    // 2
    printf("\n\nDi quale città e in quale anno vorresti vedere la quantità di pacchi che sono stati spediti?\n "
        "In seguito vedrai tutte le città dalle quali è possibile utilizzare i nostri servizi\n");
    esegui_query_spaziato(conn,"SELECT DISTINCT citta FROM ordine o JOIN cliente c ON o.mittente = c.codice_cliente");
    printf("\n\n\n");
    char citta[50];
    int anno;
    printf("Città: ");
    scanf("%s", citta);
    printf("Anno: ");
    scanf("%d", &anno);
    snprintf(query, sizeof(query),"SELECT COUNT(*) FROM pacco p "
        "JOIN ordine o ON p.numero_ordine = o.numero_ordine "
        "JOIN cliente c ON c.codice_cliente = o.mittente "
        "WHERE c.citta='%s' AND EXTRACT(YEAR FROM o.data_creazione) = %d", citta, anno);
    esegui_query_spaziato(conn,query);

    // 3
    printf("\n\nTutti i veicoli a disposizione dell'azienda con la data, corriere e "
        "città di utimo utilizzo\n ");
    esegui_query_spaziato(conn,"SELECT v.tipo, r.targa, g.codice_corriere, r.data_ultimo_utilizzo, m.citta "
        "FROM guida g RIGHT JOIN ( "
            "SELECT v.targa, MAX(data_utilizzo) AS data_ultimo_utilizzo FROM veicolo v "
            "LEFT JOIN guida g ON g.targa = v.targa "
            "GROUP BY v.targa ) r "
        "ON g.targa = r.targa AND g.data_utilizzo = r.data_ultimo_utilizzo "
        "LEFT JOIN veicolo v ON v.targa = r.targa "
        "LEFT JOIN dipendente d ON d.codice_corriere = g.codice_corriere "
        "LEFT JOIN magazzino m ON m.codice_magazzino = d.codice_magazzino "
        "ORDER BY data_ultimo_utilizzo, g.codice_corriere;");

    // 4
    printf("\n\nQuadro completo dei destinatari di pacchi per i quali ci sono stati "
        "più tentativi di consegna?\n");
    esegui_query_spaziato(conn,"SELECT * FROM cliente c WHERE c.codice_cliente IN "
        "(SELECT c.codice_cliente FROM pacco p "
	    "JOIN ordine o ON p.numero_ordine = o.numero_ordine "
        "JOIN cliente c ON c.codice_cliente = o.destinatario "
        "JOIN consegna co ON co.codice_tracciamento = p.codice_tracciamento "
        "WHERE co.esito = 'Tentata consegna' "
        "GROUP BY c.codice_cliente "
        "HAVING COUNT(*)>1)");

    // 5
    printf("\n\nNome, cognome e numero di consegne andate a buon fine del correire "
        "con più consegne di successo di tutta l'azienda?\n");
    esegui_query_spaziato(conn,"SELECT d.nome, d.cognome, COUNT(*) FROM consegna c "
        "JOIN opera o ON c.codice_tracciamento = o.codice_tracciamento "
        "JOIN dipendente d ON o.codice_corriere = d.codice_corriere "
        "WHERE esito='Consegnato' "
        "GROUP BY o.codice_corriere, d.nome, d.cognome "
        "HAVING COUNT(*) = ( "
            "SELECT MAX(totale) FROM ( "
                "SELECT COUNT(*) as totale FROM consegna c "
                "JOIN opera o ON c.codice_tracciamento = o.codice_tracciamento "
                "WHERE esito='Consegnato' "
                "GROUP BY codice_corriere ))");
    PQfinish(conn);
    return 0;
}