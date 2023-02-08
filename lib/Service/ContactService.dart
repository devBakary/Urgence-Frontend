import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urgence_projet/Modele/Contact.dart';
import 'package:urgence_projet/Modele/Entite.dart';
import 'package:urgence_projet/Modele/User.dart';
import 'package:urgence_projet/Service/UserSecureStorage.dart';
import 'package:urgence_projet/Service/globals.dart';
import 'package:urgence_projet/global.dart';

import '../Modele/mes gestes.dart';



//Mon service de liaison avec mon backend
class ContactServices{

  // ===== methode pour l'ajout des contact de l'utilisateur =========================
  static Future<Contact> addContact(String nom, String prenom, String email, String numero, String adresse, int id) async{
    Map data = {
      "nom": nom,
      "prenom": prenom,
      "email": email,
      "numero": numero,
      "adresse": adresse,
    };

    var body = json.encode(data);
    var url = Uri.parse(baseURL + "/contact/creer/$id");

    http.Response response = await http.post(url,
        headers: headers,
        body: body
    );
    Map responseMap = json.decode(response.body);

    Contact contact = Contact.fromMap(responseMap);
    print('c moi');
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

      print(loginArr);

      usID = loginArr['id'];
      username = loginArr['username'];
      print(usID);

      final prefs=await SharedPreferences.getInstance();
      await prefs.setInt('id',loginArr['id']);
      final value=prefs.getInt('id');

    } else {
      print('login Error');
    }

    return response;

  }
  //========= fin de la partie de l'authentification================



  //====== methode pour ajouter des contact de l'utilisateur
  static Future<Users> inscriprtion(String username, String email, String numero, String adresse, String password) async{
   //on mappe les données
    Map data = {
      "username": username,
      "email": email,
      "numero": numero,
      "adresse": adresse,
      "password": password,
    };
    
    //puis une variable qui va contenir nos données
    var body = json.encode(data);
    
    //on va declarer notre chemin de requette
    var url = Uri.parse(baseURL + '/auth/inscription');

    //on va envoyer la requette
    http.Response response = await http.post(url,
        headers: headers,
        body: body
    );

    //on va decoder les donnee envoyer en parametre
    Map responseMap = json.decode(response.body);
    
    //on va creer une nouvelle instance de l'utilisateur
    Users user = Users.fromMap(responseMap);

    return user;
  }

//======== methode pour envoyer la localisation=========
  static Future<Localisation> location(double longitude, double latitude, int iduser, int id) async{
    Map data = {
      "longitude" : longitude,
      "latitude" : latitude
    };
     
    var body = jsonEncode(data);
    var url = Uri.parse(baseURL + '/signale/creer/$iduser/$id');

    http.Response response = await http.post(url,
                                      headers: headers,
                                      body: body);

    Map responseMap = json.decode(response.body);
    Localisation localisation = Localisation.fromMap(responseMap);
    return localisation;

    
  }
  
  
  //pour la methode get des contacts de l'utilisateur
  static Future<List<Contact>> getContact(int id) async{
    var url = Uri.parse(baseURL + '/contact/liste/$id');
    http.Response response = await http.get(url,
      headers: headers,
    );

    List responseList = jsonDecode(response.body);

    List<Contact> contacts = [];
    for (Map contactMap in responseList){
      Contact contact = Contact.fromMap(contactMap);
      contacts.add(contact);
    }

    return contacts;
  }


  //======= methode pour effacer les contacts de l'utilisateur =======
  static Future<http.Response> deleteContact(int id) async {
    var url = Uri.parse(baseURL + '/contact/delete/$id');
    print(id);

    http.Response response = await http.delete(url,
      headers: headers,
    );
    return response;
  }

  //================== recuperation de la liste des entite ===========
  static Future<List<Entite>> getEntite() async{
    var url = Uri.parse(baseURL + '/entite/liste');
    http.Response  response = await http.get(url,
      headers: headers,);

      List responseList = jsonDecode(response.body);

      List<Entite> entites = [];
      for (Map entiteMap in responseList){
        Entite entite = Entite.fromMap(entiteMap);
        entites.add(entite);

        idE = entiteMap['id'];

      }

      return entites;

  }

  //================== recuperation de la liste des gestes ===========
  static Future<List<Geste>> getGeste() async{
    var url = Uri.parse(baseURL + '/geste/afficher');
    http.Response  response = await http.get(url,
      headers: headers,);

    List responseList = jsonDecode(response.body);
    List<Geste> gestes = [];
    for (Map gesteMap in responseList){
      Geste geste = Geste.fromMap(gesteMap);
      gestes.add(geste);
      final prefs=await SharedPreferences.getInstance();
      await prefs.setInt('id',gesteMap['id']);
      final value=prefs.getInt('id');

    }
    return gestes;

  }


}