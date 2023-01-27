

import 'package:flutter/cupertino.dart';
import 'package:urgence_projet/Modele/Contact.dart';
import 'package:urgence_projet/Modele/Entite.dart';
import 'package:urgence_projet/Service/ContactService.dart';

import 'User.dart';

//le management avec le provider
class ContactData extends ChangeNotifier{

  //liste de contact
  List<Contact> contacts = [];

  List<Users> users = [];


  //la methode pour ajouter un contact
  void addContact(String contactNom, String contactPrenom, String contactEmail, String contactNumero, String contactAdresse) async{

    Contact contact = await ContactServices.addContact(contactNom, contactPrenom, contactEmail, contactNumero, contactAdresse);

    contacts.add(contact);
    notifyListeners();
  }

  //la methode pour s'inscrire
  void inscriptionUser(String userUsername, String userEmail, String userNumero, String userAdresse, String userPassword) async {

    Users user = await ContactServices.inscriprtion(userUsername, userEmail, userNumero, userAdresse, userPassword);

    users.add(user);
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



  late String _iduser;

  String get iduser => _iduser;

    set iduser(String value) {
      _iduser = value;
      notifyListeners();
    }
}