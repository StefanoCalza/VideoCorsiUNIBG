# **PROGETTO DI INGEGNERIA DEL SOFTWARE**
### __Anno accademico 2022/2023__
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/Documentazione/Immagini/logo.jpg)
# Sommario 
### Project plan <br>
1. Introduzione <br>
2. Modello di processo <br> 
3. Organizzazione del progetto <br>
4. Standard, linee guida e procedure <br>
5. Attività di gestione <br>
6. Rischi <br>
7. Personale <br>
8. Metodi e tecniche <br>
9. Garanzia di qualità <br> 
10. Pacchetti di lavoro <br>
11. Risorse <br>
12. Budget <br>
13. Cambiamenti <br>
14. Consegna <br>
### Ciclo di vita del software <br>
### Gestione della configurazione <br>
### Gestione delle persone <br>
### Qualità del software <br>
### Ingegneria dei requisiti <br>
### Modellazione <br>
### Architettura del software <br>
### Design del software <br>
### Testing e manutenibilità <br>
### L'applicazione <br>
	
# Project Plan 
### 1. Introduzione
Il progetto prevede la creazione di una piattaforma di videocorsi. Questo progetto nasce dall’esigenza di un membro del team, Stefano, di creare una piattaforma per caricare delle videolezioni preregistrate per i corsi di ICDL (Patente Europea per l’Uso del Computer), in cui si può tener traccia dell’andamento dei corsisti tramite dei quiz. <br>
La piattaforma prevede quindi che un corsista, dopo avere creato un account e aver effettuato il login, si iscriva a uno o più corsi, divisi in capitoli. Per ogni capitolo c’è un video da visualizzare, ma per poter passare al capitolo successivo si deve prima superare un breve quiz che accerti che il corsista abbia seguito il video con attenzione. Se lo studente non supera il quiz deve rivedere il video e riprovare il quiz, fino al superamento. Al termine del corso si deve poi eseguire un esame finale, al termine del quale verrà rilasciato un attestato che accerti le conoscenze apprese durante il corso. <br>
Il docente, invece, deve creare i corsi e, per ogni capitolo, caricare video e quiz relativi. <br>
### 2.	Modello di processo 
In una serie di primi incontri è stata svolta la fase di ingegneria dei requisiti, nella quale sono stati definiti con chiarezza i requisiti che devono essere soddisfatti. Dopo una prima intervista da parte di tutto il team, Stefano è andato direttamente nell’azienda richiedente il progetto, osservando il lavoro quotidiano del personale che avrebbe dovuto utilizzare la piattaforma, sia dal punto di vista dei docenti che degli utenti, applicando la tecnica dell’etnografia. Alla fine di questa fase è stata prodotta la specifica dei requisiti e un prototipo della struttura dell’applicazione.
[link del prototipo](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/Piattaforma%20Videocorsi.pdf). <br>
In una seconda serie di incontri si è passati poi alla progettazione vera e propria, decidendo le basi del progetto da sviluppare, come architettura, tecniche, strumenti da utilizzare e funzioni da implementare. Sono stati inoltre definiti i ruoli e le modalità di sviluppo e di gestione del team. <br>
Infine, si passerà all’implementazione del prodotto. Prima dell’implementazione vera e propria sono state svolte alcune ricerche e sono state colmate alcune lacune per l’utilizzo di alcune risorse (ad esempio l’uso di Bootstrap). L’ordine per l’implementazione è quello definito nel modello di processo MoSCoW. <br>
Di seguito è presentato un diagramma di Gantt che permette di visualizzare graficamente la pianificazione del progetto.
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/Documentazione/Immagini/Grafico%20di%20Gantt.png)
Verranno stabiliti periodicamente degli incontri con l’ente che ha commissionato il progetto per avere un riscontro diretto sul lavoro svolto. <br>
I membri del team comunicheranno fra di loro tramite issue di GitHub e caricheranno tutto il lavoro svolto su GitHub seguendo le linee guida definite. <br>
Il team ha programmato un incontro a settimana fino ad aver ottenuto il prodotto finale, in modo tale da confrontarsi sul progetto e risolvere eventuali problemi. <br>
Si è scelto di utilizzare il modello di processo MoSCoW, suddividendo i requisiti e le funzionalità da implementare in Must have (indispensabili), Should have (necessari), Could have (da fare se il tempo lo permette) e Won’t have (da fare eventualmente in altre versioni del progetto). <br>
Le funzionalità del software verranno quindi implementate seguendo l’ordine MoSCoW. Ogni funzionalità sarà poi implementata seguendo il modello a cascata. 
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
•	Imlementazione del pagamento  <br> <br>
Nota: con implementazione dell’esame finale si intende una schermata che permetta di sostenere l’esame finale relativo a un determinato corso seguito dall’utente. 
### 3.	Organizzazione del progetto 
Gli utenti di questa applicazione saranno i docenti della piattaforma e i corsisti. <br>
I docenti avranno a disposizione un tutorato di 2 ore, svolto dall’azienda che crea l’applicazione, per formarli, in particolare per creare corsi e caricare video e quiz. <br>
I corsisti avranno a disposizione una breve guida che li introdurrà all’uso dell’applicazione. <br>
Per qualsiasi dubbio o problema nell’utilizzo dell’applicazione sarà attivato un servizio email che risponderà entro qualche giorno e risolverà eventuali problematiche. <br>
Per assicurarsi che il progetto rispecchi i requisiti richiesti da ICDL, saranno coinvolti alcuni docenti della piattaforma per verificare che siano state implementate tutte le funzionalità necessarie e che l’applicazione sia facilmente utilizzabile. Inoltre, per verificare la facilità d’uso e l’interazione con lo studente, verranno selezionate alcune persone della fascia d’età dai 13 ai 60 anni (un campione eterogeneo dei futuri corsisti) per testare l’applicazione prima della consegna. <br>
### 4.	Standard, linee guida e procedure
L’applicazione sarà distinta in back-end e front-end: per la parte back-end si utilizzeranno principalmente Tomcat e MySQL test bench, mentre per la parte front-end si utilizzerà Bootstrap. <br> 
Il codice verrà scritto su GitHub e dovrà essere ordinato nelle apposite cartelle; le comunicazioni e le assegnazioni dei compiti avverranno tramite issues di GitHub. <br>
Qualsiasi modifica dovrà essere prima approvata dal CCB e dovrà rispettare tutti gli standard del progetto.  <br>
La documentazione dovrà essere scritta in formato Markdown su GitHub e dovrà essere visionata e approvata da tutti i membri del team. 
### 5.	Attività di gestione 
Il team si riunirà settimanalmente (sia utilizzando la piattaforma VoIP Discord che in presenza) per discutere del lavoro svolto durante la settimana, punti critici e problemi da risolvere, esporre idee e per organizzare il lavoro della settimana successiva. Gli incontri si terranno ogni lunedì, ma in caso di necessità potranno essere svolte delle riunioni extra. <br>
Verrà poi prodotto un documento che sinteticamente riporterà per ogni persona del team l’attività svolta, la data relativa e le ore impiegate per svolgere quella attività.  Confrontando questo documento con il diagramma di Gantt si riuscirà a capire se il progetto prosegue nelle tempistiche previste e se potrà essere consegnato in tempo. <br>
### 6.	Rischi 
I principali rischi legati a questo progetto sono la consegna e la sicurezza. <br>
Per quanto riguarda la consegna, essendo un progetto molto impegnativo c’è il rischio che non venga rispettata la data di consegna concordata con ICDL del 5 febbraio 2023. Per ridurre i ritardi si controllerà settimanalmente, durante gli incontri, che il progetto proceda come previsto, confrontando i risultati ottenuti con la pianificazione stabilita e con il diagramma di Gantt. <br>
Per quanto riguarda la sicurezza c’è il rischio che il prodotto possa avere delle lacune sull’aspetto della sicurezza della gestione degli account. Per risolvere questo problema, non appena verranno implementate le funzionalità essenziali, il primo aggiornamento riguarderà la sicurezza, per rendere il sistema sicuro e protetto da eventuali attacchi esterni.  
### 7.	Personale 
I membri del team sono: Stefano Calzà, Lorenzo Longaretti e Martina Rasmo. <br>
Per organizzare il team si è deciso di utilizzare un’organizzazione a matrice, ovvero si è suddiviso il lavoro in pacchetti di lavoro, che sono stati assegnati ai membri del team in base alle loro competenze e abilità. <br>
Per ogni attività è stata definita una persona responsabile dello sviluppo del lavoro assegnato e una persona addetta al controllo e alla revisione del lavoro svolto dal collega. <br>
Ogni membro del team parteciperà attivamente al progetto dall’inizio alla fine, svolgendo circa 50 ore di lavoro a testa. <br>
Nota: con front-end ci si riferisce alla parte grafica, con back-end ci si riferisce alla parte di gestione dei dati e interfaccia con il database.
| |Front-end|Back-end|Documentazione|Testing|CCB|
|-|---------|--------|--------------|-------|---|
|Stefano Calzà|Responsabile| | Controllo|Responsabile|Responsabile| 
|Lorenzo Longaretti|Responsabile|Responsabile| |Controllo| |
|Martina Rasmo| |Controllo|Responsabile|Responsabile|Responsabile <br>
### 8.	Metodi e tecniche 
Come primo step, dopo aver pianificato le attività da svolgere, identificati i requisiti ed elaborato il project plan, verranno creati i diagrammi UML, sia dell’applicazione in generale, che di specifici passaggi. <br>
Basandosi sui diagrammi UML si potrà poi iniziare l’implementazione vera e propria del progetto. La documentazione e i test verranno effettuati man mano che nuove funzionalità verranno implementate, in modo da evidenziare subito eventuali errori o problematiche. <br> 
Per assicurarsi di rispettare appieno i requisiti, verrà fissato un incontro ogni due settimane con il cliente per verificare che il lavoro proceda nella direzione giusta e che vengano rispettati i requisiti richiesti.  
### 9.	Garanzia di qualità 
L’obiettivo del team, per quanto riguarda la qualità, è quello di rispettare i fattori di qualità di McCall, divisi in tre diverse categorie: <br>
##### Funzionamento del prodotto:<br>
+	Correttezza <br>
+	Affidabilità <br>
+	Efficienza <br>
+	Integrità <br>
+	Usabilità <br>
##### Revisione del prodotto: <br>
+	Manutenibilità <br>
+	Testabilità <br>
+	Flessibilità <br>
##### Transazione del prodotto: <br>
+	Portabilità <br>
+	Riutilizzabilità <br>
+	Interoperabilità <br> <br>
Per quanto riguarda la categoria del funzionamento del prodotto verranno rispettati tutti i fattori fin dall’inizio, e si controllerà che il progetto li rispetti man mano che le funzionalità verranno implementate. <br> 
Per quanto riguarda la categoria della revisione del prodotto e della transazione del prodotto, si cercherà di strutturare il progetto in modo che rispetti queste qualità, ma verranno rispettate appieno e migliorate in seguito ad aggiornamenti previsti dopo la consegna del progetto. <br>
Alcuni accorgimenti che verranno adottati per rispettare i requisiti di qualità sopra descritti sono la divisione tra front-end e back-end, in modo da permettere la modifica delle due parti separatamente, l’utilizzo di un sistema che gestisca gli account e in particolare le aree riservate a utenti e docenti tramite login per garantirne la sicurezza e l’utilizzo di tecnologie e librerie moderne e aggiornate. <br>
Ogni scelta effettuata in qualsiasi fase dello sviluppo del software terrà conto delle sue conseguenze sulla qualità del software. 
### 10.	Pacchetti di lavoro
I pacchetti di lavoro che sono stati individuati sono i seguenti: <br>
+	Progettazione <br>
+	Design e schemi UML <br>
+	Colmare le lacune sull’utilizzo di alcune tecnologie <br>
+	Implementazione del database <br>
+	Implementazione dell’applicazione (sia front-end che back-end) <br>
+	Test sul prodotto <br>
+	Realizzazione della documentazione <br> <br>
L’ordine di esecuzione di questi pacchetti di lavoro non è rigido, in quanto man mano che verranno sviluppate funzionalità verranno testate subito, seguendo il modello a cascata. 
### 11. Risorse 
Le risorse utilizzate per l’implementazione di questo progetto saranno: <br>
+	Tomcat per l’implementazione del server web <br>
+	MySQL testbench per il database <br>
+	Bootstrap per il front-end <br>
+	GitHub per condividere il lavoro e comunicare <br>
+	Discord per la comunicazione <br> <br>
Ad ogni partecipante al progetto verrà inoltre fornito un computer su cui potrà programmare, una connessione a internet e un locale per lavorare e per gli incontri. 
### 12. Budget 
Si stima che per concludere il progetto siano necessarie circa 50 ore di lavoro a testa e che il progetto duri circa 3 mesi.  Considerando che il team è formato da 3 persone e che vengono pagate tutte 21€ all’ora, ci si aspetta che il costo del personale sia di circa 3150€, calcolato usando l’espressione: <br>
50 ore di lavoro a persona x 3 persone x 21€ all’ora= 3150€ <br>
Bisogna considerare inoltre un costo di 100€ al mese per servizi vari (elettricità, rete internet, dominio, ecc), da aggiungere ai 400€ di affitto per il locale utilizzato e da moltiplicare per i 3 mesi di durata del progetto: <br>
(100€ di servizi+400€ di affitto) x 3 mesi=1500€ <br>
Il costo dell’implementazione delle funzionalità base concordate con l’ente ICDL si aggira quindi intorno ai 4650€. <br>
3150€+1500€=4650€ <br>
Per l’implementazione di ulteriori funzionalità o aggiornamenti verrà svolto un nuovo preventivo. 
### 13. Cambiamenti 
I cambiamenti e le modifiche saranno gestiti utilizzano il metodo CCB (configuration change board): qualsiasi modifica dovrà essere proposta utilizzando la piattaforma GitHub specificando quante più informazioni possibili, e potrà essere applicata solo dopo il consenso da parte della CCB. <br>
In questo caso la CCB sarà composta da Stefano e Martina, che si assicureranno che, di seguito a ogni modifica, siano aggiornati tutti gli elementi coinvolti. <br>
La CCB si assicurerà che ogni modifica permetta di continuare a rispettare i requisiti stabiliti con il cliente e gli standard di qualità prefissati per il progetto. <br>
Si è scelta questa metodologia per il controllo dei cambiamenti perché permette un controllo rigoroso su qualunque modifica e permette a tutti i membri del team di essere a conoscenza delle modifiche decise e di poter programmare di conseguenza.
### 14. Consegna 
La consegna del project plan è prevista entro il 22 dicembre 2022. <br>
La consegna del progetto contenente le funzionalità must have e should have e la documentazione relativa è definita per il 5 febbraio 2023. <br>
Ulteriori funzionalità o aggiornamenti verranno implementati entro data da definirsi con ICDL.
















