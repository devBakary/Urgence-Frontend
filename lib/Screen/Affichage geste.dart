import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urgence_projet/Modele/Contact_data.dart';

import '../Modele/mes gestes.dart';

class GestesAffichage extends StatelessWidget {
  const GestesAffichage({Key? key, required this.geste, required this.contactData}) : super(key: key);

  final Geste geste;
  final ContactData contactData;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * .12,
        decoration:  BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 15,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),

            //image
            Padding(
              padding: const EdgeInsets.all(3),
              child: Container(
                width: 80,
                decoration:  BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/${geste.img1}"),
                      fit: BoxFit.fill),
                )

              ),
              ),


            Container(
                width: MediaQuery.of(context).size.width * .57,
                child:  Text(geste.nom,
                  style: TextStyle(fontSize: 18),
                )
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 200,

                  decoration:  BoxDecoration(
                    border: Border.all(color: Color(0xFF85B6FF), width: 2),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                      child: Icon(CupertinoIcons.right_chevron,
                          size: 24,
                          color: Color(0xFF85B6FF)
                      )
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
