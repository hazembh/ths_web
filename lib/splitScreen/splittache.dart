
import 'package:flutter/material.dart';
import 'package:ths_web/screens/Compte_tech.dart';
import 'package:ths_web/screens/Notifications.dart';
import 'package:ths_web/screens/dashboard.dart';
import 'package:ths_web/screens/rapport.dart';
import 'package:ths_web/screens/taches.dart';
import 'package:ths_web/widget/drawer.dart';

class SplitViewtache extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    const breakpoint = 900.0;
    if (screenWidth >= breakpoint) {
      return 
      Row(
        children: [
          SizedBox(
            width: screenWidth*0.2,
            child: Drawers(context),
          ),
          Expanded(
            child:Tache(b: false,),
          ),
        ],
      );
    } else {
      return Scaffold(
        body: Tache(b:true),
        drawer: SizedBox(
          width: screenWidth*0.5,
          child: Drawer(child: Drawers(context),),
        ),
      );
    }
  }

}