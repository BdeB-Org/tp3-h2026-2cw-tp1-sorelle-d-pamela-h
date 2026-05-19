Ã€ exÃ©cuter comme SYS @ freepdb1
GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO resto IDENTIFIED BY oracle;
ALTER USER resto DEFAULT TABLESPACE USERS;
ALTER USER resto TEMPORARY TABLESPACE TEMP;


-- Généré par Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   à :        2026-04-14 18:44:32 HAE
--   site :      Oracle Database 11g
--   type :      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE client 
    ( 
     id_client INTEGER  NOT NULL , 
     nom       VARCHAR2 (25)  NOT NULL , 
     prenom    VARCHAR2 (25)  NOT NULL , 
     email     VARCHAR2 (150) , 
     telephone VARCHAR2 (20)  NOT NULL 
    ) 
;

ALTER TABLE client 
    ADD CONSTRAINT client_PK PRIMARY KEY ( id_client ) ;

CREATE TABLE commande 
    ( 
     id_commande              INTEGER  NOT NULL , 
     prix                     NUMBER (6,2)  NOT NULL , 
     adresse_livraison        VARCHAR2 (150)  NOT NULL , 
     client_id_client         INTEGER  NOT NULL , 
     restaurent_id_restaurent INTEGER  NOT NULL 
    ) 
;

ALTER TABLE commande 
    ADD CONSTRAINT commande_PK PRIMARY KEY ( id_commande ) ;

CREATE TABLE menu 
    ( 
     id_plat   INTEGER  NOT NULL , 
     nom_plat  VARCHAR2 (30)  NOT NULL , 
     categorie VARCHAR2 (25) , 
     prix_plat NUMBER (6,2) 
    ) 
;

ALTER TABLE menu 
    ADD CONSTRAINT menu_PK PRIMARY KEY ( id_plat ) ;

CREATE TABLE menu_de_commande 
    ( 
     id_menu_de_commande  INTEGER  NOT NULL , 
     menu_id_plat         INTEGER  NOT NULL , 
     qte                  INTEGER  NOT NULL , 
     commande_id_commande INTEGER  NOT NULL 
    ) 
;

ALTER TABLE menu_de_commande 
    ADD CONSTRAINT menu_de_commande_PK PRIMARY KEY ( id_menu_de_commande ) ;

CREATE TABLE reservation 
    ( 
     id_reservation           INTEGER  NOT NULL , 
     date_reservation         DATE  NOT NULL , 
     heure                    TIMESTAMP NOT NULL,
     nbr_personne             INTEGER  NOT NULL , 
     client_id_client         INTEGER  NOT NULL , 
     restaurent_id_restaurent INTEGER  NOT NULL 
    ) 
;

ALTER TABLE reservation 
    ADD CONSTRAINT reservation_PK PRIMARY KEY ( id_reservation ) ;

CREATE TABLE restaurent 
    ( 
     id_restaurent INTEGER  NOT NULL , 
     adress        VARCHAR2 (150)  NOT NULL , 
     ville         VARCHAR2 (100)  NOT NULL , 
     telephone     VARCHAR2 (25)  NOT NULL 
    ) 
;

ALTER TABLE restaurent 
    ADD CONSTRAINT restaurent_PK PRIMARY KEY ( id_restaurent ) ;

ALTER TABLE commande 
    ADD CONSTRAINT commande_client_FK FOREIGN KEY 
    ( client_id_client) 
    REFERENCES client 
    ( id_client) 
;

ALTER TABLE commande 
    ADD CONSTRAINT commande_restaurent_FK FOREIGN KEY 
    ( restaurent_id_restaurent) 
    REFERENCES restaurent 
    ( id_restaurent) 
;

ALTER TABLE menu_de_commande 
    ADD CONSTRAINT menu_de_commande_commande_FK FOREIGN KEY 
    (  commande_id_commande) 
    REFERENCES commande 
    (  id_commande ) 
;

ALTER TABLE menu_de_commande 
    ADD CONSTRAINT menu_de_commande_menu_FK FOREIGN KEY 
    ( menu_id_plat) 
    REFERENCES menu 
    (  id_plat) 
;

ALTER TABLE reservation 
    ADD CONSTRAINT reservation_client_FK FOREIGN KEY 
    ( client_id_client ) 
    REFERENCES client 
    ( id_client) 
;

ALTER TABLE reservation 
    ADD CONSTRAINT reservation_restaurent_FK FOREIGN KEY 
    (  restaurent_id_restaurent) 
    REFERENCES restaurent 
    (  id_restaurent) 
;
-- Partie de sorelle --


-- AJOUT DES CLIENT --
INSERT INTO client VALUES (1,'Diallo','Aminata','aminata@gmail.com','514-123-4567');
INSERT INTO client VALUES (2,'Tremblay','Sophie','sophie@gmail.com','438-555-1122');
INSERT INTO client VALUES (3,'Nguyen','Lina','lina@gmail.com','514-555-7788');
INSERT INTO client VALUES (4,'Bouchard','Emma','emma@gmail.com','450-555-9988');
INSERT INTO client VALUES (5,'Gagnon','Sarah','sarah@gmail.com','819-555-6677');
INSERT INTO client VALUES (6,'Ahmed','Yasmine','yasmine@gmail.com','438-555-4455');
INSERT INTO client VALUES (7,'Roy','Camille','camille@gmail.com','514-555-3322');
INSERT INTO client VALUES (8,'Martinez','Sofia','sofia@gmail.com','450-555-7766');
INSERT INTO client VALUES (9,'Johnson','Mia','mia@gmail.com','819-555-2211');
INSERT INTO client VALUES (10,'Lopez','Ariana','ariana@gmail.com','514-555-8899');
COMMIT;


-- AJOUT DES RESTAURENT --

INSERT INTO restaurent VALUES (1,'123 Rue Sainte-Catherine','Montréal','514-555-1234');
INSERT INTO restaurent VALUES (2,'456 Boulevard Cartier','Laval','450-555-5678');
INSERT INTO restaurent VALUES (3,'789 Avenue Royale','Québec','418-555-9012');
INSERT INTO restaurent VALUES (4,'159 Boulevard Taschereau','Longueuil','450-555-3322');
INSERT INTO restaurent VALUES (5, '753 Boulevard Gréber','Gatineau','819-555-1122');
INSERT INTO restaurent VALUES (6,'852 Rue Wellington','Sherbrooke', '819-555-7788');
INSERT INTO restaurent VALUES (7,'951 Avenue du Parc','Trois-Rivières', '819-555-9988' );
INSERT INTO restaurent VALUES (8, '357 Rue Saint-Denis', 'Montréal', '514-555-6677' );
INSERT INTO restaurent VALUES (9, '741 Boulevard des Laurentides', 'Laval', '450-555-4455' );
INSERT INTO restaurent VALUES (  10, '258 Rue Racine', 'Saguenay', '418-555-7766' );
COMMIT;

-- AJOUT DE RESERVATIONS --

INSERT INTO reservation VALUES (1,'2026-05-20','2026-01-01 18:30:00',2,1,1);
INSERT INTO reservation VALUES (2,'2026-05-21','2026-01-01 19:00:00',4,2,2);
INSERT INTO reservation VALUES (3,'2026-05-22','2026-01-01 20:15:00',3,3,3);
INSERT INTO reservation VALUES (4,'2026-05-23','2026-01-01 17:45:00',5,4,4);
INSERT INTO reservation VALUES (5,'2026-05-24','2026-01-01 21:00:00',2,5,5);
INSERT INTO reservation VALUES (6,'2026-05-25','2026-01-01 18:00:00',6,6,6);
INSERT INTO reservation VALUES (7,'2026-05-26','2026-01-01 19:30:00',4,7,7);
INSERT INTO reservation VALUES (8,'2026-05-27','2026-01-01 20:00:00',3,8,8);
INSERT INTO reservation VALUES (9,'2026-05-28','2026-01-01 18:15:00',7,9,9);
INSERT INTO reservation VALUES (10,'2026-05-29','2026-01-01 21:30:00',2,10,10);
COMMIT;

-- Partie Pamela ----



