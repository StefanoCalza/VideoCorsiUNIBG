# Database 
Di seguito è presentato il database che viene utilizzato nel software “Piattaforma Videocorsi”. <br>
Le tabelle che compongono il database sono le seguenti: <br>
+	User: contiene i dati relativi agli utenti della piattaforma, in particolare “id”, “username” e “password”, che rappresentano le credenziali di accesso alla piattaforma, “role”, che indica la tipologia di utente (corsista o un docente), “nome”, “cognome”, “e-mail” e “skillscard” (numero identificativo per accedere agli esami ICDL). <br>
+	Courses: contiene i dati relativi ai corsi presenti sulla piattaforma. È formata dagli attributi “idCourses”, ovvero il codice identificativo univoco di ogni corso, “name” e “description” del corso. <br>
+	Chapter: contiene i dati relativi ai capitoli di ogni corso. I suoi attributi sono: “chapter”, “name”, “video”, “is final”, ovvero un attributo che indica se si tratta dell’ultimo capitolo e “description”. <br>
+	Iscrizioni: contiene la relazione fra utente con corso e capitolo. L’attributo “passed” indica se un determinato capitolo è stato passato oppure no. <br>
+	Quiz_provvisorio: contiene i dati relativi ai quiz che si trovano alla fine di ogni capitolo. È formato dagli attributi “idquiz_provvisorio”, che rappresenta il codice identificativo del quiz, “domanda”, che contiene il quesito posto nel quiz, “quesito1”, “quesito2”, “quesito3”, “quesito4”, che sono le possibili risposte alla domanda, e “risposta corretta”. <br>
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/Documentazione/immagine%20tabelle%20database.jpeg) <br>
 <br> Di seguito è rappresentato poi lo schema ER, che mostra le entità e le relazioni che modellano l’applicazione. <br> 
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/UML_diagrams/PNG/ER_diagram.drawio-1.png)
