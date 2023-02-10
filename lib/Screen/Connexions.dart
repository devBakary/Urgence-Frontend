import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urgence_projet/Screen/Accueil.dart';
import 'package:urgence_projet/Screen/Inscriptions.dart';

import '../Service/ContactService.dart';
import 'package:http/http.dart' as http;

class Connexions extends StatefulWidget {
  const Connexions({Key? key}) : super(key: key);

  @override
  State<Connexions> createState() => _ConnexionsState();
}

class _ConnexionsState extends State<Connexions> {

  TextEditingController usernameController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  ContactServices contactServices = ContactServices();

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/toff.png"),
                  fit: BoxFit.cover),

            ),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(

                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45))
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * .04,),
                          TextField(
                            controller: usernameController,
                            decoration: InputDecoration(
                                labelText: 'Nom d\'utilisateur',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Color(0xFFe7edeb),
                                hintText: 'Nom d\'utilisateur',
                                hintStyle: const TextStyle(
                                    fontSize: 18
                                ),
                                prefixIcon: Icon(Icons.person, color: Colors.blueGrey, size: 30,)
                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height * .03,),

                          TextField(
                            controller: passwordController,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                                labelText: 'Mot de passe ',
                                suffixIcon: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  child: Icon(_obscureText? Icons.visibility : Icons.visibility_off),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                filled: true,
                                fillColor: Color(0xFFe7edeb),
                                hintText: 'Mot de passe ',
                                prefixIcon: Icon(Icons.key, color: Colors.blueGrey, size: 30,)
                            ),
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height * .03,),

                          Text("Mot de passe oublié ?", style: TextStyle(fontSize: 16, decoration: TextDecoration.underline),),


                          SizedBox(height: MediaQuery.of(context).size.height * .04,),

                          Container(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () {
                                if(usernameController != null || passwordController != null){
                                  contactServices.login(usernameController.text, passwordController.text);

                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) =>Accueil()));
                                }
                                else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor: Colors.white,
                                          elevation: 5,
                                          dismissDirection: DismissDirection.down,
                                          content: Container(
                                            height: 100,
                                            width: MediaQuery.of(context).size.width * .90,
                                            color: Colors.white,
                                            child: const Center(
                                                child: Text("Tous les champs doivent être remplis !",
                                                  style: TextStyle(fontSize: 24, color: Colors.red),
                                                  textAlign: TextAlign.center,)
                                            ),
                                          )
                                      )
                                  );
                                }
                                },
                              style: ElevatedButton.styleFrom(
                                elevation: 3,
                              ),
                              child: const Text(
                                'Connexion',
                                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                            ),
                          ),

                          SizedBox(height: MediaQuery.of(context).size.height * .04,),

                          //container contenant le bouton de inscription
                          Container(
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: (){

                                Navigator.of(context).push(MaterialPageRoute(builder: (_) =>Inscriptions()));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                elevation: 3,
                              ),
                              child: const Text(
                                'Inscription',
                                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}

