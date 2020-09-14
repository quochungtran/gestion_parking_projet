

/*DROP VIEW vReservation_de_Occasionel, vReservation_de_Abonnement ,vUnion,vPeriode_plus_demande,vprofit_annuel,vtype_autorise,vnombre_places_disponib,vconvertir_valeur_JSON_sur_mois_abonnement,
vconvertir_valeur_JSON_sur_mois_abonnement CASCADE ;*/



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



/*le nombre de places disponibles dans l'ensemble des parking */

CREATE VIEW vnombre_places_disponibe AS
SELECT P.nom,   P.nb_places_dispo 
FROM   Parking P 
ORDER BY P.nom
;
/* Savoir quel vehicule est autorise pour chaque parking */


CREATE VIEW vconvertir_valeur_JSON_sur_typevehicule AS
SELECT P.nom AS nom_parking, P.numéro_zone, t.* 
FROM  Parking P, JSON_ARRAY_ELEMENTS(P.type_vehicule_autorise) t
ORDER BY P.nom
;


CREATE VIEW vconvertir_valeur_JSON_sur_mois_abonnement AS
SELECT C.numero ,C.id_Abonné, mo.*  
FROM  Compte C, JSON_ARRAY_ELEMENTS(C.mois_abonnement) mo
ORDER BY C.numero
;


/* Rajouter une vue statistique sur JSON pour 
 Calculer le nombre type vehicule autorise pour chaque parking */


CREATE VIEW vnombre_type_vehicule_autorise AS
SELECT nom_parking, numéro_zone, COUNT(*) AS nombre_type_vehicule
FROM vconvertir_valeur_JSON_sur_typevehicule v
GROUP BY numéro_zone,nom_parking
ORDER BY numéro_zone, nom_parking
;






