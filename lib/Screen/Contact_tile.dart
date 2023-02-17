
import 'package:flutter/material.dart';
import 'package:urgence_projet/Modele/Contact.dart';
import 'package:urgence_projet/Modele/Contact_data.dart';
import 'package:urgence_projet/Screen/ContactAbout.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> makeCall(String url) async{
  if(await canLaunch(url)){
    await launch(url);
  }
  else{
    throw "Nous ne pouvons pas lancer l'appel sur $url";
  }
}

class ContactTile extends StatelessWidget {
  final Contact contact;
  final ContactData contactData;

  const ContactTile({ Key? key, required this.contact, required this.contactData}):
        super(key : key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [

          SizedBox(width: MediaQuery
              .of(context)
              .size
              .width * .01,),

          Container(
            //padding: EdgeInsets.all(5),
            child: Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) =>
                          ContactAbout(contact: contact,)));
                },
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
                  child: Expanded(

                    child: Row(

                      children: [
                        Text(contact.prenom + " " + contact.nom, style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold),),
                        //SizedBox(width: MediaQuery.of(context).size.width * .13,),

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.call, color: Colors.red,),
                                onPressed: () {
                                  makeCall('tel:223${contact.numero}');
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
            ),
          ),


        ],
      ),
    );
  }
}
