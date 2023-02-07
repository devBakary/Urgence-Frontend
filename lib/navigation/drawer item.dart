import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key, required this.name, required this.icon, required this.onPressed}) : super(key: key);

  final String name;
  final IconData icon;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 40,
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 15, top: 10),
              child: Row(
                children: [
                  Icon(icon, size: 28, color: Colors.blue,),
                  const SizedBox(width: 10,),
                  Text(name, style: const TextStyle(fontSize: 26, color: Colors.blue, fontWeight: FontWeight.w500),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
