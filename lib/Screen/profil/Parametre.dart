import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:urgence_projet/Service/UserService.dart';
import 'package:urgence_projet/global.dart';

class updateUser extends StatefulWidget {
  const updateUser({Key? key}) : super(key: key);

  @override
  State<updateUser> createState() => _updateUserState();
}

class _updateUserState extends State<updateUser> {
  final formkey = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController numero = TextEditingController();
  TextEditingController adresse = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Container(
                  //margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.all(10),
                  height: 240,
                  width: double.infinity,
                  //color: Colors.amber,
                  child: Center(
                      child: Lottie.asset('assets/images/setting.json')
                  ),
                ),
                //SizedBox(height: MediaQuery.of(context).size.height * .08,),


                Form(
                  key: formkey,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width * .99,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red
                    ),

                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * .02,),


                        //username
                        TextFormField(
                          controller: username,
                          validator: (value){
                            if(value!.length < 3){
                              return "le nom d'utilisateur doit contenir au minimum (3) caracteres ";
                            }
                          },
                          decoration: InputDecoration(
                              labelText: 'Nom d\'utilisateur ',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Color(0xFFe7edeb),
                              hintText: 'Nom d\'utilisateur ',
                              prefixIcon: Icon(Icons.person, color: Colors.blueGrey, size: 30,)
                          ),
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height * .02,),

                        //email
                        TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                              labelText: 'Email ',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Color(0xFFe7edeb),
                              hintText: 'Email ',
                              prefixIcon: Icon(Icons.mail, color: Colors.blueGrey, size: 30,)
                          ),
                        ),


                        SizedBox(height: MediaQuery.of(context).size.height * .02,),

                        //contact
                        TextFormField(
                          controller: numero,
                          validator: (value){
                            if (value!.length < 8){
                              return "le numero doit contenir (8) caracteres ";

                            }
                          },
                          decoration: InputDecoration(
                              labelText: 'Contact',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Color(0xFFe7edeb),
                              hintText: '70000000 ',
                              prefixIcon: Icon(Icons.call, color: Colors.blueGrey, size: 30,)
                          ),
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height * .02,),

                        //domicile
                        TextFormField(
                          controller: adresse,
                          decoration: InputDecoration(
                              labelText: 'Adresse ',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Color(0xFFe7edeb),
                              hintText: 'adresse ',
                              prefixIcon: Icon(Icons.location_city, color: Colors.blueGrey, size: 30,)
                          ),
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height * .06   ,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [

                            Container(
                              width: MediaQuery.of(context).size.width * .40,
                              height: 50,
                              child: ElevatedButton(onPressed: () async{
                                if(formkey.currentState!.validate()){

                                  try{
                                    if (await UserService.updateUser(username.text, email.text, numero.text, adresse.text, usID))
                                   {

                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          behavior: SnackBarBehavior.floating,
                                          backgroundColor: Colors.transparent,
                                          elevation: 0,
                                          content: Container(
                                              padding: EdgeInsets.all(15),
                                              height: 80,
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: const Center(
                                                  child: Text("Votre mot de passe a été modifier avec succes !",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 16),
                                                  )
                                              )
                                          ),

                                        ),
                                      );
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
                                }
                              },
                                child: Text("Confirmer", style: TextStyle(fontSize: 20),),
                              ),
                            ),

                            Container(
                              width: MediaQuery.of(context).size.width * .40,
                              height: 50,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                  ),
                                  onPressed: (){
                                    Navigator.pop(context);
                                  }, child: Text("Retour", style: TextStyle(fontSize: 20))),
                            ),
                          ],
                        ),
                      ],

                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
