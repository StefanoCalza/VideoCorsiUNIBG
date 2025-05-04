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
