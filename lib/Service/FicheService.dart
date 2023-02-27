

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
  static Future<bool> addFiche(String nom, String prenom, String allergie, String groupe, String adresse, int id) async{
    Map data = {
      "nom": nom,
      "prenom": prenom,
      "allergie": allergie,
      "adresse": adresse,
      "groupe": groupe
    };

    var body = jsonEncode(data);
    print(body);
    var url = Uri.parse(baseURL + "/fiche/modifier/$id");

    http.Response response = await http.put(url,
        headers: headers,
        body: body
    );
    if(response.statusCode == 200){
      print(response.statusCode);
      print(response.body);
      Map responseMap = jsonDecode(response.body);

      Fiche fiche = Fiche.fromMap(responseMap);
      return true;
    }
    else{
      throw('une erreur');
    }


  }

  static Future<List<Fiche>> getfiche(int id) async{
    var url = Uri.parse(baseURL + '/fiche/liste/$id');
    http.Response response = await http.get(url,
      headers: headers,
    );

    List responseList = jsonDecode(response.body);
    //print(response.body);


    List<Fiche> fiches = [];
    for (Map ficheMap in responseList){
      Fiche fiche = Fiche.fromMap(ficheMap);
      print(ficheMap);
      fnom = ficheMap['nom'];
      idl = ficheMap['id'];
      prenoms = ficheMap['prenom'];
      allergies = ficheMap['allergie'];
      groupes = ficheMap['groupe'];
      adresses = ficheMap['adresse'];
      print(adresses);
      fiches.add(fiche);
      final prefs= await SharedPreferences.getInstance();
      await prefs.setString('prenom', ficheMap['prenom']);
      await prefs.setString('nom',ficheMap['nom']);
      await prefs.setString('groupe',ficheMap['groupe']);
      await prefs.setString('adresse', ficheMap['adresse']);
      await prefs.setString('allergie', ficheMap['allergie']);
    }

    return fiches;
  }
}