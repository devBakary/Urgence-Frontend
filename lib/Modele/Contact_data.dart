

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
  void addContact(String contactNom, String contactPrenom, String contactEmail, String contactNumero, String contactAdresse, usId) async{

    Contact contact = await ContactServices.addContact(contactNom, contactPrenom, contactEmail, contactNumero, contactAdresse, usId);

    contacts.add(contact);
    notifyListeners();
  }

  //la methode pour s'inscrire
  void inscriptionUser(String userUsername, String userEmail, String userNumero, String userAdresse, String userPassword) async {

    Users user = await ContactServices.inscriprtion(userUsername, userEmail, userNumero, userAdresse, userPassword);

    users.add(user);
    notifyListeners();
  }

  //la methode pour s'inscrire
  void addFiche(String ficheNom, String fichePrenom, String ficheAllergie, String ficheGroupe, int usId) async {

    Fiche fiche = await FichesServices.addFiche(ficheNom, fichePrenom, ficheAllergie, ficheGroupe, usId);

    fiches.add(fiche);
    notifyListeners();
  }


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

  void adresse(double locLongitude, double locLatitude, int user, int id) async{

    Localisation localisation = await ContactServices.location(locLongitude, locLatitude, user, id);
    localisations.add(localisation);
    notifyListeners();
  }
}