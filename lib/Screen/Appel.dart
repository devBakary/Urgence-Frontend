import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:urgence_projet/Modele/Contact_data.dart';
import 'package:urgence_projet/Modele/Entite.dart';
import 'package:urgence_projet/Screen/Accueil.dart';
import 'package:urgence_projet/Screen/Entite_affichage.dart';
import 'package:urgence_projet/Service/ContactService.dart';

class Appel extends StatefulWidget {
  const Appel({Key? key}) : super(key: key);

  @override
  State<Appel> createState() => _AppelState();
}

class _AppelState extends State<Appel> {

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

    //print(placemark);
    Placemark place = placemark[0];
    adresse = '${place.country}';
    print(adresse);
  }


  List<Entite>? entites;

  getEntite() async{
    entites = await ContactServices.getEntite();
    Provider.of<ContactData>(context, listen: false).entite = entites!;
    setState(() { });
  }


  @override
  void initState(){
    super.initState();
    getEntite();
  }

  @override
  Widget build(BuildContext context) {
    return entites == null?
    const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    )
      :Scaffold(
      appBar: AppBar(

        title:  Text('Example Clients (${Provider.of<ContactData>(context).entite.length})',
          style: const TextStyle(fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),

      body: Container(
        padding: EdgeInsets.only(right: 10, left: 10),
        child: Column(
          children: [
            //pour la barre de recherche
            Padding(
              padding: EdgeInsets.only( top: 30),
              child: Container(
                height: MediaQuery.of(context).size.height * .08,
                decoration: BoxDecoration(
                  color: Color(0xFFDEE3E8),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            //pour le box contenant le text
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Container(
                height: MediaQuery.of(context).size.height * .12,
                decoration: const BoxDecoration(
                  color: Color(0xFFDEE3E8),
                ),
                child: const Center(
                  child:  Text("Appeler ou alerter un service de secours en partageant votre position",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                ),
              ),
            ),
            //fin ____________________________________________________________

            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),

          Container(
            child: Expanded(
                child: Flexible(
                  child: Consumer<ContactData>(builder: (context, contactData, child){
                    return ListView.builder(
                      itemCount: contactData.entite.length,
                      itemBuilder: (context, index){
                        Entite entite = contactData.entite[index];
                        return EntiteAffichage(
                            entite: entite,
                            contactData: contactData,
                        );
                      });
                  },),
                  )
            ),
          )

          ],
        ),
      ),
    );
  }
}


