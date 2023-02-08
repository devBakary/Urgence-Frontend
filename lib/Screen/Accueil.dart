import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urgence_projet/Screen/About.dart';
import 'package:urgence_projet/Screen/Appel.dart';
import 'package:urgence_projet/Screen/Connexion.dart';
import 'package:urgence_projet/Screen/Connexions.dart';
import 'package:urgence_projet/Screen/ContactUrgent.dart';
import 'package:urgence_projet/Screen/Inscription.dart';
import 'package:urgence_projet/Screen/MaFiche.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:urgence_projet/Screen/PageAide.dart';
import 'package:urgence_projet/Screen/detail%20de%20secours.dart';
import 'package:urgence_projet/Screen/test.dart';
import 'package:urgence_projet/Screen/video.dart';
import 'package:urgence_projet/navigation/NavigationDrawer.dart';

import 'Geste de secours.dart';

class Accueil extends StatefulWidget {
   Accueil({Key? key}) : super(key: key);

  @override
  State<Accueil> createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {

  String adresse = '';

  //la localisation

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // teste si la geolocation est desactivée
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('La localisation est desactivée');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('La localisation a ete refusé');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, Nous ne pouvons pas avoir la permission.');
    }

    return await Geolocator.getCurrentPosition();

  }

  Future<void> GetAdresseFromLonLat(Position position) async{

    List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
    
    print(placemark);
    Placemark place = placemark[0];
    adresse = '${place.country}';
    print(adresse);
  }


  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Scaffold(
            drawer: NavigationDrawer(),
            appBar: AppBar(

              leading: Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: Icon(Icons.menu),
                    iconSize: 35,
                    alignment: Alignment.center,
                    onPressed: (){
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );

                },
              ),

              title: const Text("URGENCE MALI",
                style: TextStyle(fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),

              centerTitle: true,
              backgroundColor: Colors.blue,
            ),

            body: Container(

              child: Column(
                children:  [
                  Container(
                    color: Colors.green,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * .25,
                    child: ElevatedButton(onPressed: () async {
                      Position position = await _determinePosition();
                      print(position.latitude);
                      print(position.longitude);
                      GetAdresseFromLonLat(position);

                      setState(() {

                      });
                    },
                      child: Text("avoir la loc"),

                    ),
                  ),


                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),

                    Expanded(
                      //padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                            color: Color(0xFFDEE3E8),
                            borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          )
                        ),


                          child: GridView(
                            gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10),
                            children: [
                              //Appel d'urgence
                              Container(
                                padding: EdgeInsets.all(5),

                                child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_) =>Appel()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFFD42125),
                                        borderRadius: BorderRadius.circular(25)
                                    ),

                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.call, size: 80, color: Colors.white,),
                                        Text("Appel Urgence", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),


                              //mes contacts
                              Container(
                                padding: EdgeInsets.all(5),

                                child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_) =>Homescreen()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFFD42125),
                                        borderRadius: BorderRadius.circular(25)
                                    ),

                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Icon(CupertinoIcons.person_crop_circle, size: 80, color: Colors.white,),
                                        Text("Mes Contacts", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),


                              //ma fiche
                              Container(
                                padding: EdgeInsets.all(5),

                                child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_) =>MaFiche()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFF0054E0),
                                        borderRadius: BorderRadius.circular(25)
                                    ),

                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.perm_contact_cal, size: 80, color: Colors.white,),
                                        Text("Ma fiche", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),


                              //apropos
                              Container(
                                padding: EdgeInsets.all(5),

                                child: InkWell(
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (_) =>Apropos()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xFF0054E0),
                                        borderRadius: BorderRadius.circular(25)
                                    ),

                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Icon(CupertinoIcons.info_circle_fill, size: 80, color: Colors.white,),
                                        Text("Apropos", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],

                          ),
                      ),
                    ),
                ],
              ),
            ),
        );
      }
    );
  }
}




showDialogWidget(BuildContext context){


  showModalBottomSheet(context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(
        top: Radius.circular(32),

      )),

      builder: (BuildContext context){
      return

        Container(
        height: MediaQuery.of(context).size.height * 0.94,

          child: Column(
            children:  [
               Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * .02),
                  height: 10,
                  width: MediaQuery.of(context).size.width * .3,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30),
                      right: Radius.circular(30)
                    )
                  ),
                )
              ),

              SizedBox(
                  height: MediaQuery.of(context).size.height * .02
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                      const Text("Activer l'option non voyant",
                      style: TextStyle(
                        fontSize:  24,
                        fontWeight: FontWeight.bold
                      ),
                      ),

                    Container(
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(bottom: 18, right: 10 ),
                      child: IconButton(
                         // alignment: Alignment.,
                          onPressed: (){},
                          icon: const Icon(Icons.toggle_off_outlined, color: Colors.green, size: 50,)),
                    )
                  ],
                ),
              ),


              SizedBox(
                  height: MediaQuery.of(context).size.height * .009
              ),

             Center(
              child: Column(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) =>GesteSecours()));
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                      ),
                      child: Center(child: const Text("Geste", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)),
                    ),
                  ),
                  SizedBox(height: 5,),


                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) =>Aide()));
                    },
                    child: Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width * .9,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                      ),
                      child: Center(child: const Text("Aide", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)),
                    ),
                  ),
                  SizedBox(height: 5,)
                ],
              )
            )
            ],
          ),

    );
  }
  );
}




