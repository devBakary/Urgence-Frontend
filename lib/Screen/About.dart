import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urgence_projet/Screen/PageAide.dart';

class Apropos extends StatelessWidget {
  const Apropos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("A propos",
          style: TextStyle(fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0054E0),
        elevation: 0,
      ),

      body: Column(
        children: [
          //le box pour les contacts ===================
          Container(
            height: MediaQuery.of(context).size.height * .2,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .2 - 50,
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
                          Container(
                            child: const Text("Nous Contacter",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
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
          //la fin du box===============================

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
              
              child: Column(

                children: [

                  // premier box
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 50),
                    //height: MediaQuery.of(context).size.height * .20,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ),
                    child: const Text("Urgence est une application complètement gratuite à la disposition du public "
                        "pour leur permettre d’appeler les numéros vert ou une personne en toute urgence sans "
                        "savoir lire ou écrire du moins.", style: TextStyle(fontSize: 20),),
                  ),
                  //======fin=====================

                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),

                Container(
                padding: EdgeInsets.all(10),

                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white
                  ),
                  child: Row(
                    children:  [
                      Icon(CupertinoIcons.question_circle, size: 26, color: Color(0xFF0054E0),),

                      SizedBox(width: 4,),

                      Text("Aide", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                      Expanded(
                          child: IconButton(
                            alignment: Alignment.centerRight,
                              onPressed: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Aide()));
                              },
                              icon: Icon(CupertinoIcons.right_chevron, size: 24, color: Color(0xFF0054E0))
                          )
                      )
                    ],
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
