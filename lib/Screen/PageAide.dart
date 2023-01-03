import 'package:flutter/material.dart';

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


                    ],
                  ),
                )
            ),
          ],
        )

    );
  }
}


