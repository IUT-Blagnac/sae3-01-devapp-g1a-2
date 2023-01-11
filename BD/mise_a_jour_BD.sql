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
