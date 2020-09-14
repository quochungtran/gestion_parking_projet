

/*DROP VIEW vReservation_de_Occasionel, vReservation_de_Abonnement ,vUnion,vPeriode_plus_demande,vprofit_annuel,vtype_autorise,vnombre_places_disponibe CASCADE ;*/



/* VUES par heritages reference*/ 

/*VUES sur la reservation de place par occasionel*/
CREATE VIEW vReservation_de_Occasionel AS
SELECT Ti.numero_transaction, Ti.id_utilisateur, U.nom  ,Ti.prix_ticket AS prix, Tr.id_place, Tr.nom_parking, Tr.numero_zone, Tr.date_debut,Tr.heure_debut,Tr.date_fin,Tr.heure_fin
FROM (Ticket Ti  LEFT JOIN Transaction Tr  
ON Ti.numero_transaction = Tr.numero )
LEFT JOIN  Utilisateur U
ON Ti.id_utilisateur = U.id
ORDER BY Ti.id_utilisateur;

/*VUES sur la reservation de place par abonne*/
CREATE VIEW vReservation_de_Abonnement AS
SELECT A.numero_transaction, A.id_utilisateur , U.nom  ,A.prix_carte_mensuel AS prix, Tr.id_place, Tr.nom_parking, Tr.numero_zone, Tr.date_debut,Tr.heure_debut,Tr.date_fin,Tr.heure_fin
FROM (Abonnement A  LEFT JOIN Transaction Tr  
ON A.numero_transaction = Tr.numero )
LEFT JOIN  Utilisateur U
ON A.id_utilisateur = U.id
ORDER BY A.id_utilisateur;


CREATE VIEW vUnion AS
SELECT* FROM VRESERVATION_DE_OCCASIONEL UNION SELECT* FROM VRESERVATION_DE_ABONNEMENT ;

/* Periodes plus demandé dans societe */


CREATE VIEW vPeriode_plus_demande AS
SELECT  Tr.date_debut,Tr.heure_debut, Tr.date_fin,Tr.heure_fin ,COUNT(*) As répétition
FROM  Transaction Tr  
GROUP BY  Tr.date_debut,Tr.heure_debut,Tr.date_fin, Tr.heure_fin
ORDER BY répétition DESC;


/*Profit mensuel sachant le coût d'investissement mensuel est de 12 eu*/


CREATE VIEW vprofit_mensuel AS
SELECT  EXTRACT (MONTH from vU.date_debut) AS month, EXTRACT (YEAR from vU.date_debut) AS année , ( SUM(prix)-12 ) AS profit 
FROM   vUnion vU 
GROUP BY  month,année
ORDER BY année,month ;


/*Profit annuel sachant le coût d'investissement annuel est de 120 eu  */

CREATE VIEW vprofit_annuel AS
SELECT  EXTRACT (YEAR from vU.date_debut) AS année , ( SUM(prix)-120 ) AS profit 
FROM   vUnion vU 
GROUP BY  année
ORDER BY année ;

/*quell type vehicule autorise pour chaque parking  */



CREATE VIEW vtype_autorise AS
SELECT v.nom_parking,   v.numéro_zone ,v.type_vehicule_autorisé 
FROM   Vehicule_Autorise v 
GROUP BY  v.type_vehicule_autorisé,v.nom_parking, v.numéro_zone 
ORDER BY v.numéro_zone ,v.nom_parking
;

/*le nombre de places disponibles dans l'ensemble des parking */

CREATE VIEW vnombre_places_disponibe AS
SELECT P.nom,   P.nb_places_dispo 
FROM   Parking P 
ORDER BY P.nom
;





