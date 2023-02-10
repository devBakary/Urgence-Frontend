import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({Key? key}) : super(key: key);

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .40,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )
            ),

            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:  [
                        IconButton(
                          alignment: AlignmentDirectional.topEnd,
                            onPressed: (){null;},
                            icon: Icon(Icons.settings, color: Colors.white, size: 32,))
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
                const Text("Username", style: TextStyle(fontSize: 28),)
                
              ],
            ),
          ),

          SizedBox(
          height : MediaQuery.of(context).size.height * .02,
          ),


          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(CupertinoIcons.mail_solid, size: 34,),
                title: Text('Email', style: TextStyle(fontSize: 24),),
                subtitle: Text('Here is a second line'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
          ),

          SizedBox(
            height : MediaQuery.of(context).size.height * .02,
          ),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(CupertinoIcons.location, size: 34,),
                title: Text('Domicile', style: TextStyle(fontSize: 24),),
                subtitle: Text('Here is a second line'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
          ),

          SizedBox(
            height : MediaQuery.of(context).size.height * .02,
          ),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.call_rounded, size: 34,),
                title: Text('Contact', style: TextStyle(fontSize: 24),),
                subtitle: Text('Here is a second line'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
