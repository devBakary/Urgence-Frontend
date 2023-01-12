import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urgence_projet/Screen/About.dart';
import 'package:urgence_projet/Screen/Appel.dart';
import 'package:urgence_projet/Screen/Connexion.dart';
import 'package:urgence_projet/Screen/ContactUrgent.dart';
import 'package:urgence_projet/Screen/Inscription.dart';
import 'package:urgence_projet/Screen/MaFiche.dart';
import 'package:urgence_projet/Screen/PageAide.dart';

class Accueil extends StatelessWidget {
   Accueil({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          leading: Builder(
            builder: (BuildContext context) {
              return Container();

            },
          ),

          title: const Text("URGENCE MALI",
            style: TextStyle(fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),

          actions: <Widget>[
            // Premier bouton - decrémente
            Container(
              padding: EdgeInsets.only(right: 15),
              child: IconButton(
                icon: Icon(Icons.menu),
                iconSize: 35,
                alignment: Alignment.center,
                onPressed: (){
                  showDialogWidget(context);
                },
              )
            ),

          ],
          centerTitle: true,
          backgroundColor: Color(0xFFD42125),
        ),

        body: Container(

          child: Column(
            children:  [
              Container(
                color: Colors.green,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .25,
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
                                Navigator.of(context).push(MaterialPageRoute(builder: (_) =>ContactUrgent()));
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

              DefaultTabController(
                  length: 2,
                  child: Column(
                        children:  [
                          const TabBar(
                            indicatorColor: Colors.red,
                              indicatorWeight: 2,
                              unselectedLabelStyle: TextStyle(color: Colors.black),
                              unselectedLabelColor: Colors.black,
                              indicatorSize: TabBarIndicatorSize.tab,
                              tabs: [
                            Tab(
                              icon: Icon(CupertinoIcons.home, color: Colors.blue,),
                              child: Text('Connexion', style: TextStyle(color: Colors.black),),
                            ),

                            Tab(
                              icon: Icon(CupertinoIcons.home, color: Colors.blue,),
                              child: Text('Inscription', style: TextStyle(color: Colors.black),),
                            ),
                          ]),
                            Container(
                              width: double.maxFinite,
                              height: MediaQuery.of(context).size.height * .607,
                              child: const TabBarView(

                                  children: [

                                    Connexion(),
                                    Inscription(),

                              ]),
                            ),

                        ],
                      ),
                  ),
            ],
          ),

    );
  }
  );
}




