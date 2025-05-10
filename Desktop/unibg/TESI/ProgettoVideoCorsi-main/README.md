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

## Struttura del Progetto (con focus funzionalità docente)

```
src/
├── main/
│   ├── java/
│   │   ├── controller/
│   │   │   ├── HomeDocenteController.java      # Home docente, lista corsi
│   │   │   ├── GestisciCorso.java             # Gestione capitoli di un corso
│   │   │   ├── ModificaCapitolo.java          # Modifica capitolo e quiz
│   │   │   ├── gohome.java                    # (redirect home docente)
│   │   │   ├── VerifyQuiz.java                # Convalida quiz/corsi
│   │   ├── dao/
│   │   │   ├── Chapter_CourseDao.java         # DAO per corsi/capitoli
│   │   │   ├── QuizDAO.java                   # DAO per quiz
│   │   └── ...
│   └── webapp/
│       └── WEB-INF/
│           └── jsp/
│               ├── homeDocente.jsp            # Home docente (lista corsi)
│               ├── gestisci_corso.jsp         # Lista capitoli di un corso (docente)
│               ├── modifica_capitolo.jsp      # Modifica capitolo e quiz
│               ├── esami.jsp                  # Convalida corsi/quiz
│               └── ...
└── test/                                      # Test unitari
```

## Requisiti di Sistema

- Java 19
- Tomcat 11.0.6
  - **Percorso locale su questo dispositivo:** `/Users/stefanocalza/apache-tomcat-11.0.6`
- Maven
- PostgreSQL (il backend attuale usa PostgreSQL, non MySQL)

## Configurazione e Avvio

1. **Clonare il repository:**
   ```bash
   git clone https://github.com/StefanoCalza/Backup_Tesi_Cursor.git
   ```

2. **Configurare il database:**
   - Importare lo schema del database PostgreSQL (vedi cartella `Database/`)
   - Configurare le credenziali in `src/main/java/utils/ConnectionHandler.java` oppure tramite i parametri in `web.xml`.

3. **Compilare il progetto:**
   ```bash
   mvn clean package -DskipTests
   ```

4. **Deploy su Tomcat:**
   - Copiare il file WAR generato in `target/progettovideocorsi.war`
   - Deployare su Tomcat 11.0.6:
     ```bash
     cp target/progettovideocorsi.war /Users/stefanocalza/apache-tomcat-11.0.6/webapps/
     /Users/stefanocalza/apache-tomcat-11.0.6/bin/shutdown.sh
     /Users/stefanocalza/apache-tomcat-11.0.6/bin/startup.sh
     ```

5. **Accesso all'applicazione:**
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

## Funzionalità Disponibili

### Funzionalità Studente
- **Login/Logout**
  - Controller: `CheckLogin.java`, `gotoLogin.java`, `gohome.java`
  - JSP: `login.jsp`
- **Visualizzazione corsi disponibili e iscrizione**
  - Controller: `GetCourse.java`, `SubscribeCourse.java`, `ChapterController.java`, `subscribe.java`
  - JSP: `courses.jsp`, `chapter.jsp`, `course.jsp`, `chapter_content.jsp`, `course_content.jsp`
- **Visualizzazione capitoli e video**
  - Controller: `GoToVideo.java`, `ChapterController.java`
  - JSP: `video.jsp`, `chapter.jsp`, `chapter_content.jsp`
- **Quiz e risultati**
  - Controller: `GetQuiz.java`, `CheckQuiz.java`
  - JSP: `quiz.jsp`, `quiz_result.jsp`, `quiz_result_content.jsp`, `risultato.jsp`
- **Visualizzazione esami/corsi completati**
  - Controller: `GetPassedExam.java`
  - JSP: `passed_exam.jsp`, `passed_exam_content.jsp`
- **Gestione profilo e cambio password**
  - Controller: `goProfile.java`, `ChangePassword.java`, `gochangepassword.java`
  - JSP: `profilo.jsp`, `changepassword.jsp`, `profile_content.jsp`

### Funzionalità Docente
- **Home docente e visualizzazione corsi**
  - Controller: `HomeDocenteController.java`, `gohome.java`
  - JSP: `homeDocente.jsp`
- **Gestione capitoli di un corso**
  - Controller: `GestisciCorso.java`, `ChaptersDocente.java`
  - JSP: `gestisci_corso.jsp`, `chapters_docente.jsp`
- **Modifica capitolo e quiz**
  - Controller: `ModificaCapitolo.java`
  - JSP: `modifica_capitolo.jsp`
- **Creazione corso/capitolo/quiz**
  - Controller: `createCourse.java`, `createChapter.java`, `creaCorso.java`
  - JSP: `Create_chapter.jsp`, `confirm_add_chapter.jsp`
- **Convalida corsi/quiz (verifica quiz da correggere)**
  - Controller: `VerifyQuiz.java`, `gotoEsami.java`
  - JSP: `esami.jsp`, `convalida_quiz.jsp`, `risultato_docente.jsp`
- **Gestione profilo e cambio password docente**
  - Controller: `goProfile.java`, `ChangePassword.java`, `gochangepassword.java`
  - JSP: `profilo.jsp`, `changepassword.jsp`

### DAO principali
- `Chapter_CourseDao.java` — gestione corsi/capitoli/iscrizioni
- `QuizDAO.java` — gestione quiz e domande
- `UserDAO.java` — gestione utenti
