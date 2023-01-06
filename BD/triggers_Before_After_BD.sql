-- Trigger qui met à jour le stock d'un article quand un insert sur Constituer est effectué
-- lève une erreur quand la quantité à déduire passe met le stock en négatif
CREATE OR REPLACE TRIGGER t_u_Article_majStock
AFTER INSERT ON Constituer
FOR EACH ROW
DECLARE 
	ERR_STOCK_INSUFFISANT EXCEPTION;
	PRAGMA EXCEPTION_INIT( ERR_STOCK_INSUFFISANT, -20001 );
    v_stockA Article.stockA%TYPE;
BEGIN
    SELECT stockA INTO v_stockA
    FROM Article
    WHERE refA = :NEW.refA;
    
	IF (v_stockA - :NEW.quantite < 0 ) THEN 
		RAISE ERR_STOCK_INSUFFISANT;
	END IF ;
	
    UPDATE Article
    SET stockA = stockA - :NEW.quantite
    WHERE refA = :NEW.refA;
EXCEPTION 
	WHEN ERR_STOCK_INSUFFISANT THEN
		DBMS_OUTPUT.PUT_LINE('Le stock de l article est insuffisant pour cette commande');
END;

-- Trigger BEFORE qui avant une commande vérifie si il y a assez de stock et remet 100
CREATE OR REPLACE TRIGGER t_u_Article_stockVide
BEFORE INSERT ON Constituer 
FOR EACH ROW 
DECLARE 
	v_stockA Article.stockA%TYPE;
	v_refA Article.refA%TYPE;
BEGIN 
    
	SELECT stockA INTO v_stockA
	FROM Article 
	WHERE refA = :NEW.refA;
	
	SELECT refA INTO v_refA
	FROM Article 
	WHERE refA = :NEW.refA;
	IF (v_stockA <= 0) THEN 
	
	remettre_du_stock(:NEW.refA);
	END IF;
END;