

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:urgence_projet/Modele/User.dart';
import 'package:urgence_projet/global.dart';

import 'globals.dart';
import 'package:http/http.dart' as http;

class UserService{

  static Future<List<Users>> getContact(int id) async{
    var url = Uri.parse(baseURL + '/auth/liste/$id');
    http.Response response = await http.get(url,
      headers: headers,
    );

    List responseList = jsonDecode(response.body);



    List<Users> users = [];
    for (Map userMap in responseList){
      Users user = Users.fromMap(userMap);
      users.add(user);
      print("la");
      print(userMap);
      final prefs=await SharedPreferences.getInstance();
      await prefs.setString('username', userMap['username']);
      await prefs.setInt('numero',userMap['numero']);
      await prefs.setString('adresse', userMap['adresse']);
      usern = prefs.getString('username');
      await prefs.setString('email', userMap['email']);

    }

    return users;
  }
}