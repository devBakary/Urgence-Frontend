import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urgence_projet/Screen/Affichage%20geste.dart';
import 'package:urgence_projet/Service/ContactService.dart';

import '../Modele/Contact_data.dart';
import '../Modele/mes gestes.dart';
import 'Accueil.dart';

class GesteSecours extends StatefulWidget {
  const GesteSecours({Key? key}) : super(key: key);

  @override
  State<GesteSecours> createState() => _GesteSecoursState();
}

class _GesteSecoursState extends State<GesteSecours> {

  List<Geste>? gestes;

  getGeste() async {
    gestes = await ContactServices.getGeste();
    Provider.of<ContactData>(context, listen: false).gestes = gestes!;
    setState(() {

    });
  }

  @override
  void initState(){
    super.initState();
    getGeste();
  }
  @override
  Widget build(BuildContext context) {
    return  gestes == null?
    const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    )

      :Scaffold(
      backgroundColor: Color(0xFFDEE3E8),
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(CupertinoIcons.back,
                size: 35,),

              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => Accueil()),);
              },
            );
          },
        ),


        title:  Text("Geste de Secours (${Provider.of<ContactData>(context).gestes.length})",
          style: const TextStyle(fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xFF0054E0),
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

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * .25,
              color: Colors.amber,
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * .05,
          ),

          Flexible(
            child: Consumer<ContactData>(
              builder: (context, contactData, child){
                return ListView.builder(
                  itemCount: contactData.gestes.length,
                  itemBuilder: (context, index){
                    Geste geste = contactData.gestes[index];
                    return GestesAffichage(
                      geste: geste,
                      contactData: contactData,
                    );
                  },
                );
              },
            ),
          ),

          /*Padding(
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
                      color: Colors.blue,
                    ),
                  ),

                  Container(
                      width: MediaQuery.of(context).size.width * .57,
                      child: const Text("le titre du geste",
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
          )*/
        ],
      ),
    );
  }
}
