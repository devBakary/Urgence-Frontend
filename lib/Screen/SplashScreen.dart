import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:urgence_projet/Screen/Connexions.dart';
import 'package:urgence_projet/Screen/FirstPage.dart';

import 'Accueil.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 4)).then((value) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (context) =>  Connexions()));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: Image.asset("assets/images/loggo.png", width: 200,
            )
        ),
      ),
    );
  }
}

