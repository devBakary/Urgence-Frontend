import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urgence_projet/Screen/Accueil.dart';
import 'package:urgence_projet/Screen/Connexions.dart';

import '../Service/ContactService.dart';

class Inscriptions extends StatefulWidget {
  const Inscriptions({Key? key}) : super(key: key);

  @override
  State<Inscriptions> createState() => _InscriptionsState();
}

class _InscriptionsState extends State<Inscriptions> {

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
                gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.lightBlueAccent
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.centerRight
                )

            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(top: 20),

                    child: Center(
                      child: Image.asset("assets/images/loggo.png", width: 600, height: 600,),
                    ),

                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45))
                    ),

                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .55,
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
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
                                SizedBox(height: MediaQuery.of(context).size.height * .02,),


                                //email
                                TextField(
                                  controller: usernameController,
                                  decoration: InputDecoration(
                                      labelText: 'Email',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFe7edeb),
                                      hintText: 'Email',
                                      hintStyle: const TextStyle(
                                          fontSize: 18
                                      ),
                                      prefixIcon: Icon(CupertinoIcons.mail_solid, color: Colors.blueGrey, size: 30,)
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * .02,),


                                TextField(
                                  controller: usernameController,
                                  decoration: InputDecoration(
                                      labelText: 'Numero',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFe7edeb),
                                      hintText: 'Numero',
                                      hintStyle: const TextStyle(
                                          fontSize: 18
                                      ),
                                      prefixIcon: Icon(CupertinoIcons.phone, color: Colors.blueGrey, size: 30,)
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * .02,),


                                TextField(
                                  controller: usernameController,
                                  decoration: InputDecoration(
                                      labelText: 'Adresse',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide.none,
                                      ),
                                      filled: true,
                                      fillColor: Color(0xFFe7edeb),
                                      hintText: 'Adresse',
                                      hintStyle: const TextStyle(
                                          fontSize: 18
                                      ),
                                      prefixIcon: Icon(CupertinoIcons.location, color: Colors.blueGrey, size: 30,)
                                  ),
                                ),
                                SizedBox(height: MediaQuery.of(context).size.height * .02,),

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



                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height * .02,),

                        //container contenant le bouton de inscription
                        Container(
                          padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
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

                        SizedBox(height: MediaQuery.of(context).size.height * .05,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (_) =>Connexions()));
                                },
                                child: const Text("Allez à la page de connexion", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),)),
                            const SizedBox(width: 3,),
                            const Icon(CupertinoIcons.right_chevron, size: 26,)
                          ],
                        )
                      ],
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

