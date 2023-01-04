import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urgence_projet/Screen/Accueil.dart';

class MaFiche extends StatefulWidget {
  const MaFiche({Key? key}) : super(key: key);

  @override
  State<MaFiche> createState() => _MaFicheState();
}

class _MaFicheState extends State<MaFiche> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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


          title: const Text("Ma fiche",
          style: TextStyle(fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white),
          ),
          elevation: 0,

          actions: <Widget>[
          // Premier bouton
          InkWell(

           child:  Container(

               padding: const EdgeInsets.only( top: 15, right: 20),
               child: const Text("Ok", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center,)
           ),
          ),

        ],
          centerTitle: true,
          backgroundColor: Color(0xFF0054E0),
      ),
      body: Column(

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
              children: const [
                Center(
                  child: Icon(CupertinoIcons.person_crop_circle_fill, size: 90, color: Colors.white,),
                ),

                Text("Bakary Diakite",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
            ),
          ),


          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),

          //les infos
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
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
                            const Text("Portable",
                              style: TextStyle(fontSize: 17,
                                  color: Colors.black),
                            ),

                            TextFormField(
                              decoration: const InputDecoration(
                                  hintText: '90675432',
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
                            const Text("Anniversaire",
                              style: TextStyle(fontSize: 17,
                                  color: Colors.black),
                            ),

                            TextFormField(
                              decoration: const InputDecoration(
                                  hintText: '20 Novembre',
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
                            const Text("Domicile",
                              style: TextStyle(fontSize: 17,
                                  color: Colors.black),
                            ),

                            TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'Kalaban',
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
                            const Text("Domicile",
                              style: TextStyle(fontSize: 17,
                                  color: Colors.black),
                            ),

                            TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'Kalaban',
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
                            const Text("Domicile",
                              style: TextStyle(fontSize: 17,
                                  color: Colors.black),
                            ),

                            TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'Kalaban',
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
                            const Text("Domicile",
                              style: TextStyle(fontSize: 17,
                                  color: Colors.black),
                            ),

                            TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'Kalaban',
                                  hintStyle: TextStyle(color: Colors.blueAccent),
                                  border: InputBorder.none
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],

      ),
    );
  }
}