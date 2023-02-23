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
  static Future<bool> addContact(String nom, String prenom, String email, String numero, String domicile, String lien, int id) async{
    Map data = {
      "nom": nom,
      "prenom": prenom,
      "email": email,
      "numero": numero,
      "domicile": domicile,
      "lien": lien
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
    return true;
  }


  //===methode pour modifier le contact===========
  static Future<bool> upContact(String nom, String prenom, String numero, String email,  String domicile, String lien, int id) async{
    Map data = {
      "nom": nom,
      "prenom": prenom,
      "numero": numero,
      "email": email,
      "domicile": domicile,
      "lien": lien
    };

    var body = jsonEncode(data);
    print(body);
    var url = Uri.parse(baseURL + "/contact/modifier/$id");

    http.Response response = await http.put(url,
        headers: headers,
        body: body
    );
    if(response.statusCode == 200){
      print(response.statusCode);
      print(response.body);
      Map responseMap = jsonDecode(response.body);

      Contact contact = Contact.fromMap(responseMap);
      return true;
    }
    else{
      print(response.statusCode);
      throw('une erreur s\'est produit');
    }


  }




  //==================== Pour l'authentification = ================
  Future<bool> login(String username, String password) async {
    Map data = {'username': username, 'password': password};
      var body = jsonEncode(data);
      var url = Uri.parse(baseURL + "/auth/connexion");
       http.Response response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
         var loginArr = json.decode(response.body);
          usID = loginArr['id'];
          usernames = loginArr['username'];
          util = loginArr['username'];
          final prefs=await SharedPreferences.getInstance();
          await prefs.setInt('id',loginArr['id']);
          await prefs.setString('us', loginArr['username']);

          return true; // Connexion réussie
      }
      else {
        logged = false;
        print('login Error');
        throw ('Nom d\'utilisateur ou mot de passe incorrect'); // Connexion échouée
      }
  }



  //====== methode pour ajouter des contact de l'utilisateur
   Future<bool> inscriprtion(String username, String numero, String email, String adresse, String password) async{
   //on mappe les données
    Map data = {
      "username": username,
      "numero": numero,
      "email": email!,
      "adresse": adresse,
      "password": password,
    };
    
    //puis une variable qui va contenir nos données
    var body = json.encode(data);
    print(body);
    
    //on va declarer notre chemin de requette
    var url = Uri.parse(baseURL + '/auth/inscription');

    //on va envoyer la requette
    http.Response response = await http.post(url,
        headers: headers,
        body: body
    );
    print(response.statusCode);

    if(response.statusCode == 200){

      return true;
    }
    else {
      print(response.statusCode);
      print(response.body);
      throw (response.body);
    }

  }

//======== methode pour envoyer la localisation=========
  static Future<Localisation> location(double longitude, double latitude, String adresse, int iduser, int id) async{
    Map data = {
      "longitude" : longitude,
      "latitude" : latitude,
      "adresse" : adresse
    };
     
    var body = jsonEncode(data);
    var url = Uri.parse(baseURL + '/signale/creer/$iduser/$id');

    http.Response response = await http.post(url,
                                      headers: headers,
                                      body: body);

    print(response.statusCode == 200);
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
    print(response.body);

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