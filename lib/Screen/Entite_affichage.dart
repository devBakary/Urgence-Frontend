import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urgence_projet/Modele/Contact_data.dart';
import 'package:urgence_projet/Modele/Entite.dart';
import 'package:url_launcher/url_launcher.dart';

//pour passer l'appel
Future<void> makeCall(String url) async{
  if(await canLaunch(url)){
    await launch(url);
  }
  else{
    throw "Nous ne pouvons pas lancer l'appel sur $url";
  }
}



class EntiteAffichage extends StatefulWidget {
  final Entite entite;
  final ContactData contactData;

  const EntiteAffichage({Key? key, required this.entite, required this.contactData}) : super(key: key);

  @override
  State<EntiteAffichage> createState() => _EntiteAffichageState();
}

class _EntiteAffichageState extends State<EntiteAffichage> {

  var locLongitude;
  var locLatitude;

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
  }

  localisation() async{
    Position position = await _determinePosition();

    this.locLongitude = position.longitude.toString() ;
    this.locLatitude = position.latitude.toString() ;

    GetAdresseFromLonLat(position);
    final prefs=await SharedPreferences.getInstance();
    await prefs.setInt('locLongitude',locLongitude);
    await prefs.setInt('locLatitude',locLatitude);
    final value=prefs.getInt('locLongitude');
    final value1=prefs.getInt('locLatitude');
    setState(() {

    });
    send();
  }

  send() async{
    final prefs = await SharedPreferences.getInstance();
    locLongitude = prefs.getInt('locLongitude')!;
    locLatitude = prefs.getInt('locLatitude')!;
    Provider.of<ContactData>(context, listen: false).adresse(locLongitude, locLatitude);

  }

  @override
  void initState(){
    super.initState();
    localisation();
  }
  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(

      child: Row(
        children: [
          //l'icon
          Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              //padding: EdgeInsets.only(top: 20, left: 10),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
              ) ,
              child: Image.asset("assets/images/${widget.entite.img}", width: 20,height: 20,),
            ),
          ),

          SizedBox(width: MediaQuery.of(context).size.width * .01,),

          Container(
            //padding: EdgeInsets.all(5),
            child: Expanded(
              child: Container(

                height: 70,
                alignment: AlignmentDirectional.bottomStart,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Colors.red,
                            width: 2
                        )
                    )
                ),
                child: Row(
                  children: [
                     Text(widget.entite.nom, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.call, color: Colors.red,),
                            onPressed: (){
                              print(widget.entite.numero);
                              makeCall('tel: ${widget.entite.numero}');
                              },
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_alert, color: Colors.red,),
                            onPressed: (){
                                send();
                                print("ojjjjjjjjjjjjjjj");

                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),




        ],

      ),

    );
  }
}

