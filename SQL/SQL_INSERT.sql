
/* INSERT position de parking place */

INSERT INTO Zone  (numéro ,prix_par_heure,prix_par_mois) VALUES ('01', 10, 150);
INSERT INTO Zone  (numéro ,prix_par_heure,prix_par_mois) VALUES ('02', 8, 200);


INSERT INTO Parking  (nom ,numéro_zone,nb_places_dispo,ville) VALUES (' Hôtel de Ville', 01, 60,'Paris');
INSERT INTO Parking  (nom ,numéro_zone,nb_places_dispo, ville) VALUES ('Odéon - Ecole de Médecine', 01, 20,'Paris');
INSERT INTO Parking  (nom ,numéro_zone,nb_places_dispo, ville) VALUES ('UTC_parking', 02, 15,'Paris');
INSERT INTO Parking  (nom ,numéro_zone,nb_places_dispo, ville) VALUES ('Napoleon', 02, 16,'Paris');

INSERT INTO Place  (ID, nom_parking, numéro_zone, type_emplacement  ) VALUES ('100', ' Hôtel de Ville', 01, ' epi');
INSERT INTO Place  (id, nom_parking, numéro_zone, type_emplacement  ) VALUES ('101', ' Hôtel de Ville', 01, ' epi');
INSERT INTO Place  (id, nom_parking, numéro_zone, type_emplacement  ) VALUES ('102', ' Hôtel de Ville', 01, ' CRÉNEAU');
INSERT INTO Place  (id, nom_parking, numéro_zone, type_emplacement  ) VALUES ('103', ' Hôtel de Ville', 01, ' BATAILLE');
INSERT INTO Place  (ID, nom_parking, numéro_zone, type_emplacement  ) VALUES ('124', 'Odéon - Ecole de Médecine', 01, ' epi');
INSERT INTO Place  (id, nom_parking, numéro_zone, type_emplacement  ) VALUES ('125', 'Odéon - Ecole de Médecine', 01, ' epi');
INSERT INTO Place  (id, nom_parking, numéro_zone, type_emplacement  ) VALUES ('126', 'Odéon - Ecole de Médecine', 01, ' CRÉNEAU');
INSERT INTO Place  (id, nom_parking, numéro_zone, type_emplacement  ) VALUES ('127', 'Odéon - Ecole de Médecine', 01, ' BATAILLE');
INSERT INTO Place  (ID, nom_parking, numéro_zone, type_emplacement  ) VALUES ('128', 'Odéon - Ecole de Médecine', 01, ' epi');
INSERT INTO Place  (ID, nom_parking, numéro_zone, type_emplacement  ) VALUES ('129', 'Odéon - Ecole de Médecine', 01, ' epi');

INSERT INTO Place  (id, nom_parking, numéro_zone, type_emplacement  ) VALUES ('161', 'UTC_parking', 02, ' CRÉNEAU');
INSERT INTO Place  (id, nom_parking, numéro_zone, type_emplacement  ) VALUES ('162', 'UTC_parking', 02, ' BATAILLE');
INSERT INTO Place  (ID, nom_parking, numéro_zone, type_emplacement  ) VALUES ('163', 'UTC_parking', 02, ' epi');


INSERT INTO Place  (ID, nom_parking, numéro_zone, type_emplacement  ) VALUES ('211', 'Napoleon', 02, ' epi');
INSERT INTO Place  (ID, nom_parking, numéro_zone, type_emplacement  ) VALUES ('212', 'Napoleon', 02, ' epi');
INSERT INTO Place  (ID, nom_parking, numéro_zone, type_emplacement  ) VALUES ('213', 'Napoleon', 02, ' epi');


/* vehicule et type autorise*/




INSERT INTO  Vehicule  (code_immatrice, date_fabr, marque,type ) VALUES ('AA-123-AB', '02-06-1999', 'Yamaha','deux_roux');
INSERT INTO  Vehicule  (code_immatrice, date_fabr, marque,type ) VALUES ('SS-8556-SY', '08-06-1899', 'Honda','deux_roux');
INSERT INTO  Vehicule  (code_immatrice, date_fabr, marque,type ) VALUES ('11-1111-11', '08-06-2020', 'Ferrari','simple_vehicule');
INSERT INTO  Vehicule  (code_immatrice, date_fabr, marque,type ) VALUES ('SS-SSSS-SS', '08-06-2021', 'Ducati','deux_roux');
INSERT INTO  Vehicule  (code_immatrice, date_fabr, marque,type ) VALUES ('AA-SHJS-YY', '04-01-1999', 'Nissan','Quad‎');
INSERT INTO  Vehicule  (code_immatrice, date_fabr, marque,type ) VALUES ('AS-GGGG-SS', '07-12-1256', 'BWV','autobus');
INSERT INTO  Vehicule  (code_immatrice, date_fabr, marque,type ) VALUES ('12-SSSS-17', '14-11-1966', 'Chery','autocar');
INSERT INTO  Vehicule  (code_immatrice, date_fabr, marque,type ) VALUES ('DD-SSSS-11', '17-02-1987', 'Bugati','Quad‎');
INSERT INTO  Vehicule  (code_immatrice, date_fabr, marque,type ) VALUES ('XX-SSSS-XX', '20-09-1874', 'BWV','poids_lourd');

INSERT INTO  Vehicule_Autorise  (code_immatrice,type_vehicule_autorisé, nom_parking, numéro_zone) VALUES ('AA-123-AB','deux_roux', ' Hôtel de Ville', 01 ); 
INSERT INTO  Vehicule_Autorise  (code_immatrice,type_vehicule_autorisé, nom_parking, numéro_zone) VALUES ('SS-8556-SY','deux_roux', ' Hôtel de Ville', 01 ); 
INSERT INTO  Vehicule_Autorise  (code_immatrice,type_vehicule_autorisé, nom_parking, numéro_zone) VALUES ('SS-SSSS-SS','deux_roux', ' Hôtel de Ville', 01 );
INSERT INTO  Vehicule_Autorise  (code_immatrice,type_vehicule_autorisé, nom_parking, numéro_zone) VALUES ('11-1111-11','simple_vehicule','Odéon - Ecole de Médecine', 01 ); 
INSERT INTO  Vehicule_Autorise  (code_immatrice,type_vehicule_autorisé, nom_parking, numéro_zone) VALUES ('AA-SHJS-YY','Quad‎', 'Odéon - Ecole de Médecine', 01 );
INSERT INTO  Vehicule_Autorise  (code_immatrice,type_vehicule_autorisé, nom_parking, numéro_zone) VALUES ('XX-SSSS-XX','poids_lourd', 'Odéon - Ecole de Médecine', 01 );
INSERT INTO  Vehicule_Autorise  (code_immatrice,type_vehicule_autorisé, nom_parking, numéro_zone) VALUES ('12-SSSS-17','autocar'    , 'Odéon - Ecole de Médecine', 01 );
INSERT INTO  Vehicule_Autorise  (code_immatrice,type_vehicule_autorisé, nom_parking, numéro_zone) VALUES ('DD-SSSS-11','Quad‎'       , 'Odéon - Ecole de Médecine', 01 );
INSERT INTO  Vehicule_Autorise  (code_immatrice,type_vehicule_autorisé, nom_parking, numéro_zone) VALUES ('AS-GGGG-SS','autobus'    , 'Odéon - Ecole de Médecine', 01 );

INSERT INTO  Vehicule_Autorise  (code_immatrice,type_vehicule_autorisé, nom_parking, numéro_zone) VALUES ('11-1111-11','simple_vehicule','UTC_parking', 02 );
INSERT INTO  Vehicule_Autorise  (code_immatrice,type_vehicule_autorisé, nom_parking, numéro_zone) VALUES ('AS-GGGG-SS','autobus'    ,'UTC_parking', 02);
INSERT INTO  Vehicule_Autorise  (code_immatrice,type_vehicule_autorisé, nom_parking, numéro_zone) VALUES ('DD-SSSS-11','Quad‎'       ,'Napoleon', 02 );
INSERT INTO  Vehicule_Autorise  (code_immatrice,type_vehicule_autorisé, nom_parking, numéro_zone) VALUES ('XX-SSSS-XX', 'poids_lourd'    ,'UTC_parking', 02 );




/* utilisateur*/

INSERT INTO  Utilisateur  (ID, nom , type) VALUES (1, 'messi', 'societe');
INSERT INTO  Utilisateur  (ID, nom, type ) VALUES (2, 'ronaldo', 'personne');
INSERT INTO  Utilisateur  (ID, nom, type ) VALUES (3, 'neymar', 'personne');
INSERT INTO  Utilisateur  (ID, nom, type ) VALUES (4, 'beckham', 'personne');
INSERT INTO  Utilisateur  (ID, nom , type) VALUES (5, 'hung', 'societe');
INSERT INTO  Utilisateur  (ID, nom, type ) VALUES (6, 'alex', 'personne');
INSERT INTO  Utilisateur  (ID, nom, type ) VALUES (7, 'elix', 'societe');
INSERT INTO  Utilisateur  (ID, nom, type ) VALUES (8, 'peter', 'personne');
INSERT INTO  Utilisateur  (ID, nom, type ) VALUES (9, 'mochan', 'societe');


INSERT INTO  Propriétaire_du_véhicule  (id_utilisateur, code_immatrice , type_vehicule) VALUES (1, 'AA-123-AB','deux_roux');
INSERT INTO  Propriétaire_du_véhicule  (id_utilisateur, code_immatrice ,type_vehicule) VALUES (2, 'SS-SSSS-SS','deux_roux');
INSERT INTO  Propriétaire_du_véhicule  (id_utilisateur, code_immatrice ,type_vehicule) VALUES (3, '11-1111-11','simple_vehicule');
INSERT INTO  Propriétaire_du_véhicule  (id_utilisateur, code_immatrice ,type_vehicule) VALUES (4, 'SS-8556-SY','deux_roux');
INSERT INTO  Propriétaire_du_véhicule  (id_utilisateur, code_immatrice ,type_vehicule) VALUES (5, 'AA-SHJS-YY','Quad‎');
INSERT INTO  Propriétaire_du_véhicule  (id_utilisateur, code_immatrice ,type_vehicule) VALUES (6, 'AS-GGGG-SS','autobus');
INSERT INTO  Propriétaire_du_véhicule  (id_utilisateur, code_immatrice ,type_vehicule) VALUES (7, '12-SSSS-17','autocar');
INSERT INTO  Propriétaire_du_véhicule  (id_utilisateur, code_immatrice ,type_vehicule) VALUES (8, 'DD-SSSS-11','Quad‎' );
INSERT INTO  Propriétaire_du_véhicule  (id_utilisateur, code_immatrice ,type_vehicule) VALUES (9, 'XX-SSSS-XX', 'poids_lourd');



/* transaction */
INSERT INTO  moyen_de_paiement  (numero, type ) VALUES (132, 'par_monnaie');
INSERT INTO  moyen_de_paiement  (numero, type ) VALUES (133, 'par_monnaie');
INSERT INTO  moyen_de_paiement  (numero, type ) VALUES (134, 'par_carte_bancaire');
INSERT INTO  moyen_de_paiement  (numero, type ) VALUES (135, 'par_carte_bancaire');
INSERT INTO  moyen_de_paiement  (numero, type ) VALUES (136, 'par_monnaie');
INSERT INTO  moyen_de_paiement  (numero, type ) VALUES (137, 'par_monnaie');
INSERT INTO  moyen_de_paiement  (numero, type ) VALUES (138, 'par_carte_bancaire');
INSERT INTO  moyen_de_paiement  (numero, type ) VALUES (139, 'par_carte_bancaire');
INSERT INTO  moyen_de_paiement  (numero, type ) VALUES (140, 'par_carte_bancaire');

INSERT INTO  moyen_de_paiement  (numero, type ) VALUES (141, 'par_carte_bancaire');
INSERT INTO  moyen_de_paiement  (numero, type ) VALUES (142, 'par_monnaie');
INSERT INTO  moyen_de_paiement  (numero, type ) VALUES (143, 'par_monnaie');
INSERT INTO  moyen_de_paiement  (numero, type ) VALUES (145, 'par_carte_bancaire');
INSERT INTO  moyen_de_paiement  (numero, type ) VALUES (146, 'par_carte_bancaire');
INSERT INTO  moyen_de_paiement  (numero, type ) VALUES (147, 'par_carte_bancaire');



/*OCassionel*/

INSERT INTO  Ocassionel  (ID) VALUES (2);
INSERT INTO  Transaction  (numero, id_place, nom_parking, numero_zone,numero_moyen_paiement, date_debut,heure_debut, date_fin, heure_fin ) VALUES (1750, 100, ' Hôtel de Ville', 01, 132, '2020-03-02','09:10:12','2020-03-02','12:10:58');
INSERT INTO  Ticket  (numero_transaction,id_utilisateur,prix_ticket) VALUES (1750, 2 , 20);



INSERT INTO  Ocassionel  (ID) VALUES (3);
INSERT INTO  Transaction  (numero, id_place, nom_parking, numero_zone,numero_moyen_paiement, date_debut,heure_debut,date_fin, heure_fin ) VALUES (1751, 100, ' Hôtel de Ville', 01, 133, '2020-04-06','09:10:00','2020-04-06','13:10:00');
INSERT INTO  Ticket  (numero_transaction,id_utilisateur,prix_ticket) VALUES (1751, 3 , 30);

INSERT INTO  Transaction  (numero, id_place, nom_parking, numero_zone,numero_moyen_paiement, date_debut,heure_debut,date_fin, heure_fin ) VALUES (1875, 162, 'UTC_parking', 02, 138, '2018-01-01','13:10:00','2018-01-01','16:10:00');
INSERT INTO  Ticket  (numero_transaction,id_utilisateur,prix_ticket) VALUES (1875, 3 , 24);




INSERT INTO  Ocassionel  (ID) VALUES (5);
INSERT INTO  Transaction  (numero, id_place, nom_parking, numero_zone,numero_moyen_paiement, date_debut,heure_debut,date_fin, heure_fin ) VALUES (1754, 126, 'Odéon - Ecole de Médecine', 01, 136, '2018-01-01','13:10:00','2018-01-01','16:10:00');
INSERT INTO  Ticket  (numero_transaction,id_utilisateur,prix_ticket) VALUES (1754, 5 , 30);


INSERT INTO  Ocassionel  (ID) VALUES (6);
INSERT INTO  Transaction  (numero, id_place, nom_parking, numero_zone,numero_moyen_paiement, date_debut,heure_debut,date_fin, heure_fin ) VALUES (1874, 161, 'UTC_parking', 02, 137, '2018-01-01','13:10:00','2018-01-01','16:10:00');
INSERT INTO  Ticket  (numero_transaction,id_utilisateur,prix_ticket) VALUES (1874, 6 , 30);

INSERT INTO  Transaction  (numero, id_place, nom_parking, numero_zone,numero_moyen_paiement, date_debut,heure_debut,date_fin, heure_fin ) VALUES (1900, 162, 'UTC_parking', 02, 139, '2020-04-06','09:10:00','2020-04-06','13:10:00');
INSERT INTO  Ticket  (numero_transaction,id_utilisateur,prix_ticket) VALUES (1900, 6 , 30);




/*Abonne*/ 

INSERT INTO  Abonné (ID,email) VALUES (1, 'messi.etu.utc.fr');
INSERT INTO  Transaction  (numero, id_place, nom_parking, numero_zone,numero_moyen_paiement, date_debut,heure_debut, date_fin, heure_fin ) VALUES (1799,'101', ' Hôtel de Ville', 01, 143, '2020-04-04','09:10:12','2020-04-30','20:00:00');
INSERT INTO  Abonnement  (numero_transaction,id_utilisateur,prix_carte_mensuel) VALUES (1799, 1 , 120 );
INSERT INTO  Compte  (numero,	id_abonné,premiere_date_conversaion, taux_reduction) VALUES (10001, 1 , '2020-04-04', '20%');
INSERT INTO  Mois_abonnement  (mois) VALUES (4);
INSERT INTO  Mois_abonnement_par_compte  (compte, mois_abonnement) VALUES (10001, 4);

INSERT INTO  Transaction  (numero, id_place, nom_parking, numero_zone,numero_moyen_paiement, date_debut,heure_debut, date_fin, heure_fin ) VALUES (1752, 101, ' Hôtel de Ville', 01, 134, '2020-05-01','09:10:12','2020-05-31','20:00:00');
INSERT INTO  Abonnement  (numero_transaction,id_utilisateur,prix_carte_mensuel) VALUES (1752, 1 , 120);
INSERT INTO  Mois_abonnement  (mois) VALUES (5);
INSERT INTO  Mois_abonnement_par_compte  (compte, mois_abonnement) VALUES (10001, 5);



INSERT INTO  Abonné (ID,email) VALUES (4, 'beckham.etu.utc.fr');
INSERT INTO  Transaction  (numero, id_place, nom_parking, numero_zone,numero_moyen_paiement, date_debut,heure_debut, date_fin, heure_fin ) VALUES (1753, 102, ' Hôtel de Ville', 01, 135, '2020-05-01','09:10:12','2020-05-31','20:00:00');
INSERT INTO  Abonnement  (numero_transaction,id_utilisateur,prix_carte_mensuel) VALUES (1753, 4 , 135);
INSERT INTO  Compte  (numero,	id_abonné,premiere_date_conversaion, taux_reduction) VALUES (10004, 4,'2020-05-01' , '10%');
INSERT INTO  Mois_abonnement_par_compte  (compte, mois_abonnement) VALUES (10004, 5);



INSERT INTO  Abonné (ID,email) VALUES (7, 'elix.etu.utc.fr');
INSERT INTO  Transaction  (numero, id_place, nom_parking, numero_zone,numero_moyen_paiement, date_debut,heure_debut, date_fin, heure_fin ) VALUES (1755, 126,  'Odéon - Ecole de Médecine', 01, 140, '2020-04-04','09:10:12','2020-04-30','20:00:00');
INSERT INTO  Abonnement  (numero_transaction,id_utilisateur,prix_carte_mensuel) VALUES (1755, 7 ,78 );
INSERT INTO  Compte  (numero,	id_abonné,premiere_date_conversaion, taux_reduction) VALUES (10007, 7 , '2020-04-04', '40%');
INSERT INTO  Mois_abonnement_par_compte  (compte, mois_abonnement) VALUES (10007, 4);

INSERT INTO  Transaction  (numero, id_place, nom_parking, numero_zone,numero_moyen_paiement, date_debut,heure_debut, date_fin, heure_fin ) VALUES (1756, 126,  'Odéon - Ecole de Médecine', 01, 141, '2020-06-04','09:10:12','2020-06-30','20:00:00');
INSERT INTO  Abonnement  (numero_transaction,id_utilisateur,prix_carte_mensuel) VALUES (1756, 7 ,78 );
INSERT INTO  Mois_abonnement  (mois) VALUES (6);
INSERT INTO  Mois_abonnement_par_compte  (compte, mois_abonnement) VALUES (10007, 6);





INSERT INTO  Abonné (ID,email) VALUES (9, 'mochan.etu.utc.fr');
INSERT INTO  Transaction  (numero, id_place, nom_parking, numero_zone,numero_moyen_paiement, date_debut,heure_debut, date_fin, heure_fin ) VALUES (1760, 163,  'UTC_parking', 02, 142, '2020-04-04','09:10:12','2020-04-30','20:00:00');
INSERT INTO  Abonnement  (numero_transaction,id_utilisateur,prix_carte_mensuel) VALUES (1760, 9 , 80 );
INSERT INTO  Compte  (numero,	id_abonné,premiere_date_conversaion, taux_reduction) VALUES (10009, 9 , '2020-04-04', '60%');
INSERT INTO  Mois_abonnement_par_compte  (compte, mois_abonnement) VALUES (10009, 4);



INSERT INTO  Abonné (ID,email) VALUES (8, 'peter.etu.utc.fr');
INSERT INTO  Transaction  (numero, id_place, nom_parking, numero_zone,numero_moyen_paiement, date_debut,heure_debut, date_fin, heure_fin ) VALUES (1761, 211,  'Napoleon', 02, 146, '2020-04-04','09:10:12','2020-04-30','20:00:00');
INSERT INTO  Abonnement  (numero_transaction,id_utilisateur,prix_carte_mensuel) VALUES (1761, 8 , 130 );
INSERT INTO  Compte  (numero,	id_abonné,premiere_date_conversaion, taux_reduction) VALUES (10008, 8 , '2020-04-04', '35%');
INSERT INTO  Mois_abonnement_par_compte  (compte, mois_abonnement) VALUES (10008, 4);

