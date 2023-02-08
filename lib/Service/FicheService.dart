

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../Modele/Fiche.dart';
import '../global.dart';
import 'globals.dart';
import 'package:http/http.dart' as http;

class FichesServices{

  var id;

  get()async{
    final prefs = await SharedPreferences.getInstance();
    id = prefs.getInt('id')!;
  }

  // ===== methode pour l'ajout des contact de l'utilisateur =========================
  static Future<Fiche> addFiche(String nom, String prenom, String allergie, String groupe, String adresse, int id) async{
    Map data = {
      "nom": nom,
      "prenom": prenom,
      "allergie": allergie,
      "adresse": adresse,
      "groupe": groupe
    };

    var body = jsonEncode(data);
    var url = Uri.parse(baseURL + "/fiche/modifier/$id");

    http.Response response = await http.put(url,
        headers: headers,
        body: body
    );
    Map responseMap = jsonDecode(response.body);

    Fiche fiche = Fiche.fromMap(responseMap);
    return fiche;
  }

  static Future<List<Fiche>> getfiche(int id) async{
    var url = Uri.parse(baseURL + '/fiche/liste/$id');
    http.Response response = await http.get(url,
      headers: headers,
    );

    List responseList = jsonDecode(response.body);

    List<Fiche> fiches = [];
    for (Map ficheMap in responseList){
      Fiche fiche = Fiche.fromMap(ficheMap);
      fnom = ficheMap['nom'];
      idl = ficheMap['id'];
      prenoms = ficheMap['prenom'];
      allergies = ficheMap['allergie'];
      groupes = ficheMap['groupe'];
      adresses = ficheMap['adresse'];

      fiches.add(fiche);
    }

    return fiches;
  }
}