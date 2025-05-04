# VideoCorsi UNIBG - Piattaforma di E-Learning

## Stato Attuale del Progetto

Il progetto è attualmente in uno stato funzionante con le seguenti funzionalità implementate:

### 1. Sistema di Autenticazione
- Login con username/password
- Gestione degli errori di autenticazione
- Reindirizzamento basato sul ruolo dell'utente
- Sessioni utente gestite correttamente

### 2. Interfaccia Utente
- Design moderno e responsive
- Template system con JSP
- Navbar semplificata nella pagina di login
- Messaggi di errore intuitivi
- Card-based layout per i contenuti

### 3. Funzionalità Principali
- Visualizzazione corsi
- Gestione capitoli
- Sistema di quiz
- Gestione profilo utente
- Visualizzazione esami passati

## Struttura del Progetto

```
src/
├── main/
│   ├── java/
│   │   ├── controller/     # Controller Java
│   │   ├── dao/           # Data Access Objects
│   │   ├── beans/         # Java Beans
│   │   └── utils/         # Utility classes
│   └── webapp/
│       └── WEB-INF/
│           └── jsp/       # Template JSP
└── test/                  # Test unitari
```

## Requisiti di Sistema

- Java 19
- Tomcat 11.0.6
- Maven
- MySQL (o altro database compatibile)

## Configurazione e Avvio

1. Clonare il repository:
   ```bash
   git clone https://github.com/StefanoCalza/Backup_Tesi_Cursor.git
   ```

2. Configurare il database:
   - Importare lo schema del database
   - Configurare le credenziali in `ConnectionHandler.java`

3. Compilare il progetto:
   ```bash
   mvn clean package
   ```

4. Deploy su Tomcat:
   - Copiare il file WAR generato in `target/progettovideocorsi.war`
   - Deployare su Tomcat

5. Accesso all'applicazione:
   - URL: `http://localhost:8080/progettovideocorsi/`
   - Login: `http://localhost:8080/progettovideocorsi/goLogin`

## Endpoint Principali

- Login: `/goLogin`
- Homepage: `/index.jsp`
- Corsi: `/GetCourse`
- Profilo: `/GetProfile`
- Esami Passati: `/GetPassedExam`
- Quiz: `/GetQuiz`

## Modifiche Recenti

### Login System
- Redesign completo della pagina di login
- Gestione errori migliorata
- Campo password rinominato da 'password' a 'pwd'
- Messaggi di errore visualizzati nel form
- Link logo navbar aggiornato per reindirizzare a index.jsp

### Template System
- Implementazione di template.jsp come base
- Creazione di JSP specifici per contenuti:
  - chapter.jsp e chapter_content.jsp
  - course.jsp e course_content.jsp
  - esami_content.jsp
  - passed_exam_content.jsp
  - profile.jsp e profile_content.jsp
  - quiz_result.jsp e quiz_result_content.jsp
  - video_content.jsp

### Controller Updates
- Miglioramento gestione autenticazione
- Gestione sessioni ottimizzata
- Feedback utente migliorato

## Note Importanti

- Il sistema di login usa username/password (non email)
- Gli errori di autenticazione sono mostrati nel form
- La navbar è semplificata nella pagina di login
- Il logo reindirizza alla homepage

## Troubleshooting

1. Errori di Connessione Database:
   - Verificare le credenziali in ConnectionHandler.java
   - Assicurarsi che il database sia in esecuzione

2. Errori di Compilazione:
   - Verificare la versione di Java (richiesta 19)
   - Aggiornare le dipendenze Maven

3. Errori di Deploy:
   - Verificare la versione di Tomcat (richiesta 11.0.6)
   - Controllare i permessi dei file

## Supporto

Per problemi o domande, contattare:
- Email: [inserire email]
- Repository: https://github.com/StefanoCalza/Backup_Tesi_Cursor.git
