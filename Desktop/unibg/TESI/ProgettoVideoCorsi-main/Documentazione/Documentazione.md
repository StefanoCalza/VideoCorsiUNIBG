# **PROGETTO DI INGEGNERIA DEL SOFTWARE**
### __Anno accademico 2022/2023__
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/Documentazione/Immagini/logo.jpg)
# Sommario 
### Software life cycle 
### Configuration management
  Struttura del repository <br>
  Issue <br>
  Branch <br>
  CCB <br>
### People management 
### Software quality
  Funzionamento del prodotto <br>
  Revisione del prodotto <br>
  Transazione del prodotto <br>
### Requirements engineering 
### Modelling 
  Diagramma dei casi d'uso <br>
  Diagramma delle classi <br>
  Diagramma di stato <br>
  Diagramma di sequenza <br>
  Diagramma delle attività <br>
### Software architecture 
### Software design 
### Software testing e manutenibilità
### Database
### Applicazione 

# Software life cycle
Per il processo di sviluppo il team ha scelto di seguire il modello MoSCoW, che prevede la suddivisione dei requisiti in: <br>
+	Must have: requisiti assolutamente necessari. <br>
+	Should have: requisiti importanti ma non assolutamente necessari. <br>
+	Could have: requisiti che verranno implementati se il tempo lo consente. <br>
+	Won’t have: requisiti che verranno eventualmente implementati in versioni future. <br>

I requisiti, suddivisi nelle varie categorie, si trovano alla voce “Requirements engineering”. <br>
Per lo sviluppo si segue poi il modello a spirale: si sceglie un requisito da implementare, lo si implementa e si procede con il testing. Dopo di che si procede iterativamente con un altro requisito. Ovviamente l’ordine di implementazione delle funzionalità segue i requisiti e la loro classificazione: quindi verranno prima implementati tutti i requisiti must have, poi should have e così via. <br>
Alcune linee guida che il team ha deciso di seguire nel processo di sviluppo sono: <br>
+	Sviluppare la documentazione man mano che si implementa il codice, tenendo traccia delle decisioni e dei cambiamenti più importanti. <br>
+	Il codice scritto da una persona viene poi verificato da almeno un altro membro del team. Questo permette di eseguire, già in fase di sviluppo, un primo test sul codice. <br>
+	Non c’è una struttura gerarchica, tutti i membri del team sono allo stesso livello. Questo permette ad ognuno di esprimere le proprie idee e cooperare insieme per trovare la soluzione migliore. <br>
+	Settimanalmente si svolgono delle riunioni per controllare il lavoro svolto, confrontarsi sugli aspetti critici e programmare il lavoro da fare nei giorni seguenti. <br>
+	Per l’utilizzo di GitHub si seguono le linee guida espresse alla voce “Configuration management”. <br>

# Configuration management 
Tutto il lavoro svolto (codice, documentazione, testing, ecc) è salvato su un repository di Github. <br>
### Struttura del repository
All’interno del repository sono presenti le seguenti cartelle e file: <br>
+	.settings: <br>
+	Documentazione: contiene la documentazione del progetto. In particolare, saranno presenti il project plan, la specifica dei requisiti e la documentazione da consegnare al cliente.  <br>
+	Ing_sw: contiene il codice back-end dell’applicazione, sviluppato con Java e web servlet e con SQL per la parte di database, il codice front-end dell’applicazione implementato con HTML, CSS e Bootstrap e i test del progetto.  <br>
+	.classpath: file usato da Eclipse per indicare il classpath di Java. <br>
+	.gitignore: file nel quale ogni riga indica un file che deve essere ignorato da GitHub. <br>
+	.project: <br>
+	README: contiene informazioni sul progetto e sul repository. <br>
### Issue
Ogni volta che c’è un problema, la necessità di revisione, o uno scambio di idee particolarmente rilevanti per il progetto, di cui è quindi meglio tener traccia, viene aperta una issue. Ogni membro del team ha la possibilità di aprire una issue ogni volta che lo ritiene necessario.  <br>
In ogni issue deve essere inserito un titolo che indichi l’argomento della issue, una descrizione, in cui si espone il problema, e un’etichetta, in modo da poter catalogare la issue. Le principali etichette utilizzate sono: “documentation”, per le issue riguardanti la documentazione; “help wanted”, per richiedere aiuto su problemi di qualsiasi natura; “bug”, per segnalare eventuali errori nel codice; “enhancement”, per le nuove funzionalità. Oltre alle etichette standard fornite da GitHub sono state create altre due etichette: “testing”, per tutte le issue riguardanti i test, e “change request”, per le proposte di modifica da presentare al CCB. Una issue può inoltre essere assegnata alle persone direttamente coinvolte. Una volta risolto il problema, la issue viene poi chiusa, in modo che si possa tenere traccia di essa ma che non compaia nella schermata delle issue aperte, ad indicare il fatto che sia stata risolta. <br>
Per comunicazioni meno formali e per l’organizzazione delle riunioni, si utilizzano anche WhatsApp e Discord. 
### Project board 
Per l’organizzazione del lavoro, oltre alle issue di github, il team ha utilizzato una project board. La project board utilizzata segue il modello Kanban, ovvero è suddivisa in: “Not started” per i task non ancora iniziati, “In progress” per i task che sono in fase di sviluppo, “In review” per i task da revisionare prima dell’approvazione, “Completed” per i task completati, e “Cancelled” per i task che sono stati cancellati. <br>
Per la visualizzazione grafica e la gestione dei task, il team ha utilizzato il software online nTask, che permette sia la creazione di task che la visualizzazione grafica sulla board. Ad ogni task è inoltre possibile assegnare una priorità, una data di inizio e di fine, e assegnarlo a un determinato membro del team. <br>
Di seguito è presentato uno screen di esempio della project board al giorno 01/03/2023. <br>
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/Documentazione/project%20board%20def.jpg)
### Branch 
Il branch principale è il main. In questo branch, alla fine del progetto, sarà presente tutto il codice, il testing e la documentazione definitivi revisionati da tutti i membri del team. <br>
Altri branch vengono poi creati per continuare a lavorare su codice e documentazione, apportando modifiche e miglioramenti, senza interferire sul codice del progetto principale. <br>
Prima di eseguire una pull request per unire un branch al branch “main”, si deve mandare una richiesta al CCB (Configuration Change Board). Solo dopo l’approvazione da parte del CCB, il branch in questione potrà essere unito al branch “main”. <br>
Oltre al branch main, i principali branch sviluppati in questo progetto sono il branch “UML-diagrams” per la creazione dei diagrammi UML, il branch “Documentazione” per la stesura della documentazione e il branch “Testing” per lo sviluppo di test per il codice, il branch “Bootstrap_Graphic” per quanto riguarda la parte di front-end, e il branch “Aggiornamento_Graphic” per l’implementazione della grafica del branch “Bootstrap_Graphic” nel codice del “main”, prima di unire i branch con un pull e merge, in modo tale da avere un’ulteriore backup in caso di imprevisti, e il branch "Specifica-dei-Requisiti" per l'implementazione del documento della specifica dei requisiti.  <br>
### CCB
Il CCB (Configuration Change Board), è un gruppo di controllo di configurazione, ovvero un organismo che garantisce che qualsiasi modifica sia adeguatamente verificata, autorizzata ed eseguita. <br>
In questo progetto i membri del CCB sono Calzà Stefano e Rasmo Martina. <br>
Qualsiasi modifica proposta è chiamata “change request”. Una change request viene presentata tramite issue su GitHub al CCB. Il CCB, dopo aver esaminato la proposta e gli elementi connessi ad essa, valuta la change request, decidendo se approvarla o negarla.  Se la modifica è approvata viene eseguita e vengono aggiornate e modificate di conseguenza le parti interessate, sia per quanto riguarda il codice che per quanto riguarda la documentazione. È compito del CCB assicurarsi che venga tutto aggiornato in seguito all’approvazione della change request. Nel caso la change request arrivi da parte di uno dei membri del CCB sarà compito dell’altro membro valutare, ed eventualmente accettare la modifica. <br>
Di seguito sono presentati i diagrammi UML di sequenza e di stato che descrivono come viene gestita una change request. 
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/UML_diagrams/PNG/sequence_diagram_ChangeRequest-1.png)
<br>
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/UML_diagrams/PNG/state_machine_diagram_ChangeRequest-1.png)


# People management 
I membri del team sono: Stefano Calzà, Lorenzo Longaretti, Martina Rasmo. <br>
Si è deciso di adottare una configurazione divisionale: ogni divisione (in questo caso back-end, front-end, documentazione, testing e CCB) ha molta autonomia nello svolgere il compito che gli è stato assegnato, e il coordinamento avviene autonomamente tramite riunioni fissate ogni settimana, mentre la comunicazione avviene tramite issue di github. <br>
Il team è organizzato secondo il modello a matrice: per ogni divisione sono assegnate le persone a cui dovranno lavorare, suddivise in responsabile e controllore. Il responsabile sarà il principale incaricato nell’eseguire quella parte di progetto, a cui è poi affiancato il controllore, il quale aiuterà il responsabile a portare a termine il compito e controllerà che tutto proceda nel verso giusto. <br>
La divisione decisa dal team è la seguente: <br>
| |Front-end|Back-end|Documentazione|Testing|CCB|
|-|---------|--------|--------------|-------|---|
|Stefano Calzà|Responsabile| | Controllo|Responsabile|Responsabile| 
|Lorenzo Longaretti|Responsabile|Responsabile| |Controllo| |
|Martina Rasmo| |Controllo|Responsabile|Responsabile|Responsabile <br>

Con questa organizzazione ogni componente del team sarà abbastanza libero di svolgere il proprio compito in autonomia.  <br>


# Software quality
L’obiettivo del team, per quanto riguarda la qualità, è quello di rispettare i fattori di qualità di McCall, divisi in tre categorie: “Funzionamento del prodotto”, “Revisione del prodotto” e “Transazione del prodotto”. <br> 
### Funzionamento del prodotto
Il team si propone di rispettare i fattori di qualità riguardanti il funzionamento del prodotto fin dall’inizio, e si impegna a controllare che il progetto li rispetti man mano che le funzionalità saranno implementate. <br>
+	Correttezza: il prodotto software realizzato soddisfa tutti i requisiti Must have concordati con il cliente. Inoltre, altri requisiti delle categorie Should have e Could have saranno già implementati nella prima versione. Nelle versioni successive sarà poi possibile implementare ulteriori funzionalità. <br>
+	Affidabilità: il prodotto software è affidabile, in quanto svolge sempre la funzionalità richiesta dall’utente senza imprevisti. <br>
+	Efficienza: il software, per funzionare, dovrà disporre di una connessione a internet. <br>
+	Integrità: il prodotto software realizzato è sicuro, in quanto nel database la password viene crittografata usando la funzione hash MD5. Ulteriori funzioni riguardanti la sicurezza saranno poi protagoniste di future release.<br>
+	Usabilità: il prodotto software realizzato è estremamente intuitivo e facile da utilizzare. Non sono richieste particolari abilità per poterlo utilizzare; inoltre, la guida all’uso per l’utente spiega in modo semplice e chiaro come poterlo utilizzare. <br>

Per verificare questi fattori, in particolare correttezza, efficienza e affidabilità, oltre ai classici test, verrà eseguita un’ulteriore verifica, che consiste nel far provare, testare e verificare l’applicazione ad alcune persone della fascia d’età dai 13 ai 60 anni, che rappresentano un campione eterogeneo dei futuri corsisti. <br>
Inoltre, dopo il rilascio dell’applicazione, verranno erogati dei brevi tutorial per spiegare, sia dal punto di vista di un corsista che di un docente, le funzionalità e come utilizzare il software. <br>

### Revisione del prodotto 
Per quanto riguarda la categoria della revisione del prodotto e della transazione del prodotto, si cercherà di strutturare il progetto in modo che rispetti queste qualità, tenendo in considerazione che verranno rispettate appieno e migliorate in seguito ad aggiornamenti previsti dopo la consegna del progetto. <br>
+	Manutenibilità: per favorire la manutenibilità si è deciso di separare il lato front-end con il lato back-end. Inoltre, la parte di gestione del database è nettamente distinguibile dalle funzioni del lato back-end. La manutenibilità è anche favorita dall'architettura scelta, Model View Controller e 3 Layer. <br>
+	Testabilità: il prodotto software è facilmente testabile sia manualmente che tramite test automatici; nonché sia tramite test di unità che test di integrazione. <br>
+	Flessibilità: come per la manutenibilità, la separazione delle componenti facilita i cambiamenti, e quindi rende il software più flessibile. <br>
### Transazione del prodotto
+	Portabilità: il prodotto software al momento funziona tramite Eclipse e bisogna disporre del codice e del database aggiornato.<br> 
 In futuro verrà acquistato un server remoto in cui salvare codice e database e la piattaforma sarà usufruibile tramite internet, e quindi sarà facilmente portabile. <br>
+	Riutilizzabilità: questo aspetto verrà migliorato negli aggiornamenti che seguiranno il rilascio del software. <br>
+	Interoperabilità: in versioni successive il prodotto software potrà essere facilmente integrato con altri servizi e funzionalità. <br>


# Requirements engineering 
Il primo passo per lo sviluppo dell’applicazione software è l’ingegneria dei requisiti. 
Essendo “le fondamenta” del progetto, e avendo un importante impatto sulla riuscita, la qualità e le tempistiche dell’applicazione, 
si è dedicato molto tempo a questa fase. <br>
Per cogliere al meglio le caratteristiche e le funzioni che l’applicazione avrebbe dovuto rispettare, nella fase dell’elicitazione si è fatto uso della tecnica 
dell’etnografia e della prototipazione. <br>
In particolare, per quanto riguarda l’etnografia, dopo un’iniziale riunione con il cliente, un membro del team, Stefano, 
è andato per qualche settimana alla sede di ICDL a osservare il lavoro del personale che avrebbe fatto uso dell’applicazione, ovvero docenti, esaminatori e utenti finali. Grazie all’etnografia si è così riusciti a fare chiarezza sulle reali funzioni necessarie alla piattaforma. <br>
Si è applicato poi il metodo della prototipazione, in questo caso fornendo un prototipo solo dal punto di vista grafico e non funzionante, per mostrare al cliente come sarebbe stata l’applicazione finale e descrivendone in riunione le varie funzionalità per ogni schermata. <br>
Alla fine della fase di elicitazione, dopo l’approvazione da parte del cliente dei requisiti discussi nelle varie riunioni ed eventuali negoziazioni, si è prodotta la specifica dei requisiti, che fornisce il punto di partenza per la progettazione. <br> 
Per classificare i requisiti si è utilizzata la metodologia MoSCow, ovvero i requisiti sono stati suddivisi in Must Have, Should Have, Could Have e Won’t Have. <br> 
Di seguito è riportato l’elenco e la classificazione dei requisiti, ulteriori dettagli sono forniti nella specifica dei requisiti allegata. <br>
#### Must have: 
•	Implementazione della pagina home <br>
• Implementazione della pagina di login <br>
•	Implementazione della pagina di iscrizione ai corsi <br>
•	Implementazione della pagina di creazione dei corsi <br>
•	Implementazione della pagina di visualizzazione dei video <br>
•	Implementazione della pagina di esecuzione dei quiz <br>
• Visualizzazione dati account <br>
#### Should have:  <br>
•	Implementazione dell’obbligo del superamento del quiz per passare al capitolo successivo <br> 
#### Could have:  <br>
•	Implementazione della sicurezza degli account <br>
•	Implementazione di una chat utente-docente <br>
•	Visualizzazione delle risposte errate <br>
• Implementazione pagina di iscrizione agli esami <br>
#### Won’t have:  <br>
•	Possibilità di modifica del profilo  <br>
•	Implementazione del pagamento  <br>

![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/Documentazione/piramide%20requisiti.jpg)
Per ulteriori informazioni sui requisiti si può consultare la specifica dei requisiti al seguente link: [specifica dei requisiti](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/Documentazione/Specifica%20dei%20requisiti.md)
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

# Software architecture 
L’architettura implementata segue uno stile a strati applicando il pattern Model View Controller (MVC). <br>
È stato scelto l’approccio Model View Controlle in quanto, dividendo il software in parti diverse, permette una più semplice gestione del codice, favorisce lo sviluppo e la manutenzione, rendendolo possibile da aggiornare e modificare indipendentemente in ognuno dei 3 livelli. Inoltre, questa architettura permette il riutilizzo di singoli componenti per progetti futuri. E' stato scelto perché abbiamo deciso di usare un thin client, in cui viene delegata al client solo la funzione di View. <br> <br>
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/Documentazione/architettura%20giusta%20.png) <br> <br>
Rappresentazione grafica delle scelte progettuali: 

|Elemento|Descrizione|
|--------|------------|
|**Problema**|Il sistema deve essere strutturato in modo che sia manutenibile, sicuro e robusto.|
|**Decisione**|Architettura a 3 livelli, ovvero Presentation (la parte HTML), Business Logic (DAO e server) e Data Access (database) seguendo il pattern MVC, composto dal Model (il database), View (il front-end), e Controller (i DAO e il server).|
|**Stato**|Approvato.|
|**Presupposti**|Il sistema non ha requisiti rigidi in tempo reale.|
|**Alternativa**|Nessuna.|
|**Motivazione**|Suddividendo il software in 3 componenti si favorisce la manutenzione, la scrittura del codice e del testing, e la robustezza in quanto modifiche a uno dei componenti non influiscono sugli altri componenti. Inoltre, i componenti possono essere riutilizzati singolarmente (ad esempio il DataBase per una piattaforma simile o le pagine HTML per la visualizzazione di interfacce simili).|
|**Implicazioni**|Nessuna.|
|**Appunti**|Nella gerarchia i tre livelli sono, dal più basso al più altro, Data Access, Business Logic e Presentazione.| <br>

Nell’architettura a strati, abbiamo una separazione delle funzionalità logiche su 3 livelli: <br>
+	Presentation: rappresenta la visualizzazione dei dati, nel nostro caso è formato dal codice HTML. <br>
+	Business Logic: rappresenta le relazioni e le logiche applicative delle entità, nel nostro caso è formato dai controller, ovvero i DAO e il server. <br>
+ Data Access: contiene tutto ciò che riguarda la persistenza dei dati, nel nostro caso è il Database.  <br>

Struttura gerarchica: 
1. A livello di gerarchia il Data Access è il livello più basso, che non può usufruire di nessun servizio offerto dagli altri livelli; 
2. A livello intermedio c’è il Business Logic, che sfrutta i servizi offerti dal Data Access; 
3. Il livello superiore è il livello Presentation, che può usufruire di tutti i servizi offerti dai livelli sottostanti. <br> <br>
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/Documentazione/architettura%203%20layer.png)


Nel pattern MVD, l’applicazione è separata in logica di presentazione e logica di business. I componenti di questo pattern architetturale sono: <br>
+	Model: è il database, che si occupa di manipolare i dati e i metodi per accedervi. <br>
+	View: è il front-end, sviluppato con Bootstrap nel linguaggio HTML e CSS per la visualizzazione vera e propria dell’interfaccia utente. <br>
+	Controller: è la parte di back-end, composta dalle interrogazioni dei DAO (Data Access Object) e del server che gestiscono le interazioni dell’utente con il software. <br>
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/Documentazione/architettura%20MVC.jpg)
<br>

# Design pattern 
I design pattern utilizzati dal team per lo sviluppo dell’applicazione sono il pattern singleton e il pattern read only. <br>
Il pattern singleton si assicura che una classe abbia una sola istanza e che possa essere navigata tramite determinati metodi. 
È stato scelto per rendere static la connessione al database, in questo modo c’è una sola istanza di connection. <br>
Il pattern singleton è stato implementato nel seguente modo: <br>
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/Documentazione/design%20pattern.jpeg)
Il pattern read only, invece, gestisce i privilegi di modifica di determinate classi.
Quest’ultimo è stato scelto di applicarlo ai beans in quanto i DAO devono poter modificare i beans per registrare i valori, mentre i controller devono poter solo accedere ai beans. 

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

# Testing e manutenibilità 
Durante lo sviluppo del back-end, come prima forma di test, si è svolta la lettura e
l’ispezione del codice da parte di un membro del team che non ha scritto il codice
da controllare. Già in questa fase è stato così possibile individuare errori e punti
critici del codice.<br>
Sono stati poi eseguiti una serie ti test di unità tramite Junit. <br>
Di seguito sono riportati alcuni dei test implementati. <br>

![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/Documentazione/Immagini/test%20subscribe%20user.jpeg) 

In questo test viene testata l’iscrizione di un utente ad un capitolo di un corso
tramite i metodi assertEquals, che confrontano il valore del risultato atteso con il
valore ottenuto. In questa funzione prima viene effettuato l'inserimento e poi viene selezionato, dal database, quello che è stato modificato e viene controllato che sia coerente a quanto desiderato.<br>

![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/Documentazione/Immagini/test%20change%20password%20.jpeg)

Con questo test viene testata la funzione per la modifica della password. <br>
Inoltre, sono state svolte alcune attività di refactoring per la manutenzione del
codice. Per eseguire il refactoring il team si è basato sui 22 bad smells di Fowler,
è stato eliminato il codice duplicato o inutilizzato, sono stati completati i commenti,
ecc. <br>
E' stato infine eseguito un test di copertura dalla piattaforma eclipse. <br>
Di seguito sono riportati i risultati del test di copertura: <br>

![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/Documentazione/Immagini/coverage.jfif)

Come si può notare è testato tutto a livello soddisfacente. Per quanto riguarda i controller sono stati testati a mano e saranno ulteriormente testati nelle prossime versioni tramite mockito.
# L'applicazione 
Di seguito è presentata una breve descrizione delle pagine dell’applicazione visualizzate dagli utenti. <br> 
### Home
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/Documentazione/Immagini/home.jfif)
Questa è la pagina introduttiva visualizzata da tutti gli utenti. Tramite il bottone “LOGIN” è possibile effettuare l’accesso alla propria area riservata. In questa pagina è presente una breve introduzione a ICDL, alcuni dei corsi proposti e le certificazioni tramite esami. È inoltre possibile avere una piccola panoramica sui formatori ICDL. <br> 
### Login 
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/Documentazione/Immagini/login.jfif)
Cliccando sul bottone “LOGIN” è possibile, inserendo le proprie credenziali (username e password), accedere alla propria area riservata. Le schermate visualizzate di seguito saranno diverse in base a se l’accesso viene fatto da un corsista o da un docente. 
### Home corsista 
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/Documentazione/Immagini/corsi%20a%20cui%20sei%20iscritto.jfif)
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/Documentazione/Immagini/corsi%20a%20cui%20non%20sei%20iscritto.jfif)
Dopo avere effettuato il login, questa è la pagina home visualizzata dai corsisti. In questa pagina è possibile visualizzare i corsi a cui il corsista è iscritto e i corsi ai quali il corsista ancora non è scritto. Premendo il bottone “Vai al corso” della sezione “corsi in cui sei iscritto” si apre la pagina relativa al corso. Premendo il bottone “Iscriviti” della sezione “corsi in cui non sei iscritto” viene effettuata l’iscrizione al corso.  Tramite il menu in alto a destra è possibile tornare alla Home, visualizzare il profilo, visualizzare la pagina di reindirizzamento alla piattaforma degli esami o effettuare il logout. <br> 
### Visualizzazione corsi 
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/Documentazione/Immagini/a10a87c5-9def-4b4b-b166-ed66cdcd1b44.jfif)
Cliccando “Vai al corso” nella pagina Home dei corsisti, viene visualizzata la seguente pagina, che permette di visualizzare il corso in generale, suddiviso per capitoli, ognuno accompagnato da una breve descrizione del contenuto. 
### Visualizzazione video 
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/Documentazione/Immagini/visualizza%20video.jfif)
Dalla visualizzazione dei corsi, premendo il tasto “vai al video”, si apre la seguente pagina. Questa pagina permette di visualizzare il video relativo al capitolo selezionato. Una volta visualizzato il video, cliccando su “vai al QUIZ”, si apre la pagina che permette l’esecuzione del quiz.
### Quiz 
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/Documentazione/Immagini/esegui%20quiz.jfif)
Questa pagina permette di eseguire i quiz alla fine di ogni capitolo. Il quiz è formato da domande a risposta multipla. Una volta selezionate le risposte per confermare si deve cliccare il tasto “Submit”. 
### Risultato 
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/Documentazione/Immagini/risultato%20quiz.jfif)
In questa pagina viene visualizzato il risultato relativo al quiz appena svolto. 
### Home docente 
Effettuando il login con credenziali docente verrà visualizzata questa pagina. In questa pagina è possibile creare un nuovo corso inserendo il nome e la descrizione. 
Cliccando su “Crea Corso” si passa alla pagina successiva per inserire tutte le info utili per la creazione del corso.
### Creazione quiz 
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/Documentazione/Immagini/crea%20capitolo0.jfif)
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/Documentazione/Immagini/crea%20capitolo)
In questa pagina, riservata al docente, è possibile creare e aggiungere capitoli ad un determinato corso. Nella sezione esame, scegliendo “finale” viene creato il quiz finale relativo a tutto il corso, scegliendo “quiz” si crea un quiz relativo a un determinato capitolo. 
### Profilo 
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/Documentazione/Immagini/visualizza%20profilo.jfif)
Dal menu in alto a destra presente in tutte le pagine dell’applicazione, cliccando su “Profilo” si apre la seguente schermata. In questa pagina è possibile visualizzare i dati relativi al proprio profilo e account. 
### Esame 
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/Documentazione/Immagini/visualizza%20immagini.jfif)
Dal menù in alto a destra presente in ogni pagina, selezionando “Esami”, avviene un reindirizzamento al sito ATLAS, da cui è possibile scaricare l’applicazione “postazione studente”, la quale viene utilizzata per eseguire l’esame finale.

