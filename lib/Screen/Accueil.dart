import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Accueil extends StatelessWidget {
   Accueil({Key? key}) : super(key: key);

  List<String> images = [
        "assets/images/urgSplash.jpg"
        "assets/images/urgSplash.jpg"
        "assets/images/urgSplash.jpg"
        "assets/images/urgSplash.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

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
                onPressed: (){ },
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
                        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                        children: [
                          Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.red
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.red
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.red
                            ),
                          ),

                        ]
                      ),
                  ),
                ),
            ],
          ),
        ),
    );
  }
}



