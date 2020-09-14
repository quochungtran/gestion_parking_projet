# MLD  :

#### **Zone** (#numero : int ,  prix_par_heure: string,  prix_par_mois: date) 
Contrainte: 

     avec prix_par_heure NOT NULL

     prix_par_mois NOT NULL 
   
--3NF-- : Tous les attributs sont atomiques et les attributs non clés dépendent bien la clé et non d’une partie des clés


#### data_type t_vehicule {'deux_roux', 'simple_vehicule', 'poids_lourd', 'autobus', 'autocar', 'Quad‎'}

#### **Parking** (#nom:string , #numero_zone => Zone(numero) , nb_places_disp:int, ville : string , type_vehicule_autorise : json )
avec (nom,numero_zone) form une clé

Contrainte: 

     avec numero_zone NOT NULL 

     type_vehicule_autorise  appartient a t_vehicule

     PROJECTION(Parking, numero_zone) = PROJECTION(Zone, numero)

     nom unique

--3NF-- : numero_zone est une clé étrangère et elle n'est déterminé par la clé locale et form une avec clé locale qu'une clé primaire . Les attributs non clés dépendent bien la clé et non d’une partie des clés. 




#### **Place**( #id:int, #nom_parking:string => Parking( nom ) , #numero_zone:int =>Parking(numero_zone), type_emplacement:sring)

avec(id, nom_parking) form une clé 

Contrainte: 

     id unique

     nom_parking NOT NULL
      
     numero_zone NOT NULL    

     PROJECTION(Place, nom_parking, numero_zone) = PROJECTION(Parking, nom, numero_zone ) 

--3NF-- :  Les attributs non clés dépendent bien la clé et non d’une partie des clés. 






#### **Vehicule**( #code_imatrice: string , date_fabr:date , marque:string , #type: t_vehicule )

avec(code_imatrice, type) form une clé 

Contrainte: 

     Avec code_imatrice unique

     type NOT NULL

--3NF-- : Tous les attributs sont atomiques et les attributs non clés dépendent bien des clés et non d’une partie des clés


#### **Autorise**( #code_imatrice: string => Vehicule , #nom_parking:string=> Parking(nom) , #numero_zone => Parking(numero) )

avec(code_imatrice, nom_parking, numero_zone ) form une clé 

Contrainte: 

     PROJECTION(Autorise, code_imatrice ) = PROJECTION(Vehicule, code_imatrice ) 

     PROJECTION(Autorise, nom_parking, numero_zone) = PROJECTION(Parking, nom, numero_zone ) 

--3NF-- :  le table est trivialement 3NF



#### **Utilisateur**(#id : int , nom:string , type:{personne,societe})

Contrainte: 

     nom NOT NULL

     id Unique



-- EXPLICATION--: On choisit un héritage par référence afin d’exprimer plus facilement les abonnés et le système de fidélité pour des contraintes simples. 

--3NF-- : Tous les attributs sont atomiques et les attributs non clés dépendent bien des clés et non d’une partie des clés



#### **Ocassionel**(#id: int => Utilisatieur(id))

--3NF-- :  le table est trivialement 3NF


#### **Abonné**(#id : int => Utilisateur(id), email: string)

--3NF-- : Tous les attributs sont atomiques et les attributs non clés dépendent bien des clés et non d’une partie des clés

Contrainte (pour héritage par référence):
   
     INTERSECTION (PROJECTION(Ocassionel,id), PROJECTION(Abonné,id)) = NULL


####  **Propriétaire_du_véhicule** (#id_utilisateur: int => Utilisatieur(id), #code_imatrice: int => Vehicule(code_imatrice), type_vehicule: t_vehicule => vehicule )

(id_utilisateur,code_imatrice, type_vehicule ) forme une cle

Contrainte: 


     PROJECTION(Propriétaire_du_véhicule, id_utilisateur) = PROJECTION(Utilisatieur, id) 
   
     PROJECTION(Propriétaire_du_véhicule, code_imatrice) = PROJECTION(Vehicule, code_imatrice )

--3NF-- : le table d'association est trivialement 3NF


#### **Compte** ( #numero:int, id_Abonné :int => Abonné,  premiere_date_conversaion : date, taux_reduction:string , mois_abonnement : type json)

Contrainte :1
     
     id_Abonné unique

     1 < mois_abonnement < 12 int

--3NF-- :  id_Abonné est une clé étrangère donc on peut la considérer comme un attribut normal car elle ne joue pas le rôle de clé dans Compte. Tous les attributs sont atomiques et les attributs non clés dépendent bien des clés et non d’une partie des clés



#### **Moyen_de_paiement**( #numero:int, type:{par_monnaie, par_carte_bancaire} )

--3NF-- : Tous les attributs sont atomiques et les attributs non clés dépendent bien des clés et non d’une partie des clés




#### **Transaction**( #numero:int , id_place: int => Place , nom_parking:string => Place , numero_zone:int =>Place, numero_moyen_paiement:int => Moyen_de_paiement , date_debut : date , heure_debut : time , date_fin : date , heure_fin : time ) 

Contraintes : 

      moyen_paiement unique
  
      id_place, nom_parking, numero_zone NOT NULL

      PROJECTION(Transaction, id_place, nom_parking, numero_zone ) = PROJECTION(Place, id, nom_parking, numero_zone  )

      date_fin > date_debut 



-- EXPLICATION--: On choisit un héritage par référence afin de gérer plus facilement les reservation de chaque type d'utilisateurs et pour des contraintes simples. 

--3NF-- :id_place: int => Place, nom_parking:string => Place ,numero_zone:int =>Place, Id_utilisateur:int => Utilisateur, moyen_paiement:int , on peut les considérer comme des attributs normals . Les attributs non clés dépendent bien la clé et non d’une partie des clés. 


#### **Abonnement**( #numero: int => Transaction (numero), #id_utilisateur: int => Abonné (id), prix_carte_mensuel : float )

(numero, id_utilisateur ) forme une clé

Contraintes : 

      prix_carte_mensuel not null

      id_utilisateur not null
    
      PROJECTION(Abonnement, id_utilisateur ) = PROJECTION(Abonné, id )
      

--3NF-- : Tous les attributs sont atomiques et les attributs non clés dépendent bien des clés et non d’une partie des clés


#### **Ticket**(  #numero: int => Transaction (numero), #id_utilisateur: int => Ocassionel (id), prix_ticket: float)

(numero, id_utilisateur ) forme une clé

Contraintes :

      prix_ticket not null
 
      id_utilisateur not null
    
      PROJECTION(Ticket, id_utilisateur ) = PROJECTION(Ocassionel, id )
      

--3NF-- : Tous les attributs sont atomiques et les attributs non clés dépendent bien des clés et non d’une partie des clés


Contrainte (pour héritage par référence):

      INTERSECTION (PROJECTION(Abonnement,numero, id_utilisateur ), PROJECTION(Ticket,numero, id_utilisateur )) = NULL


### VUES 

* Heritage par référence

vReservation_de_Occasionel = jointure(Transaction,Ticket,numero_transaction=numero) 

vReservation_de_Abonnement =  jointure(Transaction,Abonnement,numero_transaction=numero) 

* vPeriode_plus_demande : Periodes plus demandé dans societe

* vprofit_mensuel : Profit mensuel 

* vprofit_annuel : Profit annuel

* vtype_autorise : quell type vehicule autorise pour chaque parking

* vnombre_places_disponibe : le nombre de places disponibles dans l'ensemble des parking

* Vues sur application de json

vconvertir_valeur_JSON_sur_typevehicule : sur class Parking ( typevehicule ) 

vconvertir_valeur_JSON_sur_mois_abonnement : sur Compte ( mois_abonnement )

vnombre_type_vehicule_autorise : le nombre type vehicule autorise pour chaque parking
