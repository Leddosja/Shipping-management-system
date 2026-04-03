# Shipping Management System - C Application

Progetto sviluppato con l’obiettivo di realizzare un sistema per la gestione di spedizioni, integrando un'applicazione in linguaggio C con un database SQL.

## 📖 Descrizione

L’applicazione permette la gestione di un sistema di spedizioni, includendo operazioni di inserimento, consultazione e gestione dei dati tramite database.

Il progetto combina programmazione in C con l’utilizzo di query SQL, mostrando l’interazione tra applicazione e database.

L’obiettivo principale è stato comprendere la gestione della memoria, la strutturazione di un programma modulare e l’integrazione con sistemi di persistenza dei dati.

> ⚠️ Progetto sviluppato a scopo formativo.

## 🚀 Funzionalità principali

- Gestione spedizioni e dati associati
- Interazione con database SQL
- Esecuzione di operazioni CRUD
- Struttura modulare del codice
- Utilizzo di librerie esterne

## 🛠️ Tech Stack

- **Linguaggio:** C  
- **Database:** SQL  
- **Librerie:** libpq (PostgreSQL client)  
- **Strumenti:** GCC / Clang, VS Code  

## ▶️ Come avviare il progetto

Per eseguire questo progetto in locale, seguire i seguenti passaggi.
È necessario avere PostgreSQL e le librerie client (`libpq`) installate sul sistema.

####  🍎 macOS
> _bash_
> _brew install postgresql_

####  🐧 Linux
> _sudo apt install libpq-dev_

- Crea il database
> _createdb spedizioniere_db_

- Importa lo script SQL
> _psql -U postgres -d spedizioniere_db -f database/Spedizioniere.sql_

- Compila il programma
> _gcc src/Spedizioniere.c -o spedizioniere -lpq_

- Esegui il programma
> _./spedizioniere_

### 🔧 Configurazione della connessione con il database
> _PQconnectdb("user=YOUR_USER password=YOUR_PASSWORD dbname=spedizioniere_db");_

## 📌 Note

Progetto realizzato a scopo formativo per comprendere l'integrazione tra applicazioni in C e database relazionali.
