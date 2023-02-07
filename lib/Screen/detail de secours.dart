import 'package:flutter/material.dart';
import 'package:urgence_projet/Modele/mes%20gestes.dart';

class DetailsGeste extends StatefulWidget {
  const DetailsGeste({Key? key, required this.geste}) : super(key: key);

  final Geste geste;

  @override
  State<DetailsGeste> createState() => _DetailsGesteState();
}

class _DetailsGesteState extends State<DetailsGeste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDEE3E8),
      appBar: AppBar(
        title:   Text(widget.geste.nom,
          style: TextStyle(fontSize: 24,
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
              height: MediaQuery.of(context).size.height * .3,
              decoration:  BoxDecoration(
                image:  DecorationImage(
                    image: AssetImage("assets/images/${widget.geste.img2}"),
                    fit: BoxFit.fill
                ),
              borderRadius: BorderRadius.circular(12)
              ),
            ),
          ),


          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * .3,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),
                decoration:  BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.geste.nom, style: TextStyle(fontSize: 28),),
                    const Divider(
                      height: 5,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Text(widget.geste.description, style: TextStyle(fontSize: 20)),

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
