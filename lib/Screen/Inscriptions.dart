import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urgence_projet/Screen/Accueil.dart';
import 'package:urgence_projet/Screen/Connexions.dart';

import '../Modele/Contact_data.dart';
import '../Service/ContactService.dart';

class Inscriptions extends StatefulWidget {
  const Inscriptions({Key? key}) : super(key: key);

  @override
  State<Inscriptions> createState() => _InscriptionsState();
}

class _InscriptionsState extends State<Inscriptions> {

  String userUsername = '';
  String userEmail = '';
  String userNumero = '';
  String userAdresse = '';
  String userPassword = '';

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
                          height: MediaQuery.of(context).size.height * .60,
                          padding: const EdgeInsets.all(20.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: MediaQuery.of(context).size.height * .04,),
                                TextField(
                                    onChanged: (val){
                                    userUsername = val;
                                    },
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
                                  onChanged: (val){
                                  userEmail = val;
                                  },
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

                                //numero
                                TextField(
                                  onChanged: (val){
                                  userNumero = val;
                                  },
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

                                //adresse
                                TextField(
                                  onChanged: (val){
                                  userAdresse = val;
                                  },
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

                                //mot de passe
                                TextField(
                                  onChanged: (val){
                                  userPassword = val;
                                  },
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
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              elevation: 3,
                            ),
                              onPressed: (){
                                  if(userUsername.isNotEmpty && userNumero.isNotEmpty && userEmail.isNotEmpty && userPassword.isNotEmpty && userAdresse.isNotEmpty){
                                       Provider.of<ContactData>(context, listen: false).inscriptionUser(userUsername, userEmail, userNumero, userAdresse, userPassword
                                  );
                                    Navigator.pop(context);
                                    print('okkkk');
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
                            child: const Text(
                              'Inscription',
                              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                          ),
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height * .03,),

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

