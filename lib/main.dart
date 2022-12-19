import 'package:flutter/material.dart';
import 'package:ths_web/auth_admin/auth.dart';
import 'package:ths_web/home.dart';
import 'package:ths_web/screens/Compte_tech.dart';
import 'package:ths_web/screens/Notifications.dart';
import 'package:ths_web/screens/dashboard.dart';
import 'package:ths_web/screens/rapport.dart';
import 'package:ths_web/screens/taches.dart';
import 'package:ths_web/splitScreen/splitcompte.dart';
import 'package:ths_web/splitScreen/splitdashboard.dart';
import 'package:ths_web/splitScreen/splitnotification.dart';
import 'package:ths_web/splitScreen/splitrapport.dart';
import 'package:ths_web/splitScreen/splittache.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplitViewRapport(),
           // home:MyHomePage(),

      routes: {
        '/dashboard': (context) => SplitViewdash(),
        '/rapport': (context) => SplitViewRapport(),
        '/Notification': (context) =>SplitViewNotification(),
        '/tache': (context) => SplitViewtache(),
        '/compte_tech': (context) => SplitViewcompte(),
        '/login': (context) => Auth_Admin(),
      },
    );
    
  }

}
