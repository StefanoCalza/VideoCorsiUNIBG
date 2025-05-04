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
