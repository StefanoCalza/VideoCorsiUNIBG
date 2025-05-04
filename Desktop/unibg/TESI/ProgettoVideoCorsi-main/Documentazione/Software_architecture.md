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
