import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:urgence_projet/Modele/Contact_data.dart';
import 'package:urgence_projet/Screen/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ContactData>(
        create: (context) => ContactData(),
      child:  const MaterialApp(
        title: 'Urgence Mali',
       debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}