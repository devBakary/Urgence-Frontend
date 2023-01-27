import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urgence_projet/Modele/Contact.dart';
import 'package:urgence_projet/Modele/Entite.dart';
import 'package:urgence_projet/Service/UserSecureStorage.dart';
import 'package:urgence_projet/Service/globals.dart';

import '../Modele/Contact_data.dart';

//Mon service de liaison avec mon backend
class ContactServices{

  static final _storage = new FlutterSecureStorage();

  var iduser ;

  // pour la'ajout des clients
  static Future<Contact> addContact(String nom, String prenom, String email, String numero, String adresse) async{
    Map data = {
      "nom": nom,
      "prenom": prenom,
      "email": email,
      "numero": numero,
      "adresse": adresse,
    };

    var body = json.encode(data);
    var url = Uri.parse(baseURL + "/contact/creer");

    http.Response response = await http.post(url,
        headers: headers,
        body: body
    );
    print(response.body);
    Map responseMap = jsonDecode(response.body);

    Contact contact = Contact.fromMap(responseMap);

    return contact;
  }


  //==================== Pour l'authentification = ================
  Future<http.Response> login(String username, String password) async {
    Map data = {'username': username, 'password': password};
    var body = jsonEncode(data);
    var url = Uri.parse(baseURL + "/auth/connexion");
    http.Response response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      var loginArr = json.decode(response.body);
      await UserSecureStorage.setId(loginArr['id']);


      final prefs=await SharedPreferences.getInstance();
      await prefs.setInt('id',loginArr['id']);
      final value=prefs.getInt('id');

      print("autre================");
        print(value);
       //await storage.write(key: "token", value: loginArr['accessToken']);
       //iduser = storage.write(key: iduser, value: loginArr['id']);
      print(loginArr['id']);
      print(loginArr);

    } else {
      print('login Error');
    }

    return response;

  }


  //pour la methode get
  static Future<List<Contact>> getContact(int id) async{
    var url = Uri.parse(baseURL + '/contact/liste/$id');
    http.Response response = await http.get(url,
      headers: headers,
    );

    print(response.body);
    List responseList = jsonDecode(response.body);
    List<Contact> contacts = [];
    for (Map contactMap in responseList){
      Contact contact = Contact.fromMap(contactMap);
      contacts.add(contact);
    }

    return contacts;
  }

  //pour le delete
  static Future<http.Response> deleteContact(int id) async {
    var url = Uri.parse(baseURL + '/contact/delete/$id');
    print(id);

    http.Response response = await http.delete(url,
      headers: headers,
    );
    print(response.body);
    return response;
  }

  //================== recuperation de la liste des entite===========
  static Future<List<Entite>> getEntite() async{
    var url = Uri.parse(baseURL + '/entite/liste');
    http.Response  response = await http.get(url,
      headers: headers,);

      print(response.body);
      List responseList = jsonDecode(response.body);
      List<Entite> entites = [];
      for (Map entiteMap in responseList){
        Entite entite = Entite.fromMap(entiteMap);
        entites.add(entite);
      }
      return entites;
  }

/*
  bool isLogged() {
    if (this.iduser != null) {
      return true;
    } else {
      return false;
    }
  }
*/

}