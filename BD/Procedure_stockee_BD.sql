-- procédure qui remet du stock sur un article selectionné 
CREATE OR REPLACE PROCEDURE remettre_du_stock ( param1 Article.refA%TYPE) AS 
BEGIN
    UPDATE Article 
    SET stockA = 100
    WHERE refA = param1;
END;