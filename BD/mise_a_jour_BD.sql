ALTER TABLE Article
ADD stockA NUMBER;

UPDATE Article 
SET stockA = 100;

ALTER TABLE Article
ADD nbEtoilesA NUMBER;

UPDATE Article 
SET nbEtoilesA = 4;

ALTER TABLE Article
ADD CONSTRAINT ck_Article_stock CHECK (stockA >= 0); 

ALTER TABLE Article
ADD CONSTRAINT ck_Article_nbEtoiles CHECK ( nbEtoilesA >= 0 AND nbEtoilesA <= 5);

DROP TABLE Panier;
CREATE TABLE Panier
(
    numC NUMBER,
    refA VARCHAR(30),
    quantite NUMBER,
    CONSTRAINT pk_Panier PRIMARY KEY (numC,refA),
    CONSTRAINT fk_Panier_numC FOREIGN KEY (numC) REFERENCES Client(numC),
    CONSTRAINT fk_Panier_refA FOREIGN KEY (refA) REFERENCES Article(refA),
    CONSTRAINT ck_Panier_quantite CHECK (quantite >0)
);

ALTER TABLE article
ADD categorieArticle VARCHAR(25);

DROP TABLE Avis;
CREATE TABLE Avis
(
    categorieA VARCHAR(30),
    numC NUMBER,
    commAv VARCHAR(1000),
    nbrEtoilesAv NUMBER,
    dateAv DATE,
    CONSTRAINT pk_Avis_categorieA_numC PRIMARY KEY (categorieA,numC),
    CONSTRAINT fk_Avis_numC FOREIGN KEY (numC) REFERENCES Client(numC),
    CONSTRAINT ck_Avis_Etoiles CHECK (nbrEtoilesAv BETWEEN 0 AND 5)
)

COMMIT;

SELECT AV.commAv 
FROM Avis AV, Article A
WHERE AV.categorieA = A.categorieA;


INSERT INTO Avis
VALUES( 'Masques',102,'Tres beau masque, je le recommande a tout les amateurs de ski',3,'16-01-2023');

INSERT INTO Avis
VALUES( 'Masques',161,'Tres beau masque, je le recommande a tous les professionnels de ski',3,'16-01-2023');

COMMIT;


SELECT * FROM Avis;

SELECT TO_CHAR(dateAv, 'dd-mm-yyyy') FROM Avis;

ALTER TABLE Avis
ADD titreAv VARCHAR (50);


UPDATE Avis
SET titreAv = 'Masque génial mais mousse trop dure';

COMMIT;

