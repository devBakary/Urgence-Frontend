import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:urgence_projet/Service/UserService.dart';
import 'package:urgence_projet/global.dart';


class Reenitialisation extends StatefulWidget {
  const Reenitialisation({Key? key, this.username}) : super(key: key);
  final username;

  @override
  State<Reenitialisation> createState() => _ReenitialisationState();

}

class _ReenitialisationState extends State<Reenitialisation> {
   final formkey = GlobalKey<FormState>();

  TextEditingController cpassword = TextEditingController();
  TextEditingController newpass = TextEditingController();
  TextEditingController confpass = TextEditingController();

   bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10),
                height: 250,
                width: double.infinity,
                //color: Colors.amber,
                child: Center(
                    child: Lottie.asset('assets/images/setting.json')
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .08,),


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
                      TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return " Veuillez renseigner le champs ! ";
                          }
                          return null;
                        },
                        controller: cpassword,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                            labelText: 'Mot de passe courant ',
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
                            hintText: 'Mot de passe courant ',
                            prefixIcon: Icon(Icons.key, color: Colors.blueGrey, size: 30,)
                        ),
                      ),

                      SizedBox(height: MediaQuery.of(context).size.height * .02,),

                      TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return " Veuillez renseigner le champs ! ";
                          }
                          else if(value.length < 6){
                            return "Le mot de passe doit contenir au minimum (6) caractere ";
                          }
                          return null;
                        },
                        controller: newpass,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                            labelText: 'Nouveau mot de passe ',
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
                            hintText: 'Nouveau mot de passe ',
                            prefixIcon: Icon(Icons.key, color: Colors.blueGrey, size: 30,)
                        ),
                      ),


                      SizedBox(height: MediaQuery.of(context).size.height * .02,),

                      TextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return " Veuillez renseigner le champs ! ";
                          }
                          else if(value.length < 6){
                            return "Le mot de passe doit contenir au minimum (6) caractere ";
                          }
                          return null;
                        },
                        controller: confpass,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                            labelText: 'Confirmation pass ',
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
                            hintText: 'Confirmation mot de passe ',
                            prefixIcon: Icon(Icons.key, color: Colors.blueGrey, size: 30,)
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
                                  if(await UserService.reinitialiser(cpassword.text, newpass.text, confpass.text, util)){
                                    cpassword.text = '';
                                    newpass.text = '';
                                    confpass.text = '';
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
    );
  }
}

