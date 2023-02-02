import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urgence_projet/Screen/video.dart';
import 'package:video_player/video_player.dart';
//import 'package:video_player/video_player.dart';

class Aide extends StatelessWidget {
  const Aide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: const Text("Aide",
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

            Container(
              height: 40,
              decoration: const BoxDecoration(
                  color: Color(0xFF0054E0),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40)
                  )
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * .06,),

            Expanded(
                child: Container(

                  decoration: const BoxDecoration(
                      color: Color(0xFFDEE3E8),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(45),
                          topLeft: Radius.circular(45)
                      )
                  ),


                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),

                        child: Container(
                          margin: const EdgeInsets.only(top: 40),
                          padding: EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height * .18,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: const Text(
                            "Nous vous proposons de suivre ces tutoriels bien expliqués en langue nationaale pour vous "
                                "aider au mieux a utiliser application",
                            style: TextStyle(
                                fontSize: 20
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          padding: EdgeInsets.all(10),

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white
                          ),
                          child: Row(
                            children:  [
                              Icon(CupertinoIcons.question_circle, size: 26, color: Color(0xFF0054E0),),

                              SizedBox(width: 4,),

                              Text("Lire une video", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),

                              Expanded(
                                  child: IconButton(
                                      alignment: Alignment.centerRight,
                                      onPressed: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>VideoPlayerScreen()));
                                      },
                                      icon: Icon(CupertinoIcons.right_chevron, size: 24, color: Color(0xFF0054E0))
                                  )
                              )
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                )
            ),
          ],
        )

    );
  }
}

