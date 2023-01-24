import 'package:flutter/material.dart';
import 'package:urgence_projet/Screen/About.dart';

import '../Service/ContactService.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {

  TextEditingController usernameController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
   ContactServices contactServices = ContactServices();

  @override
  Widget build(BuildContext context) {


    return Container(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Container(
            margin: EdgeInsets.only(top: 20),
            height: MediaQuery.of(context).size.height,
            decoration:  BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.red.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ]
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children:  [
                  Text("Username"),
                   TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Username',
                    ),
                  ),
                  const SizedBox(height: 10,),


                  const SizedBox(height: 10,),
                   TextField(
                     controller: passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'password',
                    ),
                  ),

                  const SizedBox(height: 10,),
                  ElevatedButton(onPressed: (){
                    contactServices.login(usernameController.text, passwordController.text);
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>Apropos()), (route) => false);
                  }, child: const Text('Connexion'),)
                ],
              ),
            ),
          ),
      ),
    );
  }
}
