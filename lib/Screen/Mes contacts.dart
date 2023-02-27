

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urgence_projet/Modele/Contact.dart';
import 'package:urgence_projet/Modele/Contact_data.dart';
import 'package:urgence_projet/Screen/Accueil.dart';
import 'package:urgence_projet/Screen/Contact_tile.dart';
import 'package:urgence_projet/Service/ContactService.dart';
import 'package:urgence_projet/global.dart';



class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Contact>? contacts;

   var id = 0;
   var value1 = 0;
   int usId = 0;


  Future init() async {
    final prefs = await SharedPreferences.getInstance();
    value1 = prefs.getInt('id')!;
    usId = prefs.getInt('id')!;
    if(value1 != null){
      this.id = value1;
      setState(() {

      });
    }
    else{
      value1 = 0;
      this.id = value1;
      setState(() {

      });
    }

    getContact();
  }

  getContact() async{
    contacts = await ContactServices.getContact(usID);
    Provider.of<ContactData>(context, listen: false).contacts = contacts!;
    setState(() { });
  }


  @override
  void initState(){
    super.initState();
    init();
    //id= 0;
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return contacts == null?
    const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    )

        :Scaffold(
      appBar: AppBar(
        title: const Text(
            "Mes Contact"),

        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(CupertinoIcons.back,
                size: 35,),

              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => Accueil(),),);
              },
            );
          },
        ),
            centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(

          children: [

            //pour le box contenant le text et l'icon
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                height: MediaQuery.of(context).size.height * .12,
                decoration: const BoxDecoration(
                  color: Color(0xFFDEE3E8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(CupertinoIcons.person_crop_circle_badge_plus, size: 80,  color: Color(0xFF666666),),

                    SizedBox(width: MediaQuery.of(context).size.width * .03,),

                    const Text('Ajouter Contact', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),)
                  ],
                ),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * .02,),
            //pour ajouter le bouton
            Container(
              child: Center(
                child: ElevatedButton(
                  onPressed: (){
                    _ouvrirTab(context);
                  },
                  child: const Text("Ajouter"),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 40)
                  ),
                ),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),


            Flexible(
              child: Consumer<ContactData>(
                builder: (context, contactData, child){
                  return ListView.builder(
                    itemCount: contactData.contacts.length,
                    itemBuilder: (context, index){
                      Contact contact = contactData.contacts[index];
                      return ContactTile(
                        contact: contact,
                        contactData: contactData,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}



void _ouvrirTab(context){


  TextEditingController contactNom = TextEditingController();
  TextEditingController contactPrenom = TextEditingController();
  TextEditingController contactEmail = TextEditingController();
  TextEditingController contactNumero = TextEditingController();
  TextEditingController contactAdresse = TextEditingController();
  TextEditingController contactLien = TextEditingController();

  int usId = usID;
   ajout() async{
     await ContactServices.addContact(contactNom.text, contactPrenom.text, contactEmail.text, contactNumero.text, contactAdresse.text, contactLien.text, usId);
   }
   final formkey = GlobalKey<FormState>();
   var errorMessage;

  showModalBottomSheet(context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext bc)
      {
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * .90,
            color: Colors.white,
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(
                              Icons.close,
                              size: 40,
                            ),
                          ),

                          const Text("Nouveau Contact", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),

                           InkWell(
                            onTap: () async {
                              if(formkey.currentState!.validate()){
                                if( ajout() == true){

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
                                            child:  Center(
                                                child: Text('Contact ${contactNom} ${contactNumero} ajouté avec succes !',
                                                  textAlign: TextAlign
                                                      .center,
                                                  style: const TextStyle(
                                                      fontSize: 16),
                                                )
                                            )
                                        ),

                                      )
                                  );
                                  Navigator.pop(context);
                                }
                              }

                                print('okkkk');


                            },
                            child: const Text("OK", style: TextStyle(fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),

                            ),
                          ),

                        ]
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      child: const Center(
                        child: Icon(CupertinoIcons.person_circle_fill,
                            size: 140,
                            color: Colors.black54),
                      ),
                    ),
                  ),

                  Padding(
                    padding:  EdgeInsets.only(left: 15, right: 15),

                    child: TextFormField(
                      controller: contactPrenom,
                      validator: (value){
                        if(value!.isEmpty){
                          return " Le prenom est obligatoire! ";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Prenom',
                          border: UnderlineInputBorder()
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TextFormField(
                      controller: contactNom,
                      decoration: const InputDecoration(
                          hintText: 'Nom',
                          border: UnderlineInputBorder()
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TextFormField(
                      controller: contactEmail,
                      decoration: const InputDecoration(
                          hintText: 'example@gmail.com',
                          border: UnderlineInputBorder()
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TextFormField(
                      controller: contactNumero,
                      validator: (value){
                        if(value!.isEmpty){
                          return " Le numero est obligatoire! ";
                        }else if(value.length !=8){
                          return " Le mot de passe doit contenir au minimum (6) caractères ! ";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: 'numero',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TextFormField(
                      controller: contactAdresse,
                      decoration: const InputDecoration(
                          hintText: 'Adresse',
                          border: UnderlineInputBorder()
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: TextFormField(
                      controller: contactLien,
                      decoration: const InputDecoration(
                          hintText: 'Lien',
                          border: UnderlineInputBorder()
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        );
      });
}


