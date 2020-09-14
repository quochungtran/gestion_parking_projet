CREATE TABLE Zone(
    numéro INTEGER PRIMARY KEY,
    prix_par_heure FLOAT NOT NULL,
    prix_par_mois FLOAT NOT NULL
);


CREATE TABLE Parking(
    nom Varchar UNIQUE NOT NULL,
    numéro_zone INTEGER NOT NULL  ,
    nb_places_dispo INTEGER NOT NULL,
    ville VARCHAR NOT NULL,
    FOREIGN KEY(numéro_zone) REFERENCES Zone(numéro),
    PRIMARY KEY(nom, numéro_zone)
);


CREATE TABLE Place(
    ID INTEGER UNIQUE NOT NULL,
    nom_parking VARCHAR  NOT NULL,
    numéro_zone INTEGER  NOT NULL ,
    type_emplacement VARCHAR  NOT NULL,
    FOREIGN KEY(numéro_zone,nom_parking) REFERENCES Parking (numéro_zone,nom),
    PRIMARY KEY(ID, nom_parking, numéro_zone)
);

CREATE TYPE t_vehicule AS ENUM ('deux_roux','simple_vehicule','poids_lourd','autobus','autocar','Quad‎');

CREATE TABLE Vehicule (
    code_immatrice  VARCHAR UNIQUE,
    date_fabr DATE,
    marque VARCHAR,
    type t_vehicule,
    PRIMARY KEY( code_immatrice, type)
);


CREATE TABLE Vehicule_Autorise (
    code_immatrice VARCHAR, 
    type_vehicule_autorisé t_vehicule,
    nom_parking VARCHAR ,
    numéro_zone INTEGER ,
    FOREIGN KEY(code_immatrice, type_vehicule_autorisé) REFERENCES Vehicule (code_immatrice, type),
    FOREIGN KEY(nom_parking,numéro_zone ) REFERENCES Parking (nom,numéro_zone),
    PRIMARY KEY(code_immatrice, type_vehicule_autorisé, nom_parking, numéro_zone)
);




CREATE TYPE type_utilisateur AS ENUM ('societe','personne');


CREATE TABLE Utilisateur (
    ID  INTEGER  PRIMARY KEY ,
    nom VARCHAR NOT NULL  ,
    type type_utilisateur
);

CREATE TABLE Propriétaire_du_véhicule (
    id_utilisateur  INTEGER  ,
    code_immatrice VARCHAR   ,
    type_vehicule t_vehicule,
    FOREIGN KEY(id_utilisateur) REFERENCES Utilisateur (ID),
    FOREIGN KEY(code_immatrice,type_vehicule) REFERENCES Vehicule (code_immatrice, type),
    PRIMARY KEY(id_utilisateur, code_immatrice, type_vehicule)
);


CREATE TABLE Ocassionel (
    ID  INTEGER  PRIMARY KEY ,
    FOREIGN KEY(ID) REFERENCES Utilisateur (ID)
);



CREATE TABLE Abonné (
    ID  INTEGER  PRIMARY KEY ,
    email VARCHAR, 
    FOREIGN KEY(ID) REFERENCES Utilisateur (ID)
);



CREATE TABLE Compte (
    numero  INTEGER  PRIMARY KEY ,
    id_Abonné INTEGER Unique , 
    premiere_date_conversaion DATE ,
    taux_reduction VARCHAR ,
    FOREIGN KEY(id_Abonné) REFERENCES Abonné (ID)
);


CREATE TABLE Mois_abonnement (
    mois  INTEGER  PRIMARY KEY,
    CHECK  (mois <=12 AND mois >= 1)

);


CREATE TABLE Mois_abonnement_par_compte (
    Compte  INTEGER , 
    mois_abonnement INTEGER, 
    FOREIGN KEY(Compte) REFERENCES Compte (numero) ,
    FOREIGN KEY(mois_abonnement) REFERENCES Mois_abonnement (mois) ,
    PRIMARY KEY(Compte, mois_abonnement)
);

CREATE TYPE type_paiment AS ENUM ('par_monnaie','par_carte_bancaire');
CREATE TABLE Moyen_de_paiement (
    numero  INTEGER PRIMARY KEY , 
    type  type_paiment
);


CREATE TABLE Transaction (
    numero  INTEGER PRIMARY KEY, 
    id_place INTEGER,
    nom_parking VARCHAR,
    numero_zone  INTEGER ,
    numero_moyen_paiement INTEGER unique, 
    date_debut  date NOT NULL , 
    heure_debut  TIME NOT NULL , 
    date_fin  date NOT NULL , 
    heure_fin  time NOT NULL,
    FOREIGN KEY(id_place, nom_parking, numero_zone) REFERENCES Place (ID, nom_parking, numéro_zone) ,
    FOREIGN KEY(numero_moyen_paiement) REFERENCES Moyen_de_paiement (numero) ,
    CHECK (date_fin >= date_debut) 
);



CREATE TABLE Abonnement (
    numero_transaction  INTEGER   , 
    id_utilisateur INTEGER,
    prix_carte_mensuel  float not null, 
    FOREIGN KEY(numero_transaction) REFERENCES Transaction (numero) ,
    FOREIGN KEY( id_utilisateur) REFERENCES Abonné (id) ,
    PRIMARY KEY(numero_transaction, id_utilisateur)
);

CREATE TABLE Ticket (
    numero_transaction  INTEGER   , 
    id_utilisateur INTEGER,
    prix_ticket  float not null, 
    FOREIGN KEY(numero_transaction) REFERENCES Transaction (numero) ,
    FOREIGN KEY( id_utilisateur) REFERENCES Ocassionel (id) ,
    PRIMARY KEY(numero_transaction, id_utilisateur)
);


/*DROP TABLE Zone,Parking,Place,Vehicule,Vehicule_Autorise,Utilisateur,Propriétaire_du_véhicule,Ocassionel,Abonné,Compte,Mois_abonnement,Mois_abonnement_par_compte,Moyen_de_paiement,Transaction,Abonnement,
Ticket CASCADE;*/


/*Gestion de droits en fonction des utilisateurs */

/*CREATE USER Admin;
  CREAT USER Vendeur_aux guichets;
   

  GRANT ALL PRIVILEGES ON * TO Admin;
  GRANT INSERT, UPDATE ON Transaction, Compte, Abonnement, Ocassionel TO Vendeur_aux guichets;
   
  GRANT SELECT ON Place , Parking, Zone TO PUBLIC;

*/


