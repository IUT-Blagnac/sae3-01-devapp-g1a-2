DROP TABLE Livraison;
DROP TABLE Constituer;
DROP TABLE CarteBancaire;
DROP TABLE Domicile;
DROP TABLE Relais;
DROP TABLE Article;
DROP TABLE Client;
DROP TABLE Commande;

CREATE TABLE Livraison
(
	typeLivraison VARCHAR(30),
	CONSTRAINT pk_Livraison PRIMARY KEY (typeLivraison)	
);



CREATE TABLE Client
(
	numC NUMBER,
	nomC VARCHAR(30),
	prenomC VARCHAR(30), 
	genreC VARCHAR(30),
	numTelC VARCHAR(10),
	naissanceC DATE,
	emailC VARCHAR(30),
	mdpC VARCHAR(70),
	CONSTRAINT pk_Client PRIMARY KEY (numC)
);


CREATE TABLE CarteBancaire
(
	numCB CHAR(16),
	nomCB VARCHAR(30),
	expiCB DATE,
	cryptoCB CHAR(3),
	numC NUMBER,
	CONSTRAINT pk_CarteBancaire PRIMARY KEY(numCB),
	CONSTRAINT fk_CarteBancaire_numC FOREIGN KEY (numC) REFERENCES Client(numC)
);

CREATE TABLE Commande 
(
	numCom NUMBER,
	dateCom DATE, 
	montantReduc NUMBER,
	fraisLivraison NUMBER,
	numC NUMBER,
	numCB CHAR(16),
    typeLivraison VARCHAR(30),
	CONSTRAINT pk_Commande PRIMARY KEY (numCom),
	CONSTRAINT ck_Commande_fraisLivraison CHECK (fraisLivraison > 0),
	CONSTRAINT fk_Commande_numC FOREIGN KEY (numC) REFERENCES Client(numC),
	CONSTRAINT fk_Commande_numCB FOREIGN KEY (numCB) REFERENCES CarteBancaire(numCB),
	CONSTRAINT fk_Commande_typeLivraison FOREIGN KEY (typeLivraison) REFERENCES Livraison(typeLivraison)
);

CREATE TABLE Article
(
	refA VARCHAR(30),
	categorieA VARCHAR(30),
	sousCategorieA VARCHAR(30),
	descA VARCHAR(500),
	prixUnitA FLOAT,
	dispoProduitA VARCHAR(30),
	etatSoldeA NUMBER,
	couleurA VARCHAR(30),
	tailleA VARCHAR(2),
	CONSTRAINT pk_Article PRIMARY KEY (refA),
	CONSTRAINT ck_Article_etatSolde CHECK ( etatSoldeA BETWEEN 0 AND 100)
);

CREATE TABLE Constituer 
(
	numCom NUMBER,
	refA VARCHAR(30),
	quantite NUMBER,
	CONSTRAiNT pk_Constituer PRIMARY KEY (numCom,refA),
	CONSTRAINT fk_Constituer_numCom FOREIGN KEY (numCom) REFERENCES Commande(numCom),
	CONSTRAINT fk_Constituer_refA FOREIGN KEY (refA) REFERENCES Article(refA),
	CONSTRAINT ck_Constituer_quantite CHECK (quantite > 0)
);

CREATE TABLE Domicile
(
	idD NUMBER,
	adresseD VARCHAR(30),
	postalD CHAR(5),
	villeD VARCHAR(30),
	numC NUMBER,
    typeLivraison VARCHAR(30),
	CONSTRAINT pk_Domicile PRIMARY KEY (adresseD),
	CONSTRAINT fk_Domicile_numC FOREIGN KEY (numC) REFERENCES Client(numC),
	CONSTRAINT fk_Domicile_typeLivraison FOREIGN KEY (typeLivraison) REFERENCES Livraison(typeLivraison)
);

CREATE TABLE Relais 
(
	numRelais NUMBER,
	nomRelais VARCHAR(30),
	adresseRelais VARCHAR(30),
	postalRelais CHAR(5),
	villeRelais VARCHAR(30),
    typeLivraison VARCHAR(30),
	CONSTRAINT pk_Relais PRIMARY KEY (numRelais),
	CONSTRAINT fk_Relais_typeLivraison FOREIGN KEY (typeLivraison) REFERENCES Livraison(typeLivraison)
);


