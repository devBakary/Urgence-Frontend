import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urgence_projet/Screen/Accueil.dart';
import 'package:urgence_projet/Screen/Inscriptions.dart';
import 'package:urgence_projet/Service/UserService.dart';
import 'package:urgence_projet/Service/globals.dart';

import '../Service/ContactService.dart';
import 'package:http/http.dart' as http;

class Connexions extends StatefulWidget {
  const Connexions({Key? key}) : super(key: key);

  @override
  State<Connexions> createState() => _ConnexionsState();
}

class _ConnexionsState extends State<Connexions> {

  final formkey = GlobalKey<FormState>();

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
            child: Form(
              key: formkey,
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
                            TextFormField(
                              validator: (value){
                                if(value!.isEmpty){
                                  return " Veuillez renseigner le nom d'utilisateur ! ";
                                }
                                return null;
                              },
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

                            TextFormField(
                              controller: passwordController,
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Veuillez renseigner le mot de passe";
                                }
                                return null;
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

                            SizedBox(height: MediaQuery.of(context).size.height * .03,),

                             InkWell(
                              onTap: (){
                                okContext(context);
                              },
                                child: const Text("Mot de passe oublié ?"
                                  , style: TextStyle(fontSize: 16,
                                      decoration: TextDecoration.underline),)),


                            SizedBox(height: MediaQuery.of(context).size.height * .04,),

                            Container(
                              width: double.infinity,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () async {
                                  if (formkey.currentState!.validate()) {
                                    try {
                                      if (await contactServices.login(usernameController.text, passwordController.text)) {
                                          Navigator.of(context).push(MaterialPageRoute(builder: (_) =>Accueil()));
                                      }
                                    } catch (e) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.transparent,
                                          elevation: 0,
                                          content: Container(
                                            padding: EdgeInsets.all(15),
                                              height: 80,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFC72C41),
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: Center(
                                                  child: Text(e.toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 16),
                                                  )
                                              )
                                          ),

                                        ),
                                      );
                                    }
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
          ),
        )
    );
  }

  motdepasse(context){
    TextEditingController username = TextEditingController();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Mot de passe oublié ?",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          content: Container(
            height: 200,
            child: Column(
              children: [
                const Text("Veuillez renseigner votre nom d'utilisateur "),
                TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                    hintText: 'votre username'
                  ),
                ),
                SizedBox(height: 10,),

                InkWell(
                  child: Text('envoi'),
                  onTap: () async {

                      try{
                        if(await UserService.passOublie(username.text)){
                          print("ok");

                       }
                      }catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            content: Container(
                                padding: EdgeInsets.all(15),
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xFFC72C41),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                    child: Text(e.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 16),
                                    )
                                )
                            ),

                          ),
                        );
                      }

                  },
                )
              ],
            ),
          ),

        )
    );
  }

  okContext(context){
    showDialog(context: context,
        builder: (context)=> AlertDialog(
          title: Center(child: Text("Redirection")),
          content: Container(
            height: 120,
            child: Column(
              children:  [
                const Text("Un mot de passe vous a été envoyé sur votre compte mail et "
                    "allez être redirigé a la page de réinitialisation !"
                ),

                SizedBox(height: 15,),
                Padding(
                  padding:  EdgeInsets.only(left: 5,right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(onPressed: (){}, child: Text("ok")),

                      ElevatedButton(
                        style: ButtonStyle(

                        ),
                          onPressed: (){
                        Navigator.pop(context);
                      }, child: Text("Annuler",)),
                    ],
                  ),
                )


              ],
            ),
          ),
        )
    );
  }
}




