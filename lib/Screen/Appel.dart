import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urgence_projet/Screen/Accueil.dart';

class Appel extends StatelessWidget {
  const Appel({Key? key}) : super(key: key);

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


        title: const Text("Appel d'Urgence",
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
                  color: Color(0xFFDEE3E8),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            //pour le box contenant le text
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Container(
                height: MediaQuery.of(context).size.height * .12,
                decoration: const BoxDecoration(
                  color: Color(0xFFDEE3E8),
                ),
                child: const Center(
                  child:  Text("Appeler ou alerter un service de secours en partageant votre position",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                ),
              ),
            ),
            //fin ____________________________________________________________

            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            //les polices de secours==================================================
            Row(
              children: [
                //l'icon
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    padding: EdgeInsets.only(top: 20, left: 10),
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.red
                    ) ,

                  ),
                ),

                SizedBox(width: MediaQuery.of(context).size.width * .01,),

                // pour la police de secours =============================================
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

                              child: const Text("Police de secours", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)),
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


              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            //les Ambulances__________________________________________________________________
            Row(
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
                        color: Colors.blue
                    ) ,
                    child: Icon(Icons.emergency, color: Colors.white, size: 40,),
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
                          const Text("Ambulance", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
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


              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),

            //les Pompier===================================================================
            Row(
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
                        color: Colors.blue
                    ) ,
                    child: Icon(Icons.local_fire_department, color: Colors.red, size: 40,),
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
                          const Text("Pompier", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),


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


              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),

            //les Gendarmerie++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            Row(
              children: [
                //l'icon
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    padding: EdgeInsets.only(top: 20, left: 10),
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.red
                    ) ,
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
                          const Text("Gendarmerie", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

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


              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            //les Protection civile-----------------------------------------------------
            Row(
              children: [
                //l'icon
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    padding: EdgeInsets.only(top: 20, left: 10),
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.red
                    ) ,
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
                          const Text("Protection Civile", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

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


              ],
            )

          ],
        ),
      ),
    );
  }
}


