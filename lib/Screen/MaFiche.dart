import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urgence_projet/Screen/Accueil.dart';

import '../Modele/Contact_data.dart';
import '../Modele/Fiche.dart';
import '../Service/FicheService.dart';
import '../global.dart';

class MaFiche extends StatefulWidget {
  const MaFiche({Key? key}) : super(key: key);

  @override
  State<MaFiche> createState() => _MaFicheState();
}

class _MaFicheState extends State<MaFiche> {

  List<Fiche>? fiches = [];

  TextEditingController ficheNom = TextEditingController();
  TextEditingController fichePrenom = TextEditingController();
  TextEditingController ficheAllergie = TextEditingController();
  TextEditingController ficheGroupe = TextEditingController();
  TextEditingController ficheAdresse = TextEditingController();
  //int usId = 0;

  var noms;
  var fprenom;
  var fallergie;
  var fgroupe;
  var fadresse;

  Future init() async {
    final prefs = await SharedPreferences.getInstance();

    fadresse = prefs.getString('adresse');
    noms = prefs.getString('nom')!;
    fprenom = prefs.getString('prenom')!;
    fgroupe = prefs.getString('groupe')!;
    fallergie = prefs.getString('allergie')!;
    setState(() {

    });
  }
  getFiche() async{
    fiches = await FichesServices.getfiche(usID);
    Provider.of<ContactData>(context, listen: false).fiches = fiches!;
    init();
    setState(() { });

  }

  @override
  void initState(){
    super.initState();
   // ficheNom.text = fnom;
    getFiche();
    init();
    idl;
    fnom;
    prenoms;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return fiches == null?
    const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    )

    :Scaffold(
      appBar: AppBar(
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


          title:  const Text('Ma Fiche',
          style: TextStyle(fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white),
          ),
          elevation: 0,

          actions: <Widget>[
          // Premier bouton
          InkWell(
            onTap: () async {
                FichesServices.addFiche(ficheNom.text, fichePrenom.text, ficheAllergie.text, ficheGroupe.text, ficheAdresse.text, idl);
                print('ookk');

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


              },
           child:  Container(

               padding: const EdgeInsets.only( top: 15, right: 20),
               child: const Text("Ok", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
           ),
          ),

        ],
          centerTitle: true,
          backgroundColor: Color(0xFF0054E0),
      ),
      body: Container(
        child: Column(

          children: [

            Container(
              height: MediaQuery.of(context).size.height * .2,
              decoration:  const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Color(0xFF0054E0),
              ),

              child: Column(
                children:  [
                 const Center(
                    child: Icon(CupertinoIcons.person_crop_circle_fill, size: 90, color: Colors.white,),
                  ),

                  Text( noms != null ? noms : '',

                    //
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),


            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),

            //les infos
           Flexible(
             child: ListView(
               children: [


                 Padding(
                   padding: const EdgeInsets.only(left: 5, right: 5),
                   child: Container(
                     width: double.infinity,
                     padding: EdgeInsets.all(8),
                     decoration: const BoxDecoration(
                         color: Color(0xFFDEE3E8),
                         borderRadius: BorderRadius.all(Radius.circular(8.0),
                         )
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         const Text("Nom",
                           style: TextStyle(fontSize: 17,
                               color: Colors.black),
                         ),

                         TextFormField(
                           controller: ficheNom,
                           /*onChanged: (value){
                             if(ficheNom.text.isEmpty){
                               ficheNom.text = fnom;
                             }
                           },*/
                           decoration: InputDecoration(
                               hintText: noms != null ? '$noms' : 'nom',
                               hintStyle: TextStyle(color: Colors.blueAccent),
                               border: InputBorder.none
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
                 SizedBox(
                   height: MediaQuery.of(context).size.height * .02,
                 ),
                 Padding(
                   padding: const EdgeInsets.only(left: 5, right: 5),
                   child: Container(
                     width: double.infinity,
                     padding: EdgeInsets.all(8),
                     decoration: const BoxDecoration(
                         color: Color(0xFFDEE3E8),
                         borderRadius: BorderRadius.all(Radius.circular(8.0),
                         )
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         const Text("Prenom",
                           style: TextStyle(fontSize: 17,
                               color: Colors.black),
                         ),

                         TextFormField(
                           controller: fichePrenom,
                           decoration: InputDecoration(
                               hintText: prenoms != null ? '$prenoms' : 'prenom',
                               hintStyle: TextStyle(color: Colors.blueAccent),
                               border: InputBorder.none
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
                 SizedBox(
                   height: MediaQuery.of(context).size.height * .02,
                 ),

                 //Container pour anniversaire
                 Padding(
                   padding: const EdgeInsets.only(left: 5, right: 5),
                   child: Container(
                     width: double.infinity,
                     padding: EdgeInsets.all(3),
                     decoration: const BoxDecoration(
                         color: Color(0xFFDEE3E8),
                         borderRadius: BorderRadius.all(Radius.circular(8.0),
                         )
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         const Text("Adresse",
                           style: TextStyle(fontSize: 17,
                               color: Colors.black),
                         ),

                         TextFormField(
                           controller: ficheAdresse,
                           decoration: InputDecoration(
                               hintText: fadresse != null ? '$fadresse' : 'adresse',
                               hintStyle: TextStyle(color: Colors.blueAccent),
                               border: InputBorder.none
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),

                 SizedBox(
                   height: MediaQuery.of(context).size.height * .02,
                 ),
                 //Container pour le domicile
                 Padding(
                   padding: const EdgeInsets.only(left: 5, right: 5),
                   child: Container(
                     width: double.infinity,
                     padding: EdgeInsets.all(3),
                     decoration: const BoxDecoration(
                         color: Color(0xFFDEE3E8),
                         borderRadius: BorderRadius.all(Radius.circular(8.0),
                         )
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         const Text("Allergie",
                           style: TextStyle(fontSize: 17,
                               color: Colors.black),
                         ),

                         TextFormField(
                           controller: ficheAllergie,
                           decoration: InputDecoration(
                               hintText: allergies != null ? '$allergies' : 'allergie',
                               hintStyle: TextStyle(color: Colors.blueAccent),
                               border: InputBorder.none
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),


                 SizedBox(
                   height: MediaQuery.of(context).size.height * .02,
                 ),
                 //Container pour le domicile
                 Padding(
                   padding: const EdgeInsets.only(left: 5, right: 5),
                   child: Container(
                     width: double.infinity,
                     padding: EdgeInsets.all(3),
                     decoration: const BoxDecoration(
                         color: Color(0xFFDEE3E8),
                         borderRadius: BorderRadius.all(Radius.circular(8.0),
                         )
                     ),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         const Text("Groupe sanguin",
                           style: TextStyle(fontSize: 17,
                               color: Colors.black),
                         ),

                         TextFormField(
                           controller: ficheGroupe,
                           decoration: InputDecoration(
                               hintText: groupes != null ? '$groupes' : 'groupe sanguin',
                               hintStyle: TextStyle(color: Colors.blueAccent),
                               border: InputBorder.none
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),

                 //=============================================

                 SizedBox(
                   height: MediaQuery.of(context).size.height * .02,
                 ),
               ],
             ),
           )
          ],

        ),
      ),
    );
  }
}



