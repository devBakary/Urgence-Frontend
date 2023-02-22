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

  final formkey = GlobalKey<FormState>();

  TextEditingController userUsername= TextEditingController();
  TextEditingController userNumero= TextEditingController();
  TextEditingController userAdresse= TextEditingController();
  TextEditingController userPassword = TextEditingController();
  ContactServices contactServices = ContactServices();

  recharge(){
    setState(() {
      userUsername.clear();
    });
  }


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

                    child: Form(
                      key: formkey,
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
                                  SizedBox(height: MediaQuery.of(context).size.height * .08,),
                                  TextFormField(
                                    controller: userUsername,
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return " Le nom d'utilisateur est obligatoire ! ";
                                      }else if(value.length < 3){
                                        return "le nom d'utilisateur doit contenir au minimum (3) caractères !";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        labelText: 'Nom d\'utilisateur *',
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

                                  //numero
                                  TextFormField(
                                    keyboardType: TextInputType.phone,
                                    controller: userNumero,
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return " Le numero est obligatoire !";
                                      }else if(value.length != 8){
                                        return " Le format incorrect, veuillez entrer les (8) chiffres !";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                        labelText: 'Numero *',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide.none,
                                        ),
                                        filled: true,
                                        fillColor: Color(0xFFe7edeb),
                                        hintText: 'Numero de telephone *',
                                        hintStyle: const TextStyle(
                                            fontSize: 18
                                        ),
                                        prefixIcon: Icon(CupertinoIcons.phone, color: Colors.blueGrey, size: 30,)
                                    ),
                                  ),
                                  SizedBox(height: MediaQuery.of(context).size.height * .02,),

                                  //adresse
                                  TextFormField(
                                    controller: userAdresse,
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
                                  TextFormField(
                                    controller: userPassword,
                                    validator: (value){
                                      if(value!.isEmpty){
                                        return " Le mot de passe est obligatoire! ";
                                      }else if(value.length <6){
                                        return " Le mot de passe doit contenir au minimum (6) caractères ! ";
                                      }
                                      return null;
                                    },
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                        labelText: 'Mot de passe *',
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
                                onPressed: () async {
                                    if(formkey.currentState!.validate()) {
                                      try {
                                        if (await contactServices.inscriprtion(userUsername.text, userNumero.text, userAdresse.text, userPassword.text)) {
                                          //Navigator.pop(context);
                                          userUsername.text = '';
                                          userNumero.text = '';
                                          userAdresse.text = '';
                                          userPassword.text = '';

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                                SnackBar(
                                            duration: Duration(seconds: 5),
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,
                                            content: Container(
                                                padding: EdgeInsets.all(15),
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius: BorderRadius
                                                      .circular(20),
                                                ),
                                                child: const Center(
                                                    child: Text('Votre compte a été créé avec succes !',
                                                      textAlign: TextAlign
                                                          .center,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    )
                                                )
                                            ),

                                          ));
                                          // Navigator.of(context).push(MaterialPageRoute(builder: (_) =>Accueil()));
                                        }

                                      } catch (e) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            duration: Duration(seconds: 5),
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,
                                            content: Container(
                                                padding: EdgeInsets.all(15),
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius: BorderRadius
                                                      .circular(20),
                                                ),
                                                child: Center(
                                                    child: Text('$e',
                                                      textAlign: TextAlign
                                                          .center,
                                                      style: TextStyle(
                                                          fontSize: 16),
                                                    )
                                                )
                                            ),

                                          ),
                                        );

                                      }
                                      formkey.currentState?.reset();
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
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}

