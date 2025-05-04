# Design pattern 
I design pattern utilizzati dal team per lo sviluppo dell’applicazione sono il pattern singleton e il pattern read only. <br>
Il pattern singleton si assicura che una classe abbia una sola istanza e che possa essere navigata tramite determinati metodi. 
È stato scelto per rendere static la connessione al database, in questo modo c’è una sola istanza di connection. <br>
Il pattern singleton è stato implementato nel seguente modo: <br>
![immagine](https://github.com/LLongaretti/ProgettoVideoCorsi/blob/Documentazione/design%20pattern.jpeg)
Il pattern read only, invece, gestisce i privilegi di modifica di determinate classi.
Quest’ultimo è stato scelto di applicarlo ai beans in quanto i DAO devono poter modificare i beans per registrare i valori, mentre i controller devono poter solo accedere ai beans. 
