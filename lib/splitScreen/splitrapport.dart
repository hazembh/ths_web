
import 'package:flutter/material.dart';
import 'package:ths_web/screens/Compte_tech.dart';
import 'package:ths_web/screens/Notifications.dart';
import 'package:ths_web/screens/dashboard.dart';
import 'package:ths_web/screens/rapport.dart';
import 'package:ths_web/widget/drawer.dart';

class SplitViewRapport extends StatelessWidget {
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
            child: Drawers(context: context),
          ),
          Expanded(
            child:Rapport(b: false,),
          ),
        ],
      );
    } else {
      return Scaffold(
        body: Rapport(b:true),
        drawer: SizedBox(
          width: screenWidth*0.5,
          child: Drawer(child: Drawers(context: context),),
        ),
      );
    }
  }

}