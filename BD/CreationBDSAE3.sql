DROP TABLE Livraison;
DROP TABLE Constituer;
DROP TABLE CarteBancaire;
DROP TABLE Domicile;
DROP TABLE Relais;
DROP TABLE Article;
DROP TABLE Client;
DROP TABLE Commande;

CREATE TABLE Commande 
(
	numCom NUMBER,
	dateCom DATE, 
	montantReduc NUMBER,
	fraisLivraison NUMBER,
	CONSTRAINT pk_Commande PRIMARY KEY (numCom),
	CONSTRAINT ck_Commande_fraisLivraison CHECK (fraisLivraison > 0)
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
	numCom NUMBER,
	CONSTRAINT pk_Client PRIMARY KEY (numC),
	CONSTRAINT fk_Client_numCom FOREIGN KEY (numCom) REFERENCES Commande(numCom)
);


CREATE TABLE CarteBancaire
(
	numCB CHAR(16),
	nomCB VARCHAR(30),
	expiCB DATE,
	cryptoCB CHAR(3),
	numCom NUMBER,
	CONSTRAINT pk_CarteBancaire PRIMARY KEY(numCB),
	CONSTRAINT fk_CarteBancaire_numCom FOREIGN KEY (numCom) REFERENCES Commande(numCom)
);

CREATE TABLE Article
(
	refA VARCHAR(30),
	categorieA VARCHAR(30),
	descA VARCHAR(100),
	prixUnitA FLOAT,
	etatProduitA VARCHAR(30),
	etatSoldeA VARCHAR(30),
	couleurA VARCHAR(30),
	CONSTRAINT pk_Article PRIMARY KEY (refA)
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
	adresseD VARCHAR(30),
	postalD CHAR(5),
	villeD VARCHAR(30),
	numC NUMBER,
	CONSTRAINT pk_Domicile PRIMARY KEY (adresseD),
	CONSTRAINT fk_Domicile_numC FOREIGN KEY (numC) REFERENCES Client(numC)
);

CREATE TABLE Relais 
(
	numRelais NUMBER,
	nomRelais VARCHAR(30),
	adresseRelais VARCHAR(30),
	postalRelais CHAR(5),
	villeRelais VARCHAR(30),
	CONSTRAINT pk_Relais PRIMARY KEY (numRelais)
);

CREATE TABLE Livraison
(
	typeLivraison VARCHAR(30),
	numCom NUMBER,
	adresseD VARCHAR(30),
	numRelais NUMBER,
	CONSTRAINT pk_Livraison PRIMARY KEY (typeLivraison),
	CONSTRAINT fk_Livraison_numCom FOREIGN KEY (numCom) REFERENCES Commande(numCom),
	CONSTRAINT fk_Livraison_adresseD FOREIGN KEY (adresseD) REFERENCES Domicile(adresseD),
	CONSTRAINT fk_Livraison_numRelais FOREIGN KEY (numRelais) REFERENCES Relais(numRelais)
);


	
ROLLBACK;