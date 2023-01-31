import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urgence_projet/Screen/Accueil.dart';
import 'package:urgence_projet/Screen/Inscriptions.dart';

import '../Service/ContactService.dart';

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
                  image: AssetImage("assets/images/b.jpg"),
                  fit: BoxFit.cover),

            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
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
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                contactServices.login(usernameController.text, passwordController.text);
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
                            height: 50,
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

                          SizedBox(height: MediaQuery.of(context).size.height * .08,),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                             InkWell(
                               onTap: (){
                                 Navigator.of(context).push(MaterialPageRoute(builder: (_) =>Accueil()));
                               },
                                 child: Text("Sauter", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue),)),
                              SizedBox(width: 3,),
                              Icon(CupertinoIcons.right_chevron, size: 26,)
                            ],
                          )
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

