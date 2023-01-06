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
