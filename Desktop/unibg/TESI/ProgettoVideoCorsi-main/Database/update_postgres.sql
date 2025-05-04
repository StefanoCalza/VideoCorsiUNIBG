-- Update docente password
UPDATE "user" 
SET password = '99240839cd88b26623247acdafd58e7e'
WHERE username = 'docente';

-- Insert missing quizzes for course 1, chapter 3
INSERT INTO quiz_provvisorio (idquiz_provvisorio, domanda, quesito1, quesito2, quesito3, quesito4, risposta_corretta, idcourse, idchapter) VALUES
(9, 'Archivio Online', 'Chiavetta USB', 'Hard Disk', 'Cloud', 'CD', 3, 1, 3),
(10, 'Porta di Input/Output', 'Mouse', 'Altoparlante', 'HDMI', 'Tastiera', 3, 1, 3),
(11, 'Diminuire grandezza file', 'Upload', 'Estrazione', 'Compressione', 'Ripristino', 3, 1, 3),
(12, 'Estensione file compressi', '.zip', '.mp3', '.docx', '.pdf', 1, 1, 3);

-- Verify data integrity
SELECT COUNT(*) FROM quiz_provvisorio WHERE idcourse = 1 AND idchapter = 3;
SELECT username, password FROM "user" WHERE username = 'docente'; 