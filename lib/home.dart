import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ths_web/auth_admin/auth.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimatedSplashScreen(
      duration: 3000,
      splashIconSize: size.width*1.5,
      splash: Image.asset('assets/logoTHS.png',),
      nextScreen:Auth_Admin(),
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}