
DROP SEQUENCE "SAEBD02"."SEQ_Article";
DROP SEQUENCE "SAEBD02"."SEQ_CLIENT";
DROP SEQUENCE "SAEBD02"."SEQ_Relais";

CREATE SEQUENCE  "SAEBD02"."SEQ_Article"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;

CREATE SEQUENCE  "SAEBD02"."SEQ_CLIENT"  MINVALUE 1 MAXVALUE 999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;

CREATE SEQUENCE  "SAEBD02"."SEQ_Relais"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;

INSERT INTO Article VALUES 
("SEQ_Article".NEXTVAL,'Gants','standard','Gants de protection de ski, couleur unie ',14.99,'Disponible',0,'Noir','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Gants','standard','Gants de protection de ski, couleur unie ',14.99,'Disponible',0,'Noir','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Gants','standard','Gants de protection de ski, couleur unie ',14.99,'Disponible',0,'Noir','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Gants','standard','Gants de protection de ski, couleur unie ',14.99,'Disponible',0,'Noir','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Gants','standard','Gants de protection de ski, couleur unie ',14.99,'Disponible',0,'Noir','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Gants','standard','Gants de protection de ski, couleur unie ',14.99,'Disponible',0,'Bleu','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Gants','standard','Gants de protection de ski, couleur unie ',14.99,'Disponible',0,'Bleu','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Gants','standard','Gants de protection de ski, couleur unie ',14.99,'Disponible',0,'Bleu','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Gants','standard','Gants de protection de ski, couleur unie ',14.99,'Disponible',0,'Bleu','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Gants','standard','Gants de protection de ski, couleur unie ',14.99,'Disponible',0,'Bleu','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Gants','standard','Gants de protection de ski, couleur unie ',14.99,'Disponible',0,'Rouge','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Gants','standard','Gants de protection de ski, couleur unie ',14.99,'Disponible',0,'Rouge','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Gants','standard','Gants de protection de ski, couleur unie ',14.99,'Disponible',0,'Rouge','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Gants','standard','Gants de protection de ski, couleur unie ',14.99,'Disponible',0,'Rouge','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Gants','standard','Gants de protection de ski, couleur unie ',14.99,'Disponible',0,'Rouge','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Bleu','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Bleu','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Bleu','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Bleu','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Bleu','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Rouge','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Rouge','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Rouge','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Rouge','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Rouge','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Vert','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Vert','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Vert','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Vert','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Vert','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Noir','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Noir','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Noir','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Noir','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Noir','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Orange','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Orange','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Orange','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Orange','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Luges','standard','Luge en plastique recyclé ',19.99,'Disponible',0,'Orange','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Skis','standard','Des skis parfaits pour vos escapades en montagnes  ',399.99,'Disponible',0,'Noir','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Skis','standard','Des skis parfaits pour vos escapades en montagnes  ',399.99,'Disponible',0,'Noir','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Skis','standard','Des skis parfaits pour vos escapades en montagnes  ',399.99,'Disponible',0,'Noir','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Skis','standard','Des skis parfaits pour vos escapades en montagnes  ',399.99,'Disponible',0,'Noir','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Skis','standard','Des skis parfaits pour vos escapades en montagnes  ',399.99,'Disponible',0,'Noir','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Skis','standard','Des skis parfaits pour vos escapades en montagnes  ',399.99,'Disponible',0,'Rouge','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Skis','standard','Des skis parfaits pour vos escapades en montagnes  ',399.99,'Disponible',0,'Rouge','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Skis','standard','Des skis parfaits pour vos escapades en montagnes  ',399.99,'Disponible',0,'Rouge','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Skis','standard','Des skis parfaits pour vos escapades en montagnes  ',399.99,'Disponible',0,'Rouge','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Skis','standard','Des skis parfaits pour vos escapades en montagnes  ',399.99,'Disponible',0,'Rouge','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Skis','standard','Des skis parfaits pour vos escapades en montagnes  ',399.99,'Disponible',0,'Custom','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Skis','standard','Des skis parfaits pour vos escapades en montagnes  ',399.99,'Disponible',0,'Custom','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Skis','standard','Des skis parfaits pour vos escapades en montagnes  ',399.99,'Disponible',0,'Custom','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Skis','standard','Des skis parfaits pour vos escapades en montagnes  ',399.99,'Disponible',0,'Custom','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Skis','standard','Des skis parfaits pour vos escapades en montagnes  ',399.99,'Disponible',0,'Custom','XL');


INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Snowboard','standard','Un snowboard parfait pour vos escapades en montagnes  ',399.99,'Disponible',0,'Noir','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Snowboard','standard','Un snowboard parfait pour vos escapades en montagnes  ',399.99,'Disponible',0,'Noir','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Snowboard','standard','Un snowboard parfait pour vos escapades en montagnes  ',399.99,'Disponible',0,'Noir','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Snowboard','standard','Un snowboard parfait pour vos escapades en montagnes  ',399.99,'Disponible',0,'Noir','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Snowboard','standard','Un snowboard parfait pour vos escapades en montagnes  ',399.99,'Disponible',0,'Noir','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Snowboard','standard','Un snowboard parfait pour vos escapades en montagnes  ',399.99,'Disponible',0,'Rouge','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Snowboard','standard','Un snowboard parfait pour vos escapades en montagnes  ',399.99,'Disponible',0,'Rouge','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Snowboard','standard','Un snowboard parfait pour vos escapades en montagnes  ',399.99,'Disponible',0,'Rouge','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Snowboard','standard','Un snowboard parfait pour vos escapades en montagnes  ',399.99,'Disponible',0,'Rouge','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Snowboard','standard','Un snowboard parfait pour vos escapades en montagnes  ',399.99,'Disponible',0,'Rouge','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Snowboard','standard','Un snowboard parfait pour vos escapades en montagnes  ',399.99,'Disponible',0,'Custom','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Snowboard','standard','Un snowboard parfait pour vos escapades en montagnes  ',399.99,'Disponible',0,'Custom','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Snowboard','standard','Un snowboard parfait pour vos escapades en montagnes  ',399.99,'Disponible',0,'Custom','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Snowboard','standard','Un snowboard parfait pour vos escapades en montagnes  ',399.99,'Disponible',0,'Custom','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Snowboard','standard','Un snowboard parfait pour vos escapades en montagnes  ',399.99,'Disponible',0,'Custom','XL');


INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Raquette','standard','Des raquettes parfaites pour vos escapades en montagnes  ',399.99,'Disponible',0,'Noir','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Raquette','standard','Des raquettes parfaites pour vos escapades en montagnes  ',399.99,'Disponible',0,'Noir','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Raquette','standard','Des raquettes parfaites pour vos escapades en montagnes  ',399.99,'Disponible',0,'Noir','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Raquette','standard','Des raquettes parfaites pour vos escapades en montagnes  ',399.99,'Disponible',0,'Noir','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Raquette','standard','Des raquettes parfaites pour vos escapades en montagnes  ',399.99,'Disponible',0,'Noir','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Raquette','standard','Des raquettes parfaites pour vos escapades en montagnes  ',399.99,'Disponible',0,'Rouge','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Raquette','standard','Des raquettes parfaites pour vos escapades en montagnes  ',399.99,'Disponible',0,'Rouge','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Raquette','standard','Des raquettes parfaites pour vos escapades en montagnes  ',399.99,'Disponible',0,'Rouge','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Raquette','standard','Des raquettes parfaites pour vos escapades en montagnes  ',399.99,'Disponible',0,'Rouge','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Raquette','standard','Des raquettes parfaites pour vos escapades en montagnes  ',399.99,'Disponible',0,'Rouge','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Raquette','standard','Des raquettes parfaites pour vos escapades en montagnes  ',399.99,'Disponible',0,'Bleu','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Raquette','standard','Des raquettes parfaites pour vos escapades en montagnes  ',399.99,'Disponible',0,'Bleu','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Raquette','standard','Des raquettes parfaites pour vos escapades en montagnes  ',399.99,'Disponible',0,'Bleu','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Raquette','standard','Des raquettes parfaites pour vos escapades en montagnes  ',399.99,'Disponible',0,'Bleu','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Raquette','standard','Des raquettes parfaites pour vos escapades en montagnes  ',399.99,'Disponible',0,'Bleu','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Raquette','standard','Des raquettes parfaites pour vos escapades en montagnes  ',399.99,'Disponible',0,'Jaune','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Raquette','standard','Des raquettes parfaites pour vos escapades en montagnes  ',399.99,'Disponible',0,'Jaune','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Raquette','standard','Des raquettes parfaites pour vos escapades en montagnes  ',399.99,'Disponible',0,'Jaune','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Raquette','standard','Des raquettes parfaites pour vos escapades en montagnes  ',399.99,'Disponible',0,'Jaune','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Raquette','standard','Des raquettes parfaites pour vos escapades en montagnes  ',399.99,'Disponible',0,'Jaune','XL');






INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Noir','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Noir','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Noir','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Noir','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Noir','XL');


INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Bleu','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Bleu','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Bleu','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Bleu','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Bleu','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Jaune','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Jaune','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Jaune','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Jaune','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Jaune','XL');


INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Rouge','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Rouge','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Rouge','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Rouge','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Rouge','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Marron','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Marron','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Marron','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Marron','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Casques','standard','Un casque résistant même au chutes les plus graves',49.99,'Disponible',0,'Marron','XL');


INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Vestes','standard','Une veste impérméable même au blizzard les plus intenses',109.99,'Disponible',0,'Noir','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Vestes','standard','Une veste impérméable même au blizzard les plus intenses',109.99,'Disponible',0,'Noir','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Vestes','standard','Une veste impérméable même au blizzard les plus intenses',109.99,'Disponible',0,'Noir','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Vestes','standard','Une veste impérméable même au blizzard les plus intenses',109.99,'Disponible',0,'Noir','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Vestes','standard','Une veste impérméable même au blizzard les plus intenses',109.99,'Disponible',0,'Noir','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Vestes','standard','Une veste impérméable même au blizzard les plus intenses',109.99,'Disponible',0,'Bleu','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Vestes','standard','Une veste impérméable même au blizzard les plus intenses',109.99,'Disponible',0,'Bleu','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Vestes','standard','Une veste impérméable même au blizzard les plus intenses',109.99,'Disponible',0,'Bleu','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Vestes','standard','Une veste impérméable même au blizzard les plus intenses',109.99,'Disponible',0,'Bleu','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Vestes','standard','Une veste impérméable même au blizzard les plus intenses',109.99,'Disponible',0,'Bleu','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Vestes','standard','Une veste impérméable même au blizzard les plus intenses',109.99,'Disponible',0,'Rouge','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Vestes','standard','Une veste impérméable même au blizzard les plus intenses',109.99,'Disponible',0,'Rouge','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Vestes','standard','Une veste impérméable même au blizzard les plus intenses',109.99,'Disponible',0,'Rouge','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Vestes','standard','Une veste impérméable même au blizzard les plus intenses',109.99,'Disponible',0,'Rouge','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Vestes','standard','Une veste impérméable même au blizzard les plus intenses',109.99,'Disponible',0,'Rouge','XL');



INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Vestes','standard','Une veste impérméable même au blizzard les plus intenses',109.99,'Disponible',0,'Marron','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Vestes','standard','Une veste impérméable même au blizzard les plus intenses',109.99,'Disponible',0,'Marron','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Vestes','standard','Une veste impérméable même au blizzard les plus intenses',109.99,'Disponible',0,'Marron','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Vestes','standard','Une veste impérméable même au blizzard les plus intenses',109.99,'Disponible',0,'Marron','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Vestes','standard','Une veste impérméable même au blizzard les plus intenses',109.99,'Disponible',0,'Marron','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Noir','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Noir','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Noir','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Noir','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Noir','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Gris','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Gris','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Gris','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Gris','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Gris','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Bleu','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Bleu','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Bleu','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Bleu','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Bleu','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Jaune','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Jaune','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Jaune','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Jaune','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Jaune','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Rouge','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Rouge','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Rouge','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Rouge','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Chaussures','standard','Des bottes qui vous mettrons au paradis pendant que vous traversez l enfer',100,'Disponible',0,'Rouge','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Noir','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Noir','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Noir','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Noir','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Noir','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Jaune','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Jaune','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Jaune','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Jaune','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Jaune','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Bleu','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Bleu','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Bleu','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Bleu','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Bleu','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Rouge','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Rouge','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Rouge','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Rouge','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Rouge','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Gris','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Gris','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Gris','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Gris','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Gris','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Blanc','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Blanc','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Blanc','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Blanc','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Masques','standard','Un masque qui vous rendra cool',39.99,'Disponible',0,'Blanc','XL');

INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Bobsleighs','standard','Un bobsleigh comme dans Rasta Rocket',49999.99,'Disponible',0,'Noir','XS');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Bobsleighs','standard','Un bobsleigh comme dans Rasta Rocket',49999.99,'Disponible',0,'Noir','S');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Bobsleighs','standard','Un bobsleigh comme dans Rasta Rocket',49999.99,'Disponible',0,'Noir','M');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Bobsleighs','standard','Un bobsleigh comme dans Rasta Rocket',49999.99,'Disponible',0,'Noir','L');
INSERT INTO Article VALUES
("SEQ_Article".NEXTVAL,'Bobsleighs','standard','Un bobsleigh comme dans Rasta Rocket',49999.99,'Disponible',0,'Noir','XL');


SELECT * FROM Article;

INSERT INTO Livraison
VALUES ('Relais');

INSERT INTO RELAIS VALUES
("SEQ_Relais".NEXTVAL,'FRIPE BROC AND SHOP','10 RUE MALBEC','31000','Toulouse','Relais');

INSERT INTO RELAIS VALUES
("SEQ_Relais".NEXTVAL,'AMIECO','7 RUE BAOUR LORMIAN','31000','Toulouse','Relais');

INSERT INTO RELAIS VALUES
("SEQ_Relais".NEXTVAL,'LE TEMPS DU CBD','69 AVENUE DES PYRENEES','31830','PLAISANCE-DU-TOUCH','Relais');

INSERT INTO RELAIS VALUES
("SEQ_Relais".NEXTVAL,'SHOP COIFFURE','9 PLACE D OCCITANIE','31770','Colomiers','Relais');

INSERT INTO RELAIS VALUES
("SEQ_Relais".NEXTVAL,'IUT Blagnac','1 Pl. Georges Brassens','31700','Blagnac','Relais');

INSERT INTO RELAIS VALUES
("SEQ_Relais".NEXTVAL,'CARREFOUR CITY MATABIAU','33-35 RUE MATABIAU','31000','Toulouse','Relais');

INSERT INTO RELAIS VALUES
("SEQ_Relais".NEXTVAL,'YM BEAUTY','45 RUE DE LA REPUBLIQUE','31000','Toulouse','Relais');

INSERT INTO RELAIS VALUES
("SEQ_Relais".NEXTVAL,'LA FABRICA','13 PLACE INTERIEURE SAINT-CYP','31000','Toulouse','Relais');

SELECT * FROM Relais;

INSERT INTO Client VALUES
  ("SEQ_Client".NEXTVAL,'Dexter','Lara','Femme','04 48 72 47 93','04/22/1998','mauris.ut@hotmail.com','$2y$10$63a4/kx0YRx/KM/Ztf/KS.oBq559hXhcK.4MRijGoOQFD3thPKY5K');

INSERT INTO Client VALUES
  ("SEQ_Client".NEXTVAL,'Garrison','Landry','Homme','03 12 50 82 64','12/31/1960','lorem.ipsum.dolor@outlook.com','$2y$10$luR6uumxazqRm.qnyCgNf.0ddgsqaw8UuMKMc5wh1CUttw6ga5rF.');

INSERT INTO Client VALUES
  ("SEQ_Client".NEXTVAL,'Paula','Oconnor','Femme','07 11 26 27 20','10/21/1986','in@outlook.com','$2y$10$.kIUqQmEkjdMRN7h203arOTE.ZY01JntT5sxKodwEosrtmSMjI9W.');

INSERT INTO Client VALUES
  ("SEQ_Client".NEXTVAL,'Kenneth','Holman','Homme','07 21 16 84 58','07/29/1984','pellentesque@outlook.com','$2y$10$5QIiWY8gPWd/xBRftjS8GOHFuwYpB6vgdZecxOOQW2IL26ht7d8Xu');


INSERT INTO Client VALUES
  ("SEQ_Client".NEXTVAL,'Pred','Kyle','Homme','08 51 64 48 56','01/17/1964','kyle.pred@yahoo.com','$2y$10$F6fv/.ruEdtF2NPZHCaA6urwUePpBQEFVW7sih3xydl7KnzLqVnl.');

INSERT INTO Client VALUES
  ("SEQ_Client".NEXTVAL,'Brittany','Angel','Femme','02 41 72 87 63','04/22/1997','Brittany.angel@hotmail.com','$2y$10$lEo60ZWdYb5fJAmGaFS4GenUqDf0TM49LiHBVpE3S5fNpwadoCia.');


INSERT INTO Client VALUES
  ("SEQ_Client".NEXTVAL,'Smith','Henry','Homme','07 18 54 22 44','12/31/1959','henry.smith@outlook.com','$2y$10$1IBAzW/fckJmcnKYup/s0eW3QoGLFPK9iF4QNh8vkFcuzv0RV9Sii');

INSERT INTO Client VALUES
  ("SEQ_Client".NEXTVAL,'Everly','Claire','Femme','05 14 86 57 10','11/21/1986','claire.everly@outlook.com','$2y$10$JdYLjf4PU/JNluOpweuaNONFfD8qsbvoZmH/SodHg7wAOfVWXmUMq');

INSERT INTO Client VALUES
  ("SEQ_Client".NEXTVAL,'Hogan','Stephen','Homme','04 81 19 24 58','07/29/1983','stephen.hogan@outlook.com','$2y$10$vGpoNrQnTKYjywXP1erPDuV61Q7.XsNpfF3Lp2sYncBHUWbDybS7i');

INSERT INTO Client VALUES
  ("SEQ_Client".NEXTVAL,'Solomon','Damien','Homme','04 52 74 77 16','01/17/1987','damien.solomon@yahoo.com','$2y$10$I1I4MbU.1HgJyZsR4R0xXeIuUyPz28G0AIplLnp.927F1MmQYx44y');




INSERT INTO Client VALUES
 ("SEQ_Client".NEXTVAL,'Zahir','Finley','Homme','07 74 19 02 18','12/30/1978','est@google.net','$2y$10$D0qGzGB6g4X3u0qP7Y5kpuI9eX0w9kQpllrq2EumEXF8XcfbRjL7q');

INSERT INTO Client VALUES
  ("SEQ_Client".NEXTVAL,'Herman','Sexton','molestie@google.edu','homme','06 65 28 09 63','30/02/1970','mauris.blandit@protonmail.couk','$2y$10$.achb.DNQiu8pxQqCYareeyScS6yKBTWttntsPT4pvp7EsOgjxjr2');

INSERT INTO Client VALUES
  ("SEQ_Client".NEXTVAL,'Kaseem','Bentley','Homme','02 84 37 01 2','02/23/199','varius.ultrices@gmail.com','$2y$10$k8MvluR.XDyPdfucRoHScutQuWG3b1RVs3mMo0/7HM0A1SJmPe93i');

INSERT INTO Client VALUES
  ("SEQ_Client".NEXTVAL,'Erich','Molina','Homme','07 39 17 59 7','05/19/1967','suscipit.nonummy@icloud.com','$2y$10$5ZAAux3ql0AP9f8LOVMD6OoD21V/.hPi/aWn.KFJrFaJUtaFWgXtu');

INSERT INTO Client VALUES
  ("SEQ_Client".NEXTVAL,'Brandon','Waters','Homme','04 74 61 41 82','10/20/1980','nec.diam.duis@yahoo.com','$2y$10$68KhiO3tUEhR0bOsXMvo/ukJWqWSLLbztYUijq9yqy3BIp.Mf3/nC');

INSERT INTO Client VALUES
  ("SEQ_Client".NEXTVAL,'Ray','Macdonald','Femme','06 81 85 26 64','09/27/1967','quisque@icloud.com','$2y$10$SKbdptXL.11OoPLICoojyewApmX1tap.Wj3XSRLAdI9SQz1fuP1Pu');

INSERT INTO Client VALUES
  ("SEQ_Client".NEXTVAL,'Kaseem','Bentley','Homme','02 84 37 01 2','02/23/199','varius.ultrices@gmail.com','$2y$10$Aad.L5Dht3TptxomaZGY4ep4vYJDArFipvjMu3jv3YjxB0KZXTq5K');

INSERT INTO Client VALUES
  ("SEQ_Client".NEXTVAL,'Erich','Molina','Homme','07 39 17 59 7','05/19/1967','suscipit.nonummy@icloud.com','$2y$10$JpmueXe.cM97l8cW.yVd2e4H77jG55WPnHmF4B.eVX19kegHWjf7u');

INSERT INTO Client VALUES
  ("SEQ_Client".NEXTVAL,'Christopher','Fleming','Homme','08 56 43 89 53','07/20/1997','consectetuer.euismod@outlook.com','$2y$10$kAqEP6OexixnlRHGPZ7jdOPDM5ZZiBVl7Qc.r0JsVff5DQYHYQ.Zy');

INSERT INTO Client VALUES ("SEQ_Client".NEXTVAL,'Michael','Smith','Homme','01 23 45 67 89','06/12/1995','michael.smith@gmail.com','$2y$10$fRVPs60USHd0LuC/Jmto4.6FjWYvSBQxTXXjYqGwnqMTR4Ar2NAV2');

 INSERT INTO Client VALUES ("SEQ_Client".NEXTVAL,'Samantha','Williams','Femme','09 87 65 43 21','08/17/2000','samantha.williams@yahoo.com','$2y$10$KlF7G.p0I2ZqyJtILh2ixebLtd/AH9t8QbqpVEqmlK5wA5Yuw95Jm');

 INSERT INTO Client VALUES ("SEQ_Client".NEXTVAL,'John','Doe','Homme','02 34 56 78 90','03/14/1997','john.doe@outlook.com','$2y$10$6NDT7r33VEn3Y8K76TkfqeFu2nnbufrsapzEZXAdqE4t/LkqKe/6e');

 INSERT INTO Client VALUES ("SEQ_Client".NEXTVAL,'Emily','Parker','Femme','05 67 89 01 23','07/01/1999','emily.parker@aol.com','$2y$10$Gu/H6g1EquV/uM0S8F4LsO9DlA9mvU5hSroHSGffwXrqWePaVxiJK');



INSERT INTO Client VALUES ("SEQ_Client".NEXTVAL,'Jessica','Brown','Femme','03 21 54 76 98','09/05/1996','jessica.brown@gmail.com','$2y$10$iFRzgnz03Wq2wUG3Iu7Ok.p3MIa.YbutbfS8eL8Js8U5yKeRkEg2C'); 

INSERT INTO Client VALUES ("SEQ_Client".NEXTVAL,'David','Moore','Homme','07 65 43 21 09','11/20/1998','david.moore@yahoo.com','$2y$10$tWCW0dtASEbm/4mYxU3niOIEIqb0P2Grw3/uasq/EWSVO1eUB/oFq');

 INSERT INTO Client VALUES ("SEQ_Client".NEXTVAL,'Ashley','Johnson','Femme','06 54 32 10 98','01/15/2000','ashley.johnson@outlook.com','$2y$10$sFjEhZfccRAPj7cSnq.gEeKYqFI9Q6wcS9b5AJflMJT7KBzsRZhra');

 INSERT INTO Client VALUES ("SEQ_Client".NEXTVAL,'Chris','Williams','Homme','08 76 54 32 10','05/03/1997','chris.williams@aol.com','$2y$10$pupAzWOyXUg/xmz.HK./D.5664ozNow3pf/kTxtKdT7BGAD1cyBIi');

INSERT INTO Client VALUES ("SEQ_Client".NEXTVAL,'Megan','Thompson','Femme','04 32 10 98 76','07/28/1999','megan.thompson@gmail.com','$2y$10$FGgkSr0GdHJs47stubQTOOGLsR//HSszEHeIqR/QL9qlJX41WUiGW');

 INSERT INTO Client VALUES ("SEQ_Client".NEXTVAL,'James','Martin','Homme','09 87 65 43 21','12/15/1995','james.martin@yahoo.com','$2y$10$L1FweV9ATpO7hVgO/Rdg2u6LZm9sgWcaeJrxhvA6L30E056B92Piu'); 

INSERT INTO Client VALUES ("SEQ_Client".NEXTVAL,'Sara','Wilson','Femme','02 43 56 78 90','04/21/1998','sara.wilson@outlook.com','$2y$10$8CYgskjxtnSwuVQRn0D59eGs7n55xC4SQMlEjSB73Rl9ONo.5nqH2'); 

INSERT INTO Client VALUES ("SEQ_Client".NEXTVAL,'Matthew','Jones','Homme','01 23 45 67 89','06/01/1997','matthew.jones@aol.com','$2y$10$bAA5hcaNHOTVBZdMBv/P/OGriADBpnhMuszjKFnrMyCijwm.Sku46');

INSERT INTO Client VALUES
("SEQ_Client".NEXTVAL,'Emily','Green','Femme','03 45 67 89 01','10/12/1996','emily.green@gmail.com','$2y$10$2fB1yPt1J9t.7Ye5celmLeVS0iPj7tlh43CAwn.wGAYBAeQkgnBIO');

INSERT INTO Client VALUES
("SEQ_Client".NEXTVAL,'Robert','White','Homme','07 89 01 23 45','02/15/1998','robert.white@yahoo.com','$2y$10$9qO0to.GbaW8r1tbVq3ifOTD8mErDV3reAygO6.2TPuHnmGAKhpVO');

INSERT INTO Client VALUES
("SEQ_Client".NEXTVAL,'Amanda','Brown','Femme','06 78 90 12 34','05/20/1999','amanda.brown@outlook.com','$2y$10$MwUN5gJBkv.qF.bAcoTb/u451u/MuqFLc.CLUHVg/FvWAaJZ6crhq');

INSERT INTO Client VALUES
("SEQ_Client".NEXTVAL,'William','Jones','Homme','08 12 34 56 78','09/01/1997','william.jones@aol.com','$2y$10$n9SXSUGIKGPnz/XVKYaIxO17wNQQ9v0kkZpoWXkq.QzZVlZk/fteC');

INSERT INTO Client VALUES
("SEQ_Client".NEXTVAL,'Ashley','Johnson','Femme','09 23 45 67 89','12/25/1996','ashley.johnson@gmail.com','$2y$10$EwUAz3qDouNEFf/yP4WjN.PFHwNNuMSFldlSQccShc9mQ8IwTgUXy');

INSERT INTO Client VALUES
("SEQ_Client".NEXTVAL,'Christopher','Martin','Homme','01 45 67 89 01','03/14/1998','christopher.martin@yahoo.com','$2y$10$QZ4PIHDLbRkZrvMA8WgRmOXtW0nVrIjDEwwR3WQDhsjfU7Ov5.GM6');

INSERT INTO Client VALUES
("SEQ_Client".NEXTVAL,'Samantha','Williams','Femme','02 56 78 90 12','06/20/1999','samantha.williams@outlook.com','$2y$10$ECdi0DyDpBG9uIOote5MF.7xMtBNuWc5DtRQECrfA3mdLvhQIPZ1K');

INSERT INTO Client VALUES
("SEQ_Client".NEXTVAL,'David','Moore','Homme','03 67 89 01 23','09/05/1997','david.moore@aol.com','$2y$10$IcWZf1C.YAJIizm0cUSnK.SSuRkJ2T9uPu1ZszWM7RGr7Tbj03FJS');

INSERT INTO Client VALUES
("SEQ_Client".NEXTVAL,'Brian','Smith','Homme','04 56 78 90 12','11/01/1996','brian.smith@gmail.com','$2y$10$AHShUpOACoskLF/WMYRpHOPm9oNdbXaIK3Mg6LT7.9fOvwJ1Q6BZS');

INSERT INTO Client VALUES
("SEQ_Client".NEXTVAL,'Megan','Wilson','Femme','05 67 89 01 23','02/14/1998','megan.wilson@yahoo.com','$2y$10$MJvIzMAcSzfmO9ofoKNB6.tCDt8F4aPnM.MWXTNlioSOFHLyfooUe');

INSERT INTO Client VALUES
("SEQ_Client".NEXTVAL,'Matthew','Brown','Homme','06 78 90 12 34','05/20/1999','matthew.brown@outlook.com','$2y$10$94ubtT6bb4.oQuCDOOnVH.rx7Nk.yfie/PDi31.slp8mlpy8kdesu');

INSERT INTO Client VALUES
("SEQ_Client".NEXTVAL,'Ashley','Jones','Femme','07 89 01 23 45','08/01/1997','ashley.jones@aol.com','$2y$10$DSpGYEC9TZvQ7qMkWZ.7bOt2abGIPDn4D37Vzw.jxJVG.sN1vmyG.');

INSERT INTO Client VALUES
("SEQ_Client".NEXTVAL,'Christopher','Williams','Homme','08 01 23 45 67','11/25/1996','christopher.williams@gmail.com','$2y$10$lYFx0OXQ2s8RSGMatghetu.N.LeXk5ixpw80E.j.AkBfw/18DDmfu');

INSERT INTO Client VALUES
("SEQ_Client".NEXTVAL,'Samantha','Moore','Femme','09 12 34 56 78','03/14/1998','samantha.moore@yahoo.com','$2y$10$xzY2.HQEXUBE1n422h5.gu9nEEvjNFzjOlvom6z2oIFSraRzvK3KO');

INSERT INTO Client VALUES
("SEQ_Client".NEXTVAL,'David','Smith','Homme','01 23 45 67 89','06/20/1999','david.smith@outlook.com','$2y$10$CaLPh1cOFdcufUbz6g9mYOAtupwZDWLYm87e.toZM2TVYXY1xd2u2');

INSERT INTO Client VALUES
("SEQ_Client".NEXTVAL,'Jessica','Wilson','Femme','02 34 56 78 90','09/05/1997','jessica.wilson@aol.com','$2y$10$I6pqacnBvazbR9QRMXg1u.g3L9XfXgJGPkRnR7HRiQhVcgmf9jjwm');

INSERT INTO Client VALUES
("SEQ_Client".NEXTVAL,'Ray','Gutierrez','Femme','03 45 67 89 01','10/12/1996','Ray.green@gmail.com','$2y$10$rwBBmPfYvcdEW.Y.tyV22eQXO.g07zrNjl9EY.G6AcOMSTcBO8ogq');

INSERT INTO Client VALUES
("SEQ_Client".NEXTVAL,'Robert','White','Homme','07 89 01 23 45','02/15/1998','robert.white@yahoo.com','$2y$10$eOwMqP8lqAnmFDVjgnJwd.M6xJOkYO/nIAqamPzcqP8Fglm09edtG');

COMMIT;