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

  List<Fiche> fiches = [];

  String ficheNom = '';
  String fichePrenom = '';
  String ficheAllergie = '';
  String ficheGroupe = '';
  String ficheAdresse = "";
  //int usId = 0;

  String noms= '';
  String prenom = '';
  String allergie= '';
  String groupe = '';

  /*Future init() async {
    final prefs = await SharedPreferences.getInstance();
    //usId = prefs.getInt('id')!;
    noms = prefs.getString('nom')!;
    prenom = prefs.getString('prenom')!;
    groupe = prefs.getString('groupe')!;
    print("ici");
    print(noms);
    print("ici");
      setState(() {

      });
    getContact();
    }*/
  getContact() async{
    fiches = await FichesServices.getfiche(usID);
    Provider.of<ContactData>(context, listen: false).fiches = fiches!;
    setState(() { });
  }

  @override
  void initState(){
    super.initState();
    getContact();
    idl;
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
            onTap: (){
              Provider.of<ContactData>(context, listen: false).addFiche(ficheNom, fichePrenom, ficheAllergie, ficheGroupe, ficheAdresse, idl);
              print('ookk');
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

                  Text(

                    fnom != null ? '$fnom' : '',
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
                           onChanged: (fnom){
                             ficheNom = fnom ;
                           },
                           decoration: InputDecoration(
                               hintText: fnom != null ? '$fnom' : 'nom',
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
                           onChanged: (val){
                             fichePrenom = val;
                           },
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
                           onChanged: (val){
                             ficheAdresse = val;
                           },
                           decoration: InputDecoration(
                               hintText: adresses != null ? '$adresses' : 'adresse',
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
                           onChanged: (val){
                             ficheAllergie = val;
                           },
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
                           onChanged: (val){
                             ficheGroupe= val;
                           },
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


