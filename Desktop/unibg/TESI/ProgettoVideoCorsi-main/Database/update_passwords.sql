-- Update passwords to plain text
UPDATE "user" 
SET password = 'docente123'
WHERE username = 'docente';

UPDATE "user" 
SET password = 'studente123'
WHERE username = 'studente';

UPDATE "user" 
SET password = 'prova123'
WHERE username = 'prova'; 