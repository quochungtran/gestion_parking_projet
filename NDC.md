# nf17 PARTIE2 Projet : Gestion de parking

## 1. Contexte
Une société a me fait appel  pour que l’on mette en place une base de données à gérer un ensemble de différents parkings dans une ville. Chaque parking est composé de plusieurs places en plein air et couvertes. Les prix des parkings varient selon la zone dans laquelle ils se situent dans la ville. 

Chaque utilisateur de ces parkings est soit un occasionnel, soit un abonné chez cette société. Les occasionnels paient des tickets à l'heure. Les abonnés disposent des cartes mensuelles renouvelables chaque mois.

Pour attirer plus de clients, la société veut mettre en œuvre un système de fidélité pour ses clients. Pour chaque nouvel abonné, un compte lui est créé afin de sauvegarder ses différents abonnements.


## 2. Objectifs
Nous allons concevoir une base de données afin de chercher à faciliter la gestion de ces parkings pour cette société en créant la base.  Je ferai aussi les commandes SQL afin de faire les principales interrogations que pourraient répondre aux besoins demandés. Par exemple:
* Faciliter à gérer l'ensemble des clientse
* Faciliter à gérer la réservation de places pour les abonnés et occasionnels
* Modifier les tarifs des zones et permettre à un parking de changer de zone
* Gérer le système de fidélité de la société
* Afficher le nombre de places disponibles dans l'ensemble des parking
* Permettre de réaliser des études statistiques 


## 3. Liste des objets et leur propriété


### Zone
La société souhaite l’implémentations de ses zones. Chaque zone est caractérisée par un numéro et un prix (à l'heure et mensuel) et les prix des parkings varient selon la zone dans laquelle ils se situent dans la ville. On aura donc:

* numéro: int{key}
* prix_par_heure : float
* prix_par_mois : float


### Parking 
Un ensemble de différents parkings dans une ville. Chaque parking est caractérisé par un nom et un nombre de places disponibles. Chaque parking appartient à une zone spécifique. On aura des attributs suivants :

* nom: string {unique}
* numero_zone: int {référence à Zone}
* nb_places_dispo : int 
* ville :  string  
* type_vehicule_autoirise:{'deux_roux', 'simple_vehicule', 'poids_lourd', 'autobus', 'autocar', 'Quad‎'} not Null (type json)



### Place 
Chaque place dans un parking à un numéro l' identifiant de façon unique et le type de l'emplacement dans lequel elle se situe.

* numero_id : int {unique}
* nom_parking : string {référence à Parking}
* numero_zone : int {référence à Parking} 
* type_emplacement : string 



### Vehicule 

Chaque véhicule que client utilise est caractérisée par un code de immatriculation, une date de fabrication, une marque et un type.

* code_imatrice: string {key}
* date_fabr:date
* marque:string
* type: string  {'deux_roux', 'simple_vehicule', 'poids_lourd', 'autobus', 'autocar', 'Quad‎'} {not null}


### Utilisateur
Un utilisateur est caractérisé par un nom et un type (personne ou société).   On aura donc:

* id : int{key}
* nom:string
* type:{personne,societe}

Chaque utilisateur de ces parkings est soit un occasionnel, soit un abonné chez cette société. ce qui me permet de faire deux classes en héritage :

#### Occassionnel


#### Abonne 

* email:string

Pour l'abonne peut recevoir des informations concernant l'offre de société

Contrainte: ce sont 

### Compte 

Un compte est associé à chaque abonné lors de sa première réservation. Le compte est caractérisé par son numéro unique le taux de réduction actuel pour l'abonné.

* numero:int{key}
* id_abonne : int  {reference à Abonne }{unique}
* premiere_date_conversaion : datetime
* taux_reduction:string
* mois_abonnement[1..12] : int  (type json) not null


### Moyen_de_paiement

Chaque transaction est associé à un moyen de paiement. Cette class nous permet à savoir le moyen de paiement pour chaque transaction. Les clients peuvent payer leurs tickets/abonnements sur un automate ou un guichet. Les guichets prennent la monnaie et les automate les cartes bancaires. Un moyen de paiement est ainsi caractérisé par un numéro et un type.


* numero:int {key}
* type:{par_monnaie, par_carte_bancaire}


###  Transaction 

Une transaction est associée à chaque achat. Elle est caractérisée par un numéro, une date et heure d'achat, une heure et date de finet une place. Dans le cas d'un abonnement, la place est réservée pour l'abonné et ne peut être réservée pour un autre client qu'à la fin de cet abonnement.

* numero : int{key}
* id_place : int {reference à Place}
* numero_moyen_paiement : int {reference Moyem_de_paiement}
* date_debut : date
* heure_debut : time
* temp_fin : date
* heure_fin : time



Une transaction a deux types (ticket ou abonnement) et un prix different pour chaque type. Pour faciliter à gérer système de fidélité et afficher les prix en fonction des places réservés pour les abonnés et les Ocassionels, ce qui me permet de faire deux classes en héritage :
 
#### Ticket 
Les occasionnels paient des tickets à l'heure, donc il existe le prix pour chaque ticket en fonction des heures:

* prix_ticket : float 

#### Abonnemnt 

Les abonnés disposent des cartes mensuelles renouvelables chaque mois.

* prix_carte_mensuelle: float 




## 4. Liste des associations

***composition 1:N***

* Zone 1 <--N Parking  :   Chaque *parking* appartient à une *zone* spécifique

* Place 1 <--N Parking : Chaque *place* dans un *parking* unique

***association 1:N***

* type_vehicule 1..N vehicule  : un *type_vehicule*  peut etre présenté par plusieur *vehicule* 

* Place 1..N Transaction       : un *place* peut etre réservé par plusieurs *transcation* dans parking

* Ocassionel  1..N Ticket : un *Ocassionel* peut payer plusieurs *Ticket*

* Abonne  1..N Abonnemnt : un *Abonné* peut réaliser plusieurs *Abonnement* 



***association 1:1***

* Transaction 1..1   Moyen_de_paiement   :   un *transaction* est associé à un *moyen de paiement*

* Compte 1..1 Abonné    : un *compte* est associé à un  *abonné* lor de sa premiere abonnement

***association M:N***

* Type_vehicule 1.3 .. 1.N  Parking     : plusieurs *type_vehicule* peuvent etre autorisé par plusieurs *parking*

* Utilisateur 1.N .. 1.N  Vehicule      : plusieurs *Utilisateur* peuvent posséder même *vehicule*

* compte  1.N .. 1.N  Mois_abonnement      : Un *compte* peut afficher plusieurs *mois d'abonnement* et il y a plusieurs des abonnements dans un mois.  



## 5. Contraintes entre les objets entre héritages, associations et les attributs  :

* Contraintes pour les héritages 

Ticket et abonnement sont deux héritages exclusifs 

Occassionnel et Abonne sont deux héritages exclusifs

* Contraintes pour les associations 

" Transaction Place 1..N Transaction : réserver" et " Transaction "1"--"1" Moyen_de_paiement : par " : Simultanéité

" Abonne "1"-"1.N"  Abonnement : réaliser " et " Compte "1"--"1"  Abonne   : avoir " : Simultanéité

* Contraintes sur les attributs : 
* Un utilisatuer est soit Ocassionel soit societe
* date de réalisation de la transaction sont différents pour même place
* Dans le cas d'un abonnement, la place est réservée pour l'abonné et ne peut être réservée pour un autre client qu'à la fin de cet abonnement.
* La date de fin de transaction de transaction doit être supérieure à la date de debut de transaction.
* le prix ticket  doit être calculé en fonction de nombre heures et le prix par heure selon le zone 
* le prix_carte_mensuelle doit être calculé en fonction de taux reduction et le prix par mois selon le zone 
* Tous les attributs sont not null 
* Chaque parking appartient à une zone spécifique et Chaque place dans un parking à un numéro l' identifiant .
* mois_abonement value entre 1 et 12. 


## 6. Vues de prévus sur le projet

* vprof_memnsue : retourne le profit mensuel de société
* vprof_annuel : retourne le profit annuel de société 
* vpériodes_demande : retourne  les périodes de réservations en décroisance de nombre de répétition  dans société
* vabonne_zone : retourrne le nombre des abonnés de chaque zone 
* vPlace_abonne :  retourrne la réservation de places pour les abonnés
* vPlace_occassionnel :  retourrne la réservation de places pour les Occassionnels
* vnombre_type_vehicule_autorise : le nombre type vehicule autorise pour chaque parking


## 7. Utilisateurs

* Administrateur
* Abonne 
* Occassionnel 
* Vendeur aux guichets

## 8. Fonctions à implémenter 

* Payer des tickets à l'heure
* Authentification de carte bancaire sur un automate
* Payer l'abonnement chaque mois
* Authentification de compte de fidelite ( pour les abonnés )
* Vérifier la place est disponible
* Prendre la monnaie pour client qui paie par monnaie (pour les vendeur aux guichets )

## 9. Gestion de droits 

* Droits de Administrateur
  * Ajouter le compte à un abonné
  * Désactiver un compte
  * Gérer l'ensemble de client et l'ensemble de place de parking
  * Gérer de système de fidélité
  * Punir des clients qui utilise des places des abonné dans leur abonnements.   
* Droits des uilisateurs
  * Rechercher la place disponible 
  * Consulter leur compte de fidélité




