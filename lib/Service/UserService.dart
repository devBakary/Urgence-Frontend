

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


  static Future<bool> passOublie(String username) async {
    Map data = {
      "username" : username
    };

    var body = json.encode(data);
    var url = Uri.parse(baseURL + '/auth/resetpassword');
    http.Response response = await http.post(url,
      headers: headers,
      body: body
    );
    print(body);
    print(response.statusCode);

    if(response.statusCode == 200){
      print(response.body);
       util = response.body;
      print('on est laaa');
      print(util);

      return true;
    }
    else{
      throw (response.body);
    }

  }



  static Future<bool> reinitialiser(String currentpassword, String newpassword, String confirmpassword, String username) async {

    Map data = {
      "currentpassword" : currentpassword,
      "newpassword" : newpassword,
      "confirmpassword" : confirmpassword
    };

    var body = json.encode(data);
    var url = Uri.parse(baseURL + '/auth/changePassword/$util');

    http.Response response = await http.post(url, headers: headers, body: body);

    if(response.statusCode == 200){
      return true;
    }
    else{
      throw (response.body);
    }
  }
}