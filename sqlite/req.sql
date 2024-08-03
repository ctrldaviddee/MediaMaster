-- req 1
SELECT Nom, Prenom 
FROM Etudiant;

-- req 2
SELECT Etudiant.NUMAT, Avoir_Note.Codmat, Avoir_Note.Note
FROM Etudiant, Avoir_Note
WHERE Etudiant.NUMAT = Avoir_Note.NUMAT;

SELECT Etudiant.NUMAT, Avoir_Note.Codmat, Avoir_Note.Note
FROM Etudiant
JOIN Avoir_Note ON Etudiant.NUMAT = Avoir_Note.NUMAT;

--req 3
SELECT Professeur.Numprof as num, Enseigner.CodFil as fil, Enseigner.Codmat as code
FROM Professeur, Enseigner
WHERE Professeur.Numprof = Enseigner.Numprof AND fil = 'BF1';

--req 4
SELECT NUMAT, Codmat, Note FROM Avoir_Note WHERE Note > 11

--req 5
SELECT Etudiant.Nom Nom, Etudiant.Prenom Prenoms, Etudiant.NUMAT Matricule, Avoir_Note.Codmat CodMatiere, Avoir_Note.Note as "Note < 10"
FROM Etudiant, Avoir_Note
WHERE Etudiant.NUMAT = Avoir_Note.NUMAT
AND Note < 10

--req 6
SELECT Professeur.Nom Prof, Enseigner.Codmat
FROM Professeur, Enseigner
WHERE Professeur.Numprof = Enseigner.Numprof AND Prof = "DUPONT"

--req 7
SELECT Codmat, CodFil, Coef FROM Coefficient
WHERE CodFil = "FCG2" AND Coef = 2

--req 8
SELECT Nom, CodFil FROM Etudiant
WHERE NUMAT = "E001"

--req 9
SELECT Nom, Prenom, Codmat
FROM Professeur, Enseigner
WHERE Professeur.Numprof = Enseigner.Numprof AnD Codmat ="ANG"

SELECT DISTINCT Nom, Prenom, Codmat
FROM Professeur, Enseigner
WHERE Codmat ="ANG"



