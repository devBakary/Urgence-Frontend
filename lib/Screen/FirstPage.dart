import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Connexions.dart';

import 'package:urgence_projet/Screen/Inscription.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          DefaultTabController(
            length: 2,
            child: Column(
              children:  [
                const TabBar(
                    indicatorColor: Colors.red,
                    indicatorWeight: 2,
                    unselectedLabelStyle: TextStyle(color: Colors.black),
                    unselectedLabelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(
                        icon: Icon(CupertinoIcons.home, color: Colors.blue,),
                        child: Text('Connexion', style: TextStyle(color: Colors.black),),
                      ),

                      Tab(
                        icon: Icon(CupertinoIcons.home, color: Colors.blue,),
                        child: Text('Inscription', style: TextStyle(color: Colors.black),),
                      ),
                    ]),
                Container(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height * .607,
                  child: const TabBarView(

                      children: [

                        Connexions(),
                        Inscription(),

                      ]),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
