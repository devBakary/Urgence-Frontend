import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urgence_projet/Screen/Accueil.dart';
import 'package:urgence_projet/Screen/Connexions.dart';
import 'package:urgence_projet/Service/UserService.dart';
import 'package:urgence_projet/global.dart';

import '../Modele/Contact_data.dart';
import '../Modele/User.dart';
import 'Password/Mot de passe oublié.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  List<Users>? users;

  var uAdresse;
  var uNumero ;
  var uEmail;
  var uUsername;

  logout()async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('id');
  }
  Future init() async {
    final prefs = await SharedPreferences.getInstance();
    uAdresse = prefs.getString('adresse')!;
    uNumero = prefs.getInt('numero').toString();
    uEmail = prefs.getString('email')!;
    uUsername = prefs.getString('username')!;
    setState(() {

      });
    }

  getUser() async{
    users = await UserService.getContact(usID);
    Provider.of<ContactData>(context, listen: false).users = users!;
    init();
    setState(() { });
  }

  var us = usernames;
  @override
  void initState(){
    super.initState();
    getUser();
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .40,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF0054E0),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )
            ),

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35, right: 15, left: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        ClipOval(
                          child: Container(
                            color: Colors.white,
                            child: IconButton(
                              alignment: AlignmentDirectional.topEnd,
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>Accueil()));
                                },
                              icon: Icon(CupertinoIcons.reply_thick_solid, color: Colors.black, size: 28,),
                            ),
                          ),
                        ),

                        IconButton(
                          alignment: AlignmentDirectional.topEnd,
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>Reenitialisation()));
                            },
                            icon: Icon(Icons.settings, color: Colors.white, size: 32,),
                        ),

                      ],
                    ),
                ),

                Container(
                  height: 140,
                  width: 160,
                  child: const CircleAvatar(
                    radius: 40,
                  ),
                ),

                SizedBox(height: 10,),
                 Text( '${uUsername}',
                    style: TextStyle(fontSize: 28),)
                
              ],
            ),
          ),

          SizedBox(
          height : MediaQuery.of(context).size.height * .015,
          ),


           Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(CupertinoIcons.mail_solid, size: 34,),
                title: const Text('Email', style: TextStyle(fontSize: 24),),
                subtitle: Text(uEmail),
                trailing: Icon(Icons.more_vert),
              ),
            ),
          ),

          SizedBox(
            height : MediaQuery.of(context).size.height * .015,
          ),

           Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(CupertinoIcons.location, size: 34,),
                title: const Text('Domicile', style: TextStyle(fontSize: 24),),
                subtitle: Text(uAdresse),
                trailing: Icon(Icons.more_vert),
              ),
            ),
          ),

          SizedBox(
            height : MediaQuery.of(context).size.height * .015,
          ),

           Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: ListTile(
                leading: const Icon(Icons.call_rounded, size: 34,),
                title: const Text('Contact', style: TextStyle(fontSize: 24),),
                subtitle: Text(uNumero),
                trailing: Icon(Icons.more_vert),
              ),
            ),
          ),

          SizedBox(
            height : MediaQuery.of(context).size.height * .015,
          ),


           Padding(
            padding: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                await prefs.remove('id');
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>Connexions()), (route) => false);
              },
              child: const Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.logout, size: 34,),
                  title: Text('Deconnection', style: TextStyle(fontSize: 24, color: Colors.red),),

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
