-- PostgreSQL schema for videocorsi database

-- Create user table
CREATE TABLE IF NOT EXISTS "user" (
    id INTEGER NOT NULL,
    username VARCHAR(45) NOT NULL,
    password VARCHAR(45) NOT NULL,
    role INTEGER NOT NULL,
    nome VARCHAR(45),
    cognome VARCHAR(45),
    email VARCHAR(45),
    skillscard VARCHAR(45),
    PRIMARY KEY (id),
    UNIQUE (id)
);

-- Create courses table
CREATE TABLE IF NOT EXISTS courses (
    idcourses INTEGER NOT NULL,
    name VARCHAR(45),
    description VARCHAR(45),
    PRIMARY KEY (idcourses),
    UNIQUE (idcourses)
);

-- Create chapter table
CREATE TABLE IF NOT EXISTS chapter (
    course INTEGER NOT NULL,
    chapter INTEGER NOT NULL,
    name VARCHAR(45),
    video VARCHAR(45),
    is_final INTEGER,
    description VARCHAR(45),
    PRIMARY KEY (course, chapter),
    FOREIGN KEY (course) REFERENCES courses (idcourses)
);

-- Create iscrizioni table
CREATE TABLE IF NOT EXISTS iscrizioni (
    idCourse INTEGER NOT NULL,
    id_User INTEGER NOT NULL,
    idChapter INTEGER NOT NULL,
    passed INTEGER DEFAULT 0,
    PRIMARY KEY (idCourse, id_User, idChapter),
    FOREIGN KEY (idCourse, idChapter) REFERENCES chapter (course, chapter),
    FOREIGN KEY (id_User) REFERENCES "user" (id)
);

-- Create quiz_provvisorio table
CREATE TABLE IF NOT EXISTS quiz_provvisorio (
    idquiz_provvisorio INTEGER NOT NULL,
    domanda VARCHAR(45),
    quesito1 VARCHAR(45),
    quesito2 VARCHAR(45),
    quesito3 VARCHAR(45),
    quesito4 VARCHAR(45),
    risposta_corretta INTEGER,
    idcourse INTEGER NOT NULL,
    idchapter INTEGER NOT NULL,
    PRIMARY KEY (idquiz_provvisorio, idcourse, idchapter),
    FOREIGN KEY (idcourse, idchapter) REFERENCES chapter (course, chapter)
);

-- Insert data into user table
INSERT INTO "user" (id, username, password, role, nome, cognome, email, skillscard) VALUES
(0, 'docente', '99240839cd88b26623247acdafd58e7e', 1, 'lorenzo', 'longaretti', 'l.l@gmail.com', '000000010'),
(1, 'studente', '2f3e97e13e8f1dc958240c1f602c9bbd', 2, 'stefano ', 'calza', 's.t@gmail.com', '0000020000'),
(2, 'prova', '189bbbb00c5f1fb7fba9ad9285f193d1', 2, 'prova', 'prova', 'prova@prova', '0123540');

-- Insert data into courses table
INSERT INTO courses (idcourses, name, description) VALUES
(1, 'Computer Essential', 'Competenze base PC'),
(2, 'Online Essential', 'Navigazione Internet e Mail'),
(3, 'Word Processing', 'Microsoft Word'),
(4, 'Spreadsheets', 'Microsoft Excell'),
(5, 'IT Security', 'Sicurezza informatica'),
(6, 'Presentation', 'Microsoft Power Point'),
(7, 'Online Collaboration', 'Cloud e Google suite');

-- Insert data into chapter table
INSERT INTO chapter (course, chapter, name, video, is_final, description) VALUES
(1, 1, 'Computer e Dispositivi', '3tdtTkNMGvA', 0, 'Hardware e Software'),
(1, 2, 'Gestione dei file', '3tdtTkNMGvA', 0, 'Organizzazione di file e cartelle'),
(1, 3, 'Esame finale', NULL, 1, 'Test di valutazione'),
(2, 1, 'Navigazione nel web', '1TaSYPJ3AY8', 0, 'Utilizzo del browser'),
(2, 2, 'Posta elettronica', '1TaSYPJ3AY8', 0, 'Invio e gestione email'),
(2, 3, 'Esame finale', NULL, 1, 'Test di valutazione'),
(3, 1, 'Documento', '-sYgH4C8Y58', 0, 'Creazione di un documento'),
(3, 2, 'Oggetti', '-sYgH4C8Y58', 0, 'Creazione tabelle e grafici'),
(3, 3, 'Esame finale', NULL, 1, 'Test di valutazione'),
(4, 1, 'Fogli di calcolo', 'Qt391I6DDhk', 0, 'Gestione di righe e colonne'),
(4, 2, 'Grafici', 'Qt391I6DDhk', 0, 'Creazione e modifica grafici'),
(4, 3, 'Esame finale', NULL, 1, 'Test di valutazione'),
(5, 1, 'Malware', 'fURRUIHfDPc', 0, 'Tipologia malware e prevezione'),
(5, 2, 'Sicurezza in rete', 'fURRUIHfDPc', 0, 'Siti sicuri, pericoli social e mail'),
(5, 3, 'Esame finale', NULL, 1, 'Test di valutazione'),
(6, 1, 'Presentazione', 'R6FdzLKiGxA', 0, 'Creazione e gestione slide'),
(6, 2, 'Oggetti', 'R6FdzLKiGxA', 0, 'Creazione tabelle e grafici'),
(6, 3, 'Esame finale', NULL, 1, 'Test di valutazione'),
(7, 1, 'Cloud', 'a3jEh5PJFYM', 0, 'Gestione cloud Computing'),
(7, 2, 'Google suite', 'a3jEh5PJFYM', 0, 'Drive, Calendar, Documenti'),
(7, 3, 'Esame finale', NULL, 1, 'Test di valutazione');

-- Insert data into iscrizioni table
INSERT INTO iscrizioni (idCourse, id_User, idChapter, passed) VALUES
(1, 0, 1, 1), (1, 0, 2, 0), (1, 0, 3, 0),
(1, 1, 1, 1), (1, 1, 2, 1), (1, 1, 3, 0),
(1, 2, 1, 2), (1, 2, 2, 2), (1, 2, 3, 2),
(2, 2, 1, 0), (2, 2, 2, 0), (2, 2, 3, 0),
(3, 1, 1, 0), (3, 1, 2, 0), (3, 1, 3, 0),
(3, 2, 1, 0), (3, 2, 2, 0), (3, 2, 3, 0),
(4, 2, 1, 0), (4, 2, 2, 0), (4, 2, 3, 0),
(5, 2, 1, 0), (5, 2, 2, 0), (5, 2, 3, 0),
(6, 2, 1, 0), (6, 2, 2, 0), (6, 2, 3, 0),
(7, 2, 1, 0), (7, 2, 2, 0), (7, 2, 3, 0);

-- Insert data into quiz_provvisorio table
INSERT INTO quiz_provvisorio (idquiz_provvisorio, domanda, quesito1, quesito2, quesito3, quesito4, risposta_corretta, idcourse, idchapter) VALUES
(1, 'Cos''è un Hard Disk?', 'Hardware', 'Software', 'Hardcase', 'Soft', 1, 1, 1),
(2, 'Archivio Online', 'Chiavetta USB', 'Hard Disk', 'Cloud', 'CD', 3, 1, 1),
(3, 'Indica il più grande', 'Gigabite', 'Kilobite', 'Megabite', 'Bite', 1, 1, 1),
(4, 'Porta di Input/Output', 'Mouse', 'Altoparlante', 'HDMI', 'Tastiera', 3, 1, 1),
(5, 'Estensione file compressi', '.zip', '.mp3', '.docx', '.pdf', 1, 1, 2),
(6, 'Organizzazione cartelle', 'Albero', 'Cespuglio', 'Predefinita', 'Variabile', 1, 1, 2),
(7, 'Diminuire grandezza file', 'Upload', 'Estrazione', 'Compressione', 'Ripristino', 3, 1, 2),
(8, 'Documenti interconnessi in internet', 'www', 'Email', 'VoIP', 'Instant Messaging', 4, 1, 2),
(9, 'Archivio Online', 'Chiavetta USB', 'Hard Disk', 'Cloud', 'CD', 3, 1, 3),
(10, 'Porta di Input/Output', 'Mouse', 'Altoparlante', 'HDMI', 'Tastiera', 3, 1, 3),
(11, 'Diminuire grandezza file', 'Upload', 'Estrazione', 'Compressione', 'Ripristino', 3, 1, 3),
(12, 'Estensione file compressi', '.zip', '.mp3', '.docx', '.pdf', 1, 1, 3); 