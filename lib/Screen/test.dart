

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urgence_projet/Modele/Contact.dart';
import 'package:urgence_projet/Modele/Contact_data.dart';
import 'package:urgence_projet/Screen/Contact_tile.dart';
import 'package:urgence_projet/Service/ContactService.dart';



class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Contact>? contacts;

   var id = 0;
  var value1 = 0;


  Future init() async {
    final prefs=await SharedPreferences.getInstance();
    value1 = prefs.getInt('id')!;
    print("je suis un tst" );
    print(value1);
    print("je suis un tst" );
    setState(() {
      this.id = value1;
      print("moi");
      print(id);
      print("moi");
      id;

    });
  }

  getContact() async{
    contacts = await ContactServices.getContact(id);
    Provider.of<ContactData>(context, listen: false).contacts = contacts!;
    setState(() { });
  }


  @override
  void initState(){
    super.initState();
    init();
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
        title: Text(
            'Example  (${Provider.of<ContactData>(context).contacts.length})'),
        centerTitle: true,
        backgroundColor: Colors.red,
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


