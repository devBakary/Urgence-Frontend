import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              onPressed: () { Scaffold.of(context).openDrawer(); },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),


        title: const Text("Ma fiche",
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
            //pour la barre de recherche
            Padding(
              padding: EdgeInsets.only( top: 30),
              child: Container(
                height: MediaQuery.of(context).size.height * .08,
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            //pour le box contenant le text
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Container(
                height: MediaQuery.of(context).size.height * .12,
                decoration: BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            //fin _______________________________________________ _____________

            //pour ajpouter le bouton
            Container(
              child: Center(
                child: ElevatedButton(
                  onPressed: (){},
                  child: Text("Ajouter"),
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


              ],
            ),

          ],
        ),
      ),
    );
  }
}

