CREATE TABLE Filiere (
    CodFil VARCHAR(5) PRIMARY KEY,
    LibFil TEXT NOT NULL,
    Effectif INT
);

CREATE TABLE Etudiant (
    NUMAT VARCHAR(5) PRIMARY KEY,
    Nom TEXT NOT NULL,
    Prenom TEXT NOT NULL,
    CodFil VARCHAR(5),
    FOREIGN KEY (CodFil) REFERENCES Filiere(CodFil)
);

CREATE TABLE Professeur (
    Numprof VARCHAR(5) PRIMARY KEY,
    Nom TEXT NOT NULL,
    Prenom TEXT NOT NULL,
    Adresse TEXT
);

CREATE TABLE Matiere (
    Codmat VARCHAR(5) PRIMARY KEY,
    LibMat VARCHAR(5) NOT NULL
);

CREATE TABLE Avoir_Note (
    NUMAT VARCHAR(5),
    Codmat VARCHAR(5),
    Date Date,
    Note INT,
    PRIMARY KEY (NUMAT, Codmat, Date),
    FOREIGN KEY (NUMAT) REFERENCES Etudiant(NUMAT),
    FOREIGN KEY (Codmat) REFERENCES Matiere(Codmat)
);

CREATE TABLE Enseigner (
    Numprof VARCHAR(5),
    CodFil VARCHAR(5),
    Codmat VARCHAR(5),
    PRIMARY KEY (Numprof, Codmat, Codfil),
    FOREIGN KEY (Numprof) REFERENCES Professeur(Numprof),
    FOREIGN KEY (Codmat) REFERENCES Matiere(Codmat),
    FOREIGN KEY (Codfil) REFERENCES Filiere(CodFil)
);

CREATE TABLE Coefficient (
    Codfil VARCHAR(5),
    Codmat VARCHAR(5),
    Coef INTEGER,
    PRIMARY KEY (Codfil, Codmat),
    FOREIGN KEY (Codfil) REFERENCES Filiere(CodFil),
    FOREIGN KEY (Codmat) REFERENCES Matiere(Codmat)
);

INSERT INTO Filiere (CodFil, LibFil, Effectif) VALUES
('BF1', 'Bq et finance 1ère AN', 24),
('IG2', 'Info gest 1ère AN', 3),
('SBF', 'Secrétariat bureautique 1ère AN', 30),
('Feg2', 'Compta gest 2ème AN', 75);

SELECT * FROM Filiere;

INSERT INTO Etudiant (NUMAT, Nom, Prenom, CodFil) VALUES
('E001', 'Magenoo', 'Guttembert', 'IG2'),
('E002', 'Jolie', 'Joliette', 'SB1'),
('E003', 'Grand', 'Petit', 'BF1'),
('E004', 'PETIT', 'Marteau', 'IG2'),
('E005', 'GROS', 'Cailloux', 'FCG2'),
('E006', 'BLANC', 'Lenoir', 'FCG2'),
('E007', 'MAHIGOH', 'Bitoh', 'IG2'),
('E008', 'GROS', 'Séchard', 'IG2');

SELECT * FROM Professeur;

INSERT INTO Professeur (Numprof, Nom, Prenom, Adresse) VALUES
('P001', 'DIANGONI', 'Mandela', 'Cotonou'),
('P002', 'MAGENGO', 'Guttembert', 'Porto'),
('P003', 'DUPONT', 'Dohmi', 'Dohnikro');

INSERT INTO Matiere (Codmat, LibMat) VALUES
('FRA', 'Français'),
('ANG', 'Anglais'),
('ALG', 'Algorithme'),
('IF', 'Info Fond');

INSERT INTO Avoir_Note (NUMAT, Codmat, Date, Note) VALUES
('E001', 'FRA', '01-02-00', 14),
('E001', 'ANG', '02-02-00', 17),
('E001', 'ALG', '03-02-00', 15),
('E002', 'FRA', '01-02-00', 7),
('E002', 'ANG', '05-02-00', 12),
('E002', 'IF', '02-02-00', 12),

-- DELETE FROM Avoir_Note WHERE NUMAT="E002" and Note=12;

-- DROP TABLE Avoir_Note;

('E003', 'FRA', '02-02-00', 15),
('E003', 'IF', '06-05-01', 13),
('E004', 'ALG', '03-02-01', 12),
('E004', 'FRA', '07-02-00', 10),
('E007', 'ALG', '03-02-00', 03),
('E007', 'ANG', '02-02-00', 12);

INSERT INTO Enseigner (Numprof, Codmat, Codfil) VALUES
('P001', 'IF', 'BF1'),
('P001', 'ANG', 'IG2'),
('P002', 'IF', 'SB1'),
('P002', 'ALG', 'IG2'),
('P002', 'FRA', 'BF1'),
('P002', 'FRA', 'SB1'),
('P003', 'IF', 'FCG2'),
('P003', 'ANG', 'SR1'),
('P003', 'ANG', 'BF1'),
('P003', 'FRA', 'IG2');

INSERT INTO Coefficient (Codfil, Codmat, Coef) VALUES
('BF1', 'FRA', 2),
('BF1', 'ANG', 3),
('BF1', 'IF', 3),
('IG2', 'FRA', 1),
('IG2', 'ANG', 2),
('IG2', 'ALG', 4),
('SB1', 'FRA', 4),
('SB1', 'ANG', 3),
('SB1', 'IF', 2),
('FCG2', 'FRA', 2),
('FCG2', 'ANG', 2),
('FCG2', 'IF', 3);
