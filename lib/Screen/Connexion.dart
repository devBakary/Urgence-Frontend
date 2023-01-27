import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Modele/Contact_data.dart';

class Connexion extends StatefulWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {

  String userUsername = '';
  String userEmail = '';
  String userNumero = '';
  String userAdresse = '';
  String userPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:  [
           TextField(
            onChanged: (val){
              userUsername = val;
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Username',
            ),
          ),
          const SizedBox(height: 10,),


          const SizedBox(height: 10,),
           TextField(
            onChanged: (val){
              userEmail = val;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Email',
            ),
          ),

          const SizedBox(height: 10,),
          TextField(
            onChanged: (val){
              userNumero = val;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'numero',
            ),
          ),
          
          const SizedBox(height: 10,),
          TextField(
            onChanged: (val){
              userAdresse = val;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'adresse',
            ),
          ),

          const SizedBox(height: 10,),
          TextField(
            onChanged: (val){
              userPassword = val;
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'password',
            ),
          ),

          const SizedBox(height: 10,),
          ElevatedButton(onPressed: (){
            if(userUsername.isNotEmpty && userNumero.isNotEmpty && userEmail.isNotEmpty && userPassword.isNotEmpty && userAdresse.isNotEmpty){
              Provider.of<ContactData>(context, listen: false).inscriptionUser(userUsername, userEmail, userNumero, userAdresse, userPassword
              );
              Navigator.pop(context);
              print('okkkk');
            }
            }, child: const Text('Connexion'),)
        ],
      ),
    );
  }
}
