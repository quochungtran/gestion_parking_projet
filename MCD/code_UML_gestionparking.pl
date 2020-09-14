@startuml


class type_vehicule << DATA type >>{
{deux_roux, simple_vehicule, poids_lourd,
autobus, autocar, Quad}
}

package "Position de Parking" {
class Zone {
#numero : int {key}
prix_par_heure: float
prix_par_mois: float
}

class Parking {
#nom:string{unique}
nb_place:int
ville : string
TypeVehicule_autorise :type_vehicule
}

class Place {
#id:int {unique}
#nom_parking:string
#numero_zone:int
type_emplacement:sring
}


}




class Utilisateur {
#id : int
nom:string
type:{personne,societe}
}

class Ocassionel{}

class Vehicule{
#code_imatrice: string {key}
date_fabr:date
marque:string
type: type_vehicule
}
class Transaction{
#numero:int{key}
id_place: int {reference Place}
date_debut:date
heure_debut: time
date_fin:date
heure_fin : time

}

class Moyen_de_paiement{
#numero:int {key}
type:{par_monnaie, par_carte_bancaire}
}


package "systeme de fidelite" {

class Compte{
#numero:int{key}
premiere_date_conversaion : datetime
taux_reduction:string
Mois_abonnement[1..12] : int
}

class Abonne{
email: string
}



}

class Abonnement {

prix_carte_mensuel : float 

}

class Ticket{
prix_ticket : float

}

    
	Transaction <|--- Ticket
	Transaction <|--- Abonnement

	Utilisateur <|-  Ocassionel
	Utilisateur <|--- Abonne
    
    Parking "1.N"---"1.N" Vehicule: autorise
    Utilisateur "1.N"--"1.N"  Vehicule  : posseder
    
	Compte "1"--"1"  Abonne   : avoir
	Transaction "1"--"1" Moyen_de_paiement   : par
	
	Ocassionel "1"----"1.N"  Ticket : payer
	Abonne "1"-"1.N"  Abonnement : réaliser

	Place "0.1"--"1.N"   Transaction : réserver
	Zone *--"1..N" Parking : Appartient à
	Parking *--"1..N" Place : dans




@enduml
