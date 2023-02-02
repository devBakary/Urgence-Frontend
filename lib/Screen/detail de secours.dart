import 'package:flutter/material.dart';

class DetailsGeste extends StatefulWidget {
  const DetailsGeste({Key? key}) : super(key: key);

  @override
  State<DetailsGeste> createState() => _DetailsGesteState();
}

class _DetailsGesteState extends State<DetailsGeste> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDEE3E8),
      appBar: AppBar(
        title:  const Text("Geste de Secours ",
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
                image: const DecorationImage(
                    image: AssetImage("assets/images/b.jpg"),
                    fit: BoxFit.cover
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
                decoration:  BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(12)
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
