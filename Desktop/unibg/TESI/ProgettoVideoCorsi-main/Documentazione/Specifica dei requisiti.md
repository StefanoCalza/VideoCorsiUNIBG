# **SPECIFICA DEI REQUISITI**
# **Piattaforma Videocorsi** 
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/main/Documentazione/Immagini/logo.jpg)
## 1. INTRODUZIONE 
### 1.1 Obiettivo 
Il seguente documento è prodotto con l’obiettivo di descrivere in modo accurato i requisiti del sistema software “Piattaforma Videocorsi” che verrà implementato. 
La struttura del documento segue lo standard IEEE830. Il documento prodotto è rivolto all’ente ICDL che ha commissionato il progetto e, per facilitarne la lettura 
e la comprensione, è scritto in linguaggio naturale. <br>
### 1.2 Scopo 
Il nome del prodotto che verrà sviluppato è “Piattaforma Videocorsi”: si tratta di una piattaforma online per l’erogazione di corsi tramite video e la 
verifica delle conoscenze apprese tramite quiz ed esami. <br>
La piattaforma permetterà agli utenti di accedere online ai corsi erogati da ICDL, ampliando il bacino dei potenziali corsisti. 
Inoltre, permetterà ai docenti una più facile gestione dei corsi in quanto una volta inseriti nella piattaforma saranno gestiti da essa. <br>
### 1.3 Definizioni, acronimi e abbreviazioni 
+	Contratto: il documento legale stilato tra committente e fornitore.
+	Committente: colui che paga il prodotto, ovvero l’ente ICDL.
+	Fornitore: chi produce il prodotto / sviluppa per il committente, ovvero Calzà Stefano, Longaretti Lorenzo e Rasmo Martina.
+	ICDL: International Certification of Digital Literacy, è l’ente che ha commissionato il progetto.
+	Utente: la persona che usa e interagisce direttamente col sistema, ovvero corsisti e docenti.
+	Corsisti: utenti iscritti alla piattaforma che seguono dei corsi.
+	Docenti: docenti dell’ente ICDL che erogano e gestiscono i corsi.
### 1.4 Riferimenti
Capitolo 9 del libro Software engineering: Principles and Practice, Hans Van Vliet. <br>
https://stlab.dinfo.unifi.it/bucci/Teaching/Ingegneria_del_software/07-Requisiti.pdf <br>
https://www.didattica.agentgroup.unimo.it/wiki/images/d/d7/IEEE830_ITA.pdf <br>
http://wpage.unina.it/fasolino/is/materiale/SRS/SRS-esempio.pdf <br>
### 1.5 Panoramica 
Il documento prosegue con i seguenti capitoli: <br>
Capitolo 2 - Descrizione generale: fornisce una descrizione generale del sistema e degli utenti che lo utilizzeranno. <br>
Capitolo 3 - Requisiti specifici: fornisce la panoramica dei requisiti funzionali e non funzionali del sistema. <br>
Indice: indice del documento. <br>
## 2. DESCRIZIONE GENERALE
### 2.1 Prospettiva del prodotto 
Il prodotto sviluppato sarà indipendente, in quanto non è parte e non deve integrarsi in alcun sistema software. <br>
### 2.2 Funzioni del prodotto 
Il sistema software deve: <br>
+	Gestire la visualizzazione e l’esecuzione dei corsi da parte dei corsisti: <br>
•	Iscrizione ai corsi <br>
•	Visualizzazione dei video <br> 
•	Visualizzazione ed esecuzione dei quiz <br> 
•	Iscrizione a esame <br>
+	Gestire la creazione dei corsi e degli esami da parte dei docenti: <br>
•	Creazione del corso <br>
•	Creazione dei capitoli <br>
•	Caricamento dei video <br>
•	Creazione dei quiz <br>
•	Registrazione esiti esame <br>
+	Gestire i dati di ogni utente iscritto alla piattaforma: <br>
•	Visualizzazione dati profilo <br>
•	Modifica dati profilo (non ancora implementato) <br>
### 2.3 Caratteristiche dell’utente 
Gli utenti, sia per quanto riguarda i corsisti che i docenti, saranno persone che hanno diversi livelli di esperienza e di istruzione. Per questo motivo, con lo scopo di essere facilmente utilizzabile dalle persone di qualunque fascia d’età e di competenze informatiche, il sistema è stato sviluppato con l’obiettivo di essere “user-friendly”, ovvero semplice e intuitivo.  Sarà quindi richiesta una conoscenza solamente minima nell’uso del computer. <br>
### 2.4 Vincoli 
Per poter passare al capitolo successivo di un determinato corso deve essere svolto e superato il quiz relativo al capitolo appena studiato (questo vincolo sarà implementato nelle versioni successive). <br>
### 2.5 Presupposti e dipendenze 
Il sistema software “Piattaforma Videocorsi” può essere utilizzato su qualsiasi dispositivo dotato di connessione di rete tramite qualsiasi browser internet. Viene sconsigliato l’uso su dispositivi mobili. <br>
## 3. REQUISITI SPECIFICI
## 3.1 Requisiti di interfaccia esterna 
### 3.1.1	Interfaccia utente
Il sistema software “Piattaforma Videocorsi” dovrà essere dotato di un’interfaccia user friendly e intuitiva, con menu e pulsanti. <br>
### 3.1.2	Interfaccia hardware
Il sistema software “Piattaforma Videocorsi” non dovrà interfacciarsi con nessun sistema hardware.
### 3.1.3 Interfaccia software 
Il sistema software “Piattaforma Videocorsi” dovrà collegarsi alla porta 8080 del server. 
### 3.1.4 Interfacce di comunicazione 
Il sistema software “Piattaforma Videocorsi” non richiede l’uso di una particolare interfaccia di comunicazione. 
## 3.2	Requisiti funzionali
I requisiti funzionali sono stati classificati tramite il modello MoSCoW in Must Have, ovvero requisiti che il sistema deve avere, Should Have, requisiti che il sistema dovrebbe avere, Coul Have, requisiti che verranno implementati solo se il tempo lo consente, e Won’t Have, requisiti che non saranno implementati nella versione attuale, ma probabilmente in release future. <br>
##### Must have: 
+	Implementazione della pagina home (RF01)  <br>
+	Implementazione della pagina di login (RF02)  <br>
+	Implementazione della pagina di iscrizione ai corsi (RF03) <br>
+	Implementazione della pagina di creazione dei corsi (RF04) <br>
+	Implementazione della pagina di visualizzazione dei video (RF05) <br>
+	Implementazione della pagina di esecuzione dei quiz (RF06) <br>
+	Visualizzazione dati account (RF07) <br>
##### Should have: 
+	Implementazione dell’obbligo del superamento del quiz per passare al video successivo (RF08) <br>
##### Could have: 
+	Implementazione della sicurezza degli account (RF09) <br>
+	Implementazione di una chat corsista-docente (RF10) <br>
+	Visualizzazione delle risposte errate (RF11) <br>
+	Implementazione pagina di iscrizione agli esami (RF12) <br>
##### Won’t have: 
+	Possibilità di modifica dell’account (RF13)  <br>
+	Implementazione del pagamento (RF14) <br>
### 3.2.1	Pagina HOME
Introduzione: <br>
	Codice: RF01 <br>
	Attori coinvolti: utenti. <br>
	Descrizione generale: pagina visualizzata inizialmente. <br>
Input: nessuno. <br>
Descrizione (processo): l’utente, aprendo la piattaforma, visualizza la pagina iniziale, la pagina home. Da questa pagina può trovare un inquadramento generale della piattaforma, e accedere alla pagina “login”. <br>
Output: nessuno. <br>

|Introduzione|Input|Descrizione (processo)|Output|
|----------|--------|--------------|-------|
|**Codice:** RF01 <br>  **Attori coinvolti:** utenti <br>  **Descrizione generale:** pagina visualizzata inizialmente |nessuno|l’utente, aprendo la piattaforma, visualizza la pagina iniziale, la pagina home. Da questa pagina può trovare un inquadramento generale della piattaforma, e accedere alla pagina “login”|nessuno|

### 3.2.2 Pagina di login 
Introduzione: <br>
	Codice: RF02 <br>
	Attori coinvolti: utenti. <br>
	Descrizione generale: l’utente accede alla propria area riservata. <br>
Input: credenziali (e-mail e password). <br>
Descrizione (processo): l’utente inserisce le proprie credenziali (e-mail e password) e viene indirizzato alla propria area riservata a seconda se si tratta di un corsista o di un docente. <br>
Output: visualizzazione area riservata. <br>

|Introduzione|Input|Descrizione (processo)|Output|
|----------|--------|--------------|-------|
|**Codice:** RF02  <br>  **Attori coinvolti:** utenti <br>  **Descrizione generale:** l’utente accede alla propria area riservata |credenziali (e-mail e password)|l’utente inserisce le proprie credenziali (e-mail e password) e viene indirizzato alla propria area riservata a seconda se si tratta di un corsista o di un docente|visualizzazione area riservata|

### 3.2.3 Pagina HOME corsisti
Introduzione:  <br>
	Codice: RF03  <br>
	Attori coinvolti: corsisti.  <br>
	descrizione generale: pagina che permette l’iscrizione ai corsi.  <br>
Input: credenziali (e-mail e password).  <br>
Descrizione (processo): il corsista ha la possibilità di visualizzare i corsi a cui è iscritto e i corsi disponibili a cui non è ancora iscritto. Premendo sul bottone “iscriviti” dei corsi disponibili si effettua l’iscrizione a quel determinato corso.  <br>
Output: iscrizione a un corso.  <br>

|Introduzione|Input|Descrizione (processo)|Output|
|----------|--------|--------------|-------|
|**Codice:** RF03  <br>  **Attori coinvolti:** corsisti <br>  **Descrizione generale:** pagina che permette l’iscrizione ai corsi |credenziali (e-mail e password)|il corsista ha la possibilità di visualizzare i corsi a cui è iscritto e i corsi disponibili a cui non è ancora iscritto. Premendo sul bottone “iscriviti” dei corsi disponibili si effettua l’iscrizione a quel determinato corso|iscrizione a un corso|

 ### 3.2.4 Pagina HOME docenti
Introduzione: <br>
	Codice: RF04 <br>
	Attori coinvolti: docente. <br>
	Descrizione generale: pagina che permette la creazione di un nuovo corso. <br>
Input: credenziali (e-mail e password), dati del nuovo corso e video dei capitoli.<br>
Descrizione (processo): il docente ha la possibilità di inserire titolo e descrizione del corso, suddividere il corso in capitoli e caricare per ogni capitolo il relativo video e quiz.<br>
Output: nuovo corso.<br>

|Introduzione|Input|Descrizione (processo)|Output|
|----------|--------|--------------|-------|
|**Codice:** RF04  <br>  **Attori coinvolti:** docente <br>  **Descrizione generale:** pagina che permette la creazione di un nuovo corso |credenziali (e-mail e password), dati del nuovo corso e video dei capitoli|il docente ha la possibilità di inserire titolo e descrizione del corso, suddividere il corso in capitoli e caricare per ogni capitolo il relativo video e quiz|nuovo corso|

### 3.2.5	Pagina di visualizzazione video
Introduzione: <br>
Codice: RF05<br>
Attori coinvolti: corsisti.<br>
	Descrizione generale: pagina che permette la visualizzazione dei video <br>
Input: credenziali (e-mail e password).<br>
Descrizione (processo): il corsista, entrato in questa pagina, ha la possibilità di visualizzare (per un numero illimitato di volte) i video relativi al corso che sta seguendo. I video, essendo presi da youtube, hanno tutte le funzionalità che esso offre (possibilità di modifica della velocità, modifica della qualità, ecc). <br>
Output: visualizzazione dei video. <br>

|Introduzione|Input|Descrizione (processo)|Output|
|----------|--------|--------------|-------|
|**Codice:** RF05  <br>  **Attori coinvolti:** corsisti <br>  **Descrizione generale:** pagina che permette la visualizzazione dei video | credenziali (e-mail e password)|il corsista, entrato in questa pagina, ha la possibilità di visualizzare (per un numero illimitato di volte) i video relativi al corso che sta seguendo. I video, essendo presi da youtube, hanno tutte le funzionalità che esso offre (possibilità di modifica della velocità, modifica della qualità, ecc)|visualizzazione dei video|


### 3.2.6	Pagina di esecuzione dei quiz
Introduzione: <br>
	codice: RF06 <br>
	Attori coinvolti: corsisti.<br>
	Descrizione generale: pagina che permette l’esecuzione dei quiz. <br>
Input: credenziali (e-mail e password).<br>
Descrizione (processo): il corsista in questa pagina ha la possibilità di eseguire il quiz relativo a un determinato capitolo del corso che sta seguendo. Il quiz consiste in domande a risposta multipla (4 opzioni) e non viene applicata la penalità in caso di errore. Il quiz è superato se si ottiene una percentuale di risposte corrette maggiore o uguale del 75%. Se il quiz non viene passato è possibile ripeterlo.<br>
Output: punteggio quiz. <br>

|Introduzione|Input|Descrizione (processo)|Output|
|----------|--------|--------------|-------|
|**Codice:** RF06  <br>  **Attori coinvolti:** corsisti <br>  **Descrizione generale:** pagina che permette l’esecuzione dei quiz | credenziali (e-mail e password)|il corsista in questa pagina ha la possibilità di eseguire il quiz relativo a un determinato capitolo del corso che sta seguendo. Il quiz consiste in domande a risposta multipla (4 opzioni) e non viene applicata la penalità in caso di errore. Il quiz è superato se si ottiene una percentuale di risposte corrette maggiore o uguale del 75%. Se il quiz non viene passato è possibile ripeterlo|punteggio quiz|

### 3.2.7	Visualizzazione dati account 
Introduzione: <br>
	Codice: RF07<br>
	Attori coinvolti: corsisti.<br>
	Descrizione generale: pagina per la visualizzazione dei dati dell’account.<br>
Input: credenziali (e-mail e password).<br>
Descrizione (processo): il corsista in questa pagina ha la possibilità di visualizzare i dati relativi al proprio account, ovvero nome, cognome, e-mail e Skillcard (codice univoco ICDL). <br>
Output: nessuno.<br>

|Introduzione|Input|Descrizione (processo)|Output|
|----------|--------|--------------|-------|
|**Codice:** RF07  <br>  **Attori coinvolti:** corsisti <br>  **Descrizione generale:** pagina per la visualizzazione dei dati dell’account | credenziali (e-mail e password)|il corsista in questa pagina ha la possibilità di visualizzare i dati relativi al proprio account, ovvero nome, cognome, e-mail e Skillcard (codice univoco ICDL)|nessuno|


### 3.2.8	 Obbligo del superamento del quiz per passare al video successivo
Introduzione: <br>
	Codice: RF08<br>
	Attori coinvolti: sistema.<br>
	Descrizione generale: funzione che non permette di visualizzare i video successivi se non si supera il quiz. <br>
Input: punteggio del quiz minore del 75%.<br>
Descrizione (processo): è una funzione completamente gestita dal sistema che non permette la visualizzazione dei video successivi finché non viene superato il quiz con un punteggio maggiore o uguale al 75% di risposte corrette.  <br>
Output: quiz da svolgere nuovamente.<br>

|Introduzione|Input|Descrizione (processo)|Output|
|----------|--------|--------------|-------|
|**Codice:** RF08  <br>  **Attori coinvolti:** sistema <br>  **Descrizione generale:** funzione che non permette di visualizzare i video successivi se non si supera il quiz | punteggio del quiz minore del 75%|è una funzione completamente gestita dal sistema che non permette la visualizzazione dei video successivi finché non viene superato il quiz con un punteggio maggiore o uguale al 75% di risposte corrette|quiz da svolgere nuovamente|

### 3.2.9	 Sicurezza degli account
Introduzione: <br>
	Codice: RF09<br>
	Attori coinvolti: sistema.<br>
	Descrizione generale: il sistema deve garantire la sicurezza degli account.<br>
Input: nessuno.<br>
Descrizione (processo): con sicurezza degli account racchiudiamo tutte le funzioni volte a garantire la sicurezza degli account e dei dati degli utenti. <br>
Output: nessuno.<br>

|Introduzione|Input|Descrizione (processo)|Output|
|----------|--------|--------------|-------|
|**Codice:** RF09  <br>  **Attori coinvolti:** sistema <br>  **Descrizione generale:** il sistema deve garantire la sicurezza degli account | nessuno|con sicurezza degli account racchiudiamo tutte le funzioni volte a garantire la sicurezza degli account e dei dati degli utenti|nessuno|

### 3.2.10	Chat corsista-docente
Introduzione: <br>
	Codice: RF10<br>
	Attori coinvolti: corsisti e docenti.<br>
	Descrizione generale: chat fra il corsista e il docente.<br>
Input: messaggi.<br>
Descrizione (processo): questa pagina permette la creazione, da parte di un corsista, di una chat con il docente di riferimento al corso che sta seguendo per chiarire eventuali dubbi, porre domande, ecc. <br>
Output: nessuno.<br>

|Introduzione|Input|Descrizione (processo)|Output|
|----------|--------|--------------|-------|
|**Codice:** RF10  <br>  **Attori coinvolti:** corsisti e docenti <br>  **Descrizione generale:** chat fra il corsista e il docente | messaggi|questa pagina permette la creazione, da parte di un corsista, di una chat con il docente di riferimento al corso che sta seguendo per chiarire eventuali dubbi, porre domande, ecc.|nessuno|

### 3.2.11	Visualizzazione delle risposte errate
Introduzione: <br>
	Codice: RF11<br>
	Attori coinvolti: corsisti.<br>
	Descrizione generale: pagina che permette la visualizzazione delle risposte errate.<br>
Input: credenziali (e-mail e password).<br>
Descrizione (processo): in questa pagina un corsista può visualizzare le risposte errate dei quiz svolti.<br>
Output: nessuno.<br>

|Introduzione|Input|Descrizione (processo)|Output|
|----------|--------|--------------|-------|
|**Codice:** RF11  <br>  **Attori coinvolti:** corsisti <br>  **Descrizione generale:** pagina che permette la visualizzazione delle risposte errate |  credenziali (e-mail e password)|in questa pagina un corsista può visualizzare le risposte errate dei quiz svolti|nessuno|

### 3.2.12	Pagina di iscrizione agli esami 
Introduzione: <br>
Codice: RF12<br>
Attori coinvolti: corsisti. <br>
Descrizione generale: pagina che permette l’iscrizione agli esami. <br>
Input: credenziali (e-mail e password).<br>
Descrizione (processo): in questa pagina un corsista può iscriversi all’esame finale relativo al corso che ha seguito.<br> 
Output: nessuno.<br>

|Introduzione|Input|Descrizione (processo)|Output|
|----------|--------|--------------|-------|
|**Codice:** RF12  <br>  **Attori coinvolti:** corsisti <br>  **Descrizione generale:** pagina che permette l’iscrizione agli esami |  credenziali (e-mail e password)|in questa pagina un corsista può iscriversi all’esame finale relativo al corso che ha seguito|nessuno|


### 3.2.13 Possibilità di modifica dell’account 
Introduzione: <br>
	Codice: RF13<br>
	Attori coinvolti: corsisti.<br>
	Descrizione generale: pagina per la modifica dell’account. <br>
Input: credenziali (e-mail e password), nuovi dati.<br>
Descrizione (processo): in questa pagina il corsista ha la possibilità di modificare i dati relativi al proprio profilo.<br>
Output: nessuno.<br>

|Introduzione|Input|Descrizione (processo)|Output|
|----------|--------|--------------|-------|
|**Codice:** RF13  <br>  **Attori coinvolti:** corsisti <br>  **Descrizione generale:** pagina per la modifica dell’account |  credenziali (e-mail e password), nuovi dati|in questa pagina il corsista ha la possibilità di modificare i dati relativi al proprio profilo|nessuno|


### 3.2.14 Pagamento 
Introduzione: <br>
	Codice: RF14<br>
	Attori coinvolti: corsisti.<br>
	Descrizione generale: pagina per il pagamento degli esami e dei corsi.<br>
Input: credenziali (e-mail e password), dati bancari.<br>
Descrizione (processo): in questa pagina viene effettuato, da parte del corsista, il pagamento per potersi iscrivere al corso e sostenere l’esame relativo al corso effettuato. <br>
Output: ricevuta di pagamento.<br>

|Introduzione|Input|Descrizione (processo)|Output|
|----------|--------|--------------|-------|
|**Codice:** RF14  <br>  **Attori coinvolti:** corsisti <br>  **Descrizione generale:** pagina per il pagamento degli esami e dei corsi |  credenziali (e-mail e password), dati bancari|in questa pagina viene effettuato, da parte del corsista, il pagamento per potersi iscrivere al corso e sostenere l’esame relativo al corso effettuato|ricevuta di pagamento|


## 3.3	Requisiti di prestazione 
+	Erogazione di almeno 7 corsi, i corsi base di ICDL <br>
+	Caricamento di almeno 4 capitoli per corso<br>
+	Caricamento di almeno 1 quiz per capitolo<br>
+	Tempi di risposta ragionevoli <br>
+	Aggiornamento user friendly <br>
## 3.4	Vincoli di progettazione 
Nessuno <br>
## 3.5 Attributi del sistema software 
+	Accessibilità: Il software sarà user friendly e accessibili a tutti indipendentemente dalle capacità di utilizzo del computer. <br>
+	Multiutenza: Più utenti potranno accedere contemporaneamente al software. <br>
+	Portabilità: Il software potrà essere eseguito sia su computer che su dispositivi mobile. <br>
+	Sicurezza: Alcune delle informazioni che saranno trattate dal software sono riservate, per questo saranno accessibili solo a un gruppo ristretto di persone. 		Ciascun utente, per poter accedere alla propria area riservata, dovrà eseguire l’accesso tramite mail e password.  <br>
Per ulteriori informazioni sui parametri di qualità del software è possibile consultare la documentazione alla voce “Software quality”. <br>
## 3.6 Altri requisiti 
Nessuno <br>

## INDICE
#### 1. Introduzione
1.1 Obiettivo <br>
1.2 Scopo	<br>
1.3 Definizioni, acronimi e abbreviazioni<br>
1.4 Riferimenti <br>
1.5 Panoramica <br>
	
#### 2. Descrizione generale 
2.1 Prospettiva del prodotto <br>
2.2 Funzioni del prodotto <br>
2.3 Caratteristiche dell’utente<br>
2.4 Vincoli <br>
2.5 Presupposti e dipendenze<br>
	
#### 3. Requisiti specifici 
3.1 Requisiti di interfaccia esterna <br>
        3.1.1 Interfaccia utente<br>
	3.1.2 Interfaccia hardware <br>
	3.1.3 Interfaccia software <br>
	3.1.4 Interfacce di comunicazione <br>
3.2 Requisiti funzionali <br>
3.3 Requisiti di prestazione <br>
3.4 Vincoli di progettazione <br>
3.5 Attributi del sistema software <br>
3.6 Altri requisiti <br>












