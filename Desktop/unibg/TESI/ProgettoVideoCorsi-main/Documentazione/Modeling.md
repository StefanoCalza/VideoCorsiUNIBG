# Modeling 
### Diagramma dei casi d'uso 
Per esprimere in modo schematico i requisiti del cliente si è deciso di partire da un diagramma dei casi d’uso, per descrive le azioni che 
possono essere svolte (i casi d’uso) e coloro che le svolgono (gli attori). <br>
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/UML_diagrams/PNG/use_case_diagram-1.png)
Le due macro-famiglie di attori sono “Bot” e “Persona”, quest’ultimo, a sua volta, si divide in “Utente” e “Docente”.   <br>
Le azioni comuni a tutte le persone sono l’iscrizione alla piattaforma, la modifica del profilo e il login. Dopo aver effettuato il login saranno visualizzate schermate diverse in base alla tipologia di accesso effettuata, che può essere da parte di un utente o di un docente. L’utente, dopo aver effettuato il login, può iscriversi a un corso, e per svolgerlo dovrà visualizzare i video, eseguire i quiz, iscriversi all’esame ed effettuare il pagamento. I docenti hanno la possibilità di creare i corsi e caricare i relativi video e quiz. Il bot, ovvero il sistema, si occupa principalmente di correggere i quiz. Se il quiz registra un esito insufficiente, il sistema rimanda l’utente alla visualizzazione del video del quale non si è superato il quiz finché il quiz non avrà esito positivo. 
### Diagramma delle classi 
Per visualizzare gli oggetti appartenenti al sistema, le loro caratteristiche e i tipi di relazioni che ci sono fra loro, si è disegnato il diagramma delle classi. <br>
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/UML_diagrams/PNG/class_diagram-1.png)
“Persona” è una classe astratta, in quanto generalizzazione di “Utente” e “Docente”: solo le sottoclassi di “Persona” possono essere istanziate, e non “Persona” stessa. Gli altri oggetti di questo diagramma sono “Corso”, “Capitolo”, “Quiz”,  e “Bot”.  <br>
Per ogni oggetto sono stati definiti uno o più attributi e alcuni metodi, e sono state definite le associazioni fra i vari oggetti e le loro cardinalità. Sono stati inseriti solo gli attributi e i metodi più significativi di ogni oggetto, in quanto mettendoli tutti ci sarebbe stato un sovraccarico e disordine di informazioni che avrebbero distolto l’attenzione dallo scopo di dare una rappresentazione schematica e generale degli oggetti e le loro relazioni all’interno del sistema. <br>
### Diagramma di stato 
Di seguito sono visualizzati gli stati che possono essere assunti durante l’esecuzione dell’applicazione. Si è deciso di concentrarsi sugli stati di “Utente”, “Docente” e “Bot”. <br>
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/UML_diagrams/PNG/state_machine_diagram-1.png) 
“Utente” può trovarsi nei seguenti stati: “Inizio” (stato sottomachina), “Corso” (stato composito), “Video” e “Quiz”. Con la guardia “errori>N” per passare dallo stato “Quiz” allo stato “Video” si verifica il fatto che, se sono stati commessi più di N errori nel quiz, si deve ritornare allo stato “Video”  e rivedere la videolezione per poter rifare il quiz; La guardia “quiz=Y” verifica che si sia arrivati all’ultimo quiz. <br>
Dopo essere entrato nello stato “Inizio” (stato sottomacchina), “Docente” entra nello stato “Corso”, e da lì può passare o allo stato “Video” o allo stato “Quiz”.<br>
Bot può trovarsi solo nello stato “Quiz” (nel quale si occuperà della correzione del quiz). 
 <br>
### Diagramma di sequenza 
E’ poi stato realizzato il diagramma di sequenza per visualizzare lo scambio di messaggi e dati da parte dei diversi partner di interazione e descrivere le comunicazioni fra essi. Si è deciso di rappresentare in particolare lo scambio di messaggi nella fase di creazione di un nuovo corso, con il relativo caricamento di video e quiz. <br>
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/UML_diagrams/PNG/sequence_diagram-1.png) 
I partner di interazione iniziali sono “Docente” e “Database”. Da “Database” sono creati gli oggetti “Corso”, “Video” e “Quiz”. <br>
Lo scambio di messaggi fra “Video” e “Quiz” è all’interno di un frame di loop, in quanto, essendo un corso composto da più video e più quiz, può esserci un continuo scambio di messaggi fra questi nella fase di creazione.  La guardia “DB!=full” controlla che, alla richiesta di creazione di un nuovo video o quiz, ci sia memoria sufficiente all’interno del database. <br>

### Diagramma delle attività
È stato infine disegnato il diagramma delle attività, per evidenziare gli aspetti procedurali e le varie attività presenti in questa applicazione.  <br>
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/UML_diagrams/PNG/activity_diagram_project-1.png)
Per indicare il principale responsabile di ogni attività sono state effettuate tre partizioni: “Docente”, “Utente” e “Bot”. 
Le attività a carico di “Docente” sono “Crea corso”, “Carica video” e “Crea quiz”, quelle a carico di “Utente” sono “Sostiene corso”, “Sostiene quiz” e “Contatta assistenza” (quest’ultima è un’eccezione che viene attivata quando ci sono errori da parte del sistema), mentre quelle a carico del “Bot” sono “Corregge quiz”, “Registra quiz” e l’invio di un segnale, “Invia risultato”, che è l’invio del risultato relativo al quiz sostenuto. 
<br>
