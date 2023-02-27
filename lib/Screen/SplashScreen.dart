import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:urgence_projet/Screen/Connexions.dart';
import 'package:urgence_projet/Screen/FirstPage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (context) =>  acc()));
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              //height: 400,
              child: Image.asset("assets/images/loggo.png", width: 320,
              ),
            ),
            SizedBox(height: 30,),
            const Text("Soyez un acteur" , style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
           const SpinKitSpinningLines(
              color: Colors.red,
              size: 80.0
            )
          ],
        ),
      ),
    );
  }


}
class acc extends StatelessWidget {
  const acc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8),
      child: Center(
        child: IntroductionScreen(
          showSkipButton: true,
          next: Icon(Icons.arrow_forward),
          skip: const Text("passer"),
          done: const Text("Terminer"),
          onDone: (){
            Navigator.of(context).pushReplacement(
                CupertinoPageRoute(builder: (context) => Connexions()));
          },

          pages: [
            PageViewModel(
              title: "",
              body: "Sauver des vies grâce à une application? c'est possible même sans formation !",
              decoration: const PageDecoration(
                imageAlignment: Alignment.bottomCenter,
                bodyAlignment: Alignment.bottomCenter,
                imageFlex: 2,
                bodyTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
              ),
              image: const SpinKitPumpingHeart(
                      color: Colors.red,
                      size: 180
              ),
            ),

            PageViewModel(
              title: "",
              body: "Appeler un service ou contact d'urgence en cas de situation!",
              decoration: const PageDecoration(
                  imageAlignment: Alignment.bottomCenter,
                  bodyAlignment: Alignment.bottomCenter,
                  imageFlex: 2,
                  bodyTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
              ),
              image: Container(
                  color: Colors.red,
                  child: Image.asset("assets/images/loggo.png")),
            ),

            PageViewModel(
              title: "",
              body: "Sauvez votre vie ou celle d'une autre en un clic !",
              decoration: const PageDecoration(
                  imageAlignment: Alignment.bottomCenter,
                  bodyAlignment: Alignment.bottomCenter,
                  imageFlex: 2,
                  bodyTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue)
              ),
              image: Container(
                  color: Colors.red,
                  child: Image.asset("assets/images/loggo.png")),
            ),
          ],
        ),
      ),
    );
  }
}


