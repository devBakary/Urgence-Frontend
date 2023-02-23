

import 'package:flutter/cupertino.dart';
import 'package:urgence_projet/Modele/Contact.dart';
import 'package:urgence_projet/Modele/Entite.dart';
import 'package:urgence_projet/Service/ContactService.dart';
import 'package:urgence_projet/Service/FicheService.dart';

import 'Fiche.dart';
import 'User.dart';
import 'mes gestes.dart';

//le management avec le provider
class ContactData extends ChangeNotifier{

  //liste de contact
  List<Contact> contacts = [];

  List<Users> users = [];

  List<Geste> gestes = [];

  //detail geste
  List<Geste> dgestes = [];

  List<Fiche> fiches = [];


  //la methode pour ajouter un contact


  //la methode pour s'inscrire
   /*inscriptionUser(String userUsername, String userNumero, String userAdresse, String userPassword) async {

    Users user = await ContactServices.inscriprtion(userUsername, userNumero, userAdresse, userPassword);

    users.add(user);
    notifyListeners();
  }*/

  //la methode pour s'inscrire
 /* void addFiche(String ficheNom, String fichePrenom, String ficheAllergie, String ficheGroupe, String ficheAdresse, int idl) async {

    Fiche fiche = await FichesServices.addFiche(ficheNom, fichePrenom, ficheAllergie, ficheGroupe, ficheAdresse, idl);

    fiches.add(fiche);
    notifyListeners();
  }*/


  //la methode pour supprimer un client
  void deleteClient(Contact contact){
    contacts.remove(contact);
    ContactServices.deleteContact(contact.id);
    notifyListeners();
  }

  // ==================fin de la partie du contact ==============


  //==== liste des entités

  List<Entite> entite = [];


  List<Localisation> localisations = [];

  void adresse(double locLongitude, double locLatitude, String locAdresse, int user, int id) async{

    Localisation localisation = await ContactServices.location(locLongitude, locLatitude, locAdresse, user, id);
    localisations.add(localisation);
    notifyListeners();
  }
}