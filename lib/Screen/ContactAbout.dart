import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urgence_projet/Modele/Contact.dart';
import 'package:urgence_projet/Screen/ContactUrgent.dart';
import 'package:urgence_projet/Screen/Mes contacts.dart';
import 'package:urgence_projet/Service/ContactService.dart';
import 'package:url_launcher/url_launcher.dart';

import '../global.dart';

Future<void> makeCall(String url) async{
  if(await canLaunch(url)){
    await launch(url);
  }
  else{
    throw "Nous ne pouvons pas lancer l'appel sur $url";
  }
}

class ContactAbout extends StatefulWidget {
  const ContactAbout({Key? key, required this.contact}) : super(key: key);


  final Contact contact;

  @override
  State<ContactAbout> createState() => _ContactAboutState();
}

class _ContactAboutState extends State<ContactAbout> {

  TextEditingController nom = TextEditingController();
  TextEditingController prenom = TextEditingController();
  TextEditingController numero = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController adresse = TextEditingController();
  TextEditingController lien = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: CustomScrollView(


        slivers: [
          //appbar
           SliverAppBar(
             backgroundColor: Color(0xFF0054E0),

             leading: Builder(
               builder: (BuildContext context) {
                 return IconButton(
                   icon: const Icon(CupertinoIcons.back,
                     size: 35,),

                   onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (_) => Homescreen(),),);
                   },
                 );
               },
             ),


             actions: <Widget>[
               // Premier bouton
               InkWell(
                 onDoubleTap: () async {
                   print(widget.contact.id);
                   await ContactServices.upContact(nom.text, prenom.text, numero.text, email.text, adresse.text, lien.text, widget.contact.id);
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


            expandedHeight: 200,
            floating: false,
            pinned: true,
             title: Text(widget.contact.prenom + " " + widget.contact.nom),
             centerTitle: true,


            flexibleSpace: FlexibleSpaceBar(

              background: Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    Container(
                      height: 200 - 30,
                      decoration: const BoxDecoration(
                          color: Color(0xFF0054E0),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)
                          )
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          //padding: EdgeInsets.all(10),
                          height: 120,
                          decoration: BoxDecoration(
                              color: Color(0xFFDEE3E8),
                              borderRadius: BorderRadius.circular(10)
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:  [
                              const SizedBox(
                                height: 10,
                              ),
                              const Divider(
                                color: Colors.black,
                                indent: 20,
                                endIndent: 20,
                              ),

                              SizedBox(height: 5,),

                              //pour appel
                              Container(
                                padding: const EdgeInsets.only(right: 20, left: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 70,

                                      child: InkWell(
                                        onTap: (){
                                          makeCall('tel:223${widget.contact.numero}');
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(8)
                                          ),

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [
                                              Icon(Icons.call, size: 20, color: Color(0xFF0054E0),),
                                              Text("Appel", style: TextStyle(color: Color(0xFF0054E0), fontSize: 14, fontWeight: FontWeight.bold),)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      height: 60,
                                      width: 70,

                                      child: InkWell(
                                        onTap: (){
                                          makeCall('sms:223${widget.contact.numero}');
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(8)
                                          ),

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [
                                              Icon(Icons.message, size: 20, color: Color(0xFF0054E0),),
                                              Text("Message", style: TextStyle(color: Color(0xFF0054E0), fontSize: 14, fontWeight: FontWeight.bold),)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),

                                    Container(

                                      height: 60,
                                      width: 70,

                                      child: InkWell(
                                        onTap: (){
                                          widget.contact.email != null? makeCall('mailto:223${widget.contact.email}') : "pas d'email valide!";
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(8)
                                          ),

                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [
                                              Icon(CupertinoIcons.mail, size: 20, color: Color(0xFF0054E0),),
                                              Text("Mail", style: TextStyle(color: Color(0xFF0054E0), fontSize: 14, fontWeight: FontWeight.bold),)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],),
                              ),



                            ],
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //contenu de ma page portable
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                margin: EdgeInsets.only(top: 40),
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
                    const Text("Portable",
                      style: TextStyle(fontSize: 17,
                          color: Colors.black),
                    ),

                    TextFormField(
                      controller: numero,
                      decoration:  InputDecoration(
                          hintText: '${widget.contact.numero}',
                          hintStyle: TextStyle(color: Colors.blueAccent),
                          border: InputBorder.none
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ),

          //============ nom
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
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
                      controller: nom,
                      decoration:  InputDecoration(
                          hintText: widget.contact.nom,
                          hintStyle: const TextStyle(color: Colors.blueAccent),
                          border: InputBorder.none
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //)))))========= prenom
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
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
                      controller: prenom,
                      decoration:  InputDecoration(
                          hintText: widget.contact.prenom,
                          hintStyle: TextStyle(color: Colors.blueAccent),
                          border: InputBorder.none
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //++++++++++++++++++ email
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
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
                    const Text("Email",
                      style: TextStyle(fontSize: 17,
                          color: Colors.black),
                    ),

                    TextFormField(
                      controller: email,
                      decoration:  InputDecoration(
                          hintText: '${widget.contact.email}',
                          hintStyle: TextStyle(color: Colors.blueAccent),
                          border: InputBorder.none
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //++++++++++++++++++ domicile ===========
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
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
                    const Text("Domicile",
                      style: TextStyle(fontSize: 17,
                          color: Colors.black),
                    ),

                    TextFormField(
                      controller: adresse,
                      decoration:  InputDecoration(
                          hintText:  widget.contact.domicile != null ? widget.contact.domicile : "domicile",
                          hintStyle: const TextStyle(color: Colors.blueAccent),
                          border: InputBorder.none
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),


          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
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
                    const Text("Lien",
                      style: TextStyle(fontSize: 17,
                          color: Colors.black),
                    ),

                    TextFormField(
                      controller: lien,
                      decoration:  InputDecoration(
                          hintText:  widget.contact.lien != null ? widget.contact.lien : "lien de parenté",
                          hintStyle: const TextStyle(color: Colors.blueAccent),
                          border: InputBorder.none
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          //°°°°°°°°°°°°°°°°°)))))))) Bouton supprimer = ====
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Container(
                margin: EdgeInsets.only(top: 10, bottom: 25),
                padding: EdgeInsets.only(bottom: 15),
                width: double.infinity,
                //padding: EdgeInsets.all(8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                   // backgroundColor: Color(0xFFDEE3E8),
                  ),
                  onPressed: () async{
                   await ContactServices.deleteContact(widget.contact.id);
                  },
                  child: const Text("Supprimer", style: TextStyle(color: Colors.red, fontSize: 20),),
                ),

              ),
            ),
          ),


        ],
      ),
    );
  }
}
