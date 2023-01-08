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

DROP TABLE Pannier;
CREATE TABLE Pannier
(
    numC NUMBER,
    refA VARCHAR(30),
    quantite NUMBER,
    CONSTRAINT pk_Pannier PRIMARY KEY (numC,refA),
    CONSTRAINT fk_Pannier_numC FOREIGN KEY (numC) REFERENCES Client(numC),
    CONSTRAINT fk_Pannier_refA FOREIGN KEY (refA) REFERENCES Article(refA),
    CONSTRAINT ck_Pannier_quantite CHECK (quantite >0)
);
