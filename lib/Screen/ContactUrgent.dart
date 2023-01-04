import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urgence_projet/Screen/Accueil.dart';
import 'package:urgence_projet/Screen/ContactAbout.dart';

class ContactUrgent extends StatefulWidget {
  const ContactUrgent({Key? key}) : super(key: key);

  @override
  State<ContactUrgent> createState() => _ContactUrgentState();
}

class _ContactUrgentState extends State<ContactUrgent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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


        title: const Text("Contact d'Urgence",
          style: TextStyle(fontSize: 24,
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
            Row(
              children: [

                SizedBox(width: MediaQuery.of(context).size.width * .01,),

                Container(
                  //padding: EdgeInsets.all(5),
                  child: Expanded(
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ContactAbout()));
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
                              Text("Police de secours", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                              //SizedBox(width: MediaQuery.of(context).size.width * .13,),

                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.call, color: Colors.red,),
                                      onPressed: (){},
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add_alert, color: Colors.red,),
                                      onPressed: (){},
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

          ],
        ),
      ),
    );
  }
}

