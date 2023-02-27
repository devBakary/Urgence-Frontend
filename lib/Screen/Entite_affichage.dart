import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urgence_projet/Modele/Contact_data.dart';
import 'package:urgence_projet/Modele/Entite.dart';
import 'package:urgence_projet/Screen/Accueil.dart';
import 'package:urgence_projet/global.dart';
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


  String locLongitude = "";
  String  locLatitude = "";
  String locAdresse = "";

  final _player = AudioPlayer();

  bool play = true;

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
    print(place);
    print(place.country);
    print(place.locality);
    print(place.thoroughfare);
    print(place.name);
    print(place.street);


  }

  localisation() async{
    Position position = await _determinePosition();
    List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);

    //print(placemark);
    Placemark place = placemark[0];

    lon = position.longitude;
    lat = position.latitude ;
    ad = place.country;

    GetAdresseFromLonLat(position);
    setState(() {
      GetAdresseFromLonLat(position);
    });
  }

  @override
  void initState(){
    super.initState();
    localisation();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {


    return Column(
      children: [
        SingleChildScrollView(

          child: Card(
            elevation: 5,
            child: Row(
              children: [
                //l'icon
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    //padding: EdgeInsets.only(top: 20, left: 10),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                    ) ,
                    child: CircleAvatar(
                        child: Image.asset("assets/images/${widget.entite.img}", width: 40,height: 40,)),
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
                           Container(
                             width: MediaQuery.of(context).size.width * .36,
                               child: Text(widget.entite.nom,
                                 style: const TextStyle(fontSize: 20,
                                     fontWeight: FontWeight.bold),)),

                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.call, color: Colors.red,),
                                  onPressed: (){
                                    print(widget.entite.numero);
                                    makeCall('tel:223${widget.entite.numero}');
                                    },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add_alert, color: Colors.red,),
                                  onPressed: (){
                                    Provider.of<ContactData>(context, listen: false).adresse(lon, lat, ad, usID, idE);
                                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Accueil()));

                                  },
                                ),
                                IconButton(
                                  icon: const Icon(CupertinoIcons.speaker_2_fill, color: Colors.red,),
                                  onPressed: () async {
                                    await _player.setAsset('assets/audios/${widget.entite.audio}');
                                      setState(() {
                                        play = !play;
                                      });
                                      if(play){
                                        _player.play();
                                      }
                                      else{
                                        _player.stop();
                                      }
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
          ),


        ),
        SizedBox(height: 10,)
      ],
    );
  }
}

