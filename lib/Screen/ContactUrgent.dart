import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urgence_projet/Modele/Contact.dart';
import 'package:urgence_projet/Modele/Contact_data.dart';
import 'package:urgence_projet/Screen/Accueil.dart';
import 'package:urgence_projet/Screen/ContactAbout.dart';
import 'package:urgence_projet/Screen/Contact_tile.dart';
import 'package:urgence_projet/Service/ContactService.dart';

import '../Service/UserSecureStorage.dart';

class ContactUrgent extends StatefulWidget {
  const ContactUrgent({Key? key}) : super(key: key);

  @override
  State<ContactUrgent> createState() => _ContactUrgentState();
}

class _ContactUrgentState extends State<ContactUrgent> {

  ContactServices contactServices = ContactServices();
  List<Contact>? contacts;
   var idU = 1;
   int value1 = 1;



  getContact() async{
    contacts = await ContactServices.getContact(idU);
    Provider.of<ContactData>(context, listen: false).contacts = contacts!;
    setState(() { });
  }





  @override
  void initState(){
    super.initState();
    getContact();
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

        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(CupertinoIcons.back,
                size: 35,),
              onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (_) =>Accueil())); },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),


        title: Text(
            'Example Clients (${Provider.of<ContactData>(context).contacts.length})'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
        //centerTitle: true,


      body: Container(
        padding: const EdgeInsets.only(top: 100, left: 10),
        child:  Column(
          children: [
            //pour le texte info
            Padding(
              padding: const EdgeInsets.only( top: 30),
              child: Container(
                padding: const EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height * .14,
                decoration: const BoxDecoration(
                  color: Color(0xFFDEE3E8),
                ),
                child: const Center(
                  child: Text("Ajouter des numéros d’urgence pour les appeler ou partager votre position à tout moment!",
                    style: TextStyle(fontSize: 20,),),
                ),
              ),
            ),

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
            //fin _______________________________________________ _____________

            SizedBox(height: MediaQuery.of(context).size.height * .02,),
            //pour ajouter le bouton
            Container(
              child: Center(
                child: ElevatedButton(
                  onPressed: (){},
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
            //les numeros d'urgence
            Consumer<ContactData>(builder: (context, contactData, child) {
              return ListView.builder(
                  itemCount: contactData.contacts.length,
                  itemBuilder: (context, index){
                    Contact contact = contactData.contacts[index];
                      return ContactTile(
                        contact : contact,
                        contactData : contactData,
                      );
                    }
              );
                

            }),

          ],
        ),
        ),
    );
  }
}



