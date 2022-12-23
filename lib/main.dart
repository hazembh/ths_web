import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ths_web/auth_admin/auth.dart';
import 'package:ths_web/home.dart';
import 'package:ths_web/screens/Compte_tech.dart';
import 'package:ths_web/screens/Notifications.dart';
import 'package:ths_web/screens/dashboard.dart';
import 'package:ths_web/screens/rapport.dart';
import 'package:ths_web/screens/taches.dart';
import 'package:ths_web/screens/test.dart';
import 'package:ths_web/splitScreen/splitcompte.dart';
import 'package:ths_web/splitScreen/splitdashboard.dart';
import 'package:ths_web/splitScreen/splitnotification.dart';
import 'package:ths_web/splitScreen/splitrapport.dart';
import 'package:ths_web/splitScreen/splittache.dart';


void main() async {

      WidgetsFlutterBinding.ensureInitialized();
  
    await Firebase.initializeApp(
        options: FirebaseOptions(
          apiKey: "AIzaSyB2yCWFb41zBmHOkyjBsRhlpI0uiT-bmos",
          projectId: "ths-61711",
          messagingSenderId: "684298211133",
          appId: "1:684298211133:web:d74b79b321d33b12ffbf54",
        )).catchError((e) {
            print(e);
          });

  


    

    runApp(MyApp());


}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:MyHomePage(),
      //home: SplitViewNotification(),

      routes: {
        '/dashboard': (context) => SplitViewdash(),
        '/rapport': (context) => SplitViewRapport(),
        '/Notification': (context) => SplitViewNotification(),
        '/tache': (context) => SplitViewtache(),
        '/compte_tech': (context) => SplitViewcompte(),
        '/login': (context) => Auth_Admin(),
      },
    );
  }
}
