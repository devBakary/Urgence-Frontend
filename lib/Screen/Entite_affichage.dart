import 'package:flutter/material.dart';
import 'package:urgence_projet/Modele/Contact_data.dart';
import 'package:urgence_projet/Modele/Entite.dart';

class EntiteAffichage extends StatelessWidget {
  final Entite entite;
  final ContactData contactData;

  const EntiteAffichage({Key? key, required this.entite, required this.contactData}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(

      child: Row(
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
                     Text(entite.nom, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),

                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.call, color: Colors.red,),
                            onPressed: (){},
                          ),
                          IconButton(
                            icon: const Icon(Icons.add_alert, color: Colors.red,),
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

    );
  }
}
