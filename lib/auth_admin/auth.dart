import 'package:flutter/material.dart';

class Auth_Admin extends StatefulWidget {
  const Auth_Admin({Key? key}) : super(key: key);

  @override
  State<Auth_Admin> createState() => _Auth_AdminState();
}

class _Auth_AdminState extends State<Auth_Admin> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Container(
              height: size.height,
            ),
            Positioned(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: size.width * 0.33,
                    height: size.height,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(167, 167, 183, 0.45),
                    ),
                  ),
                ],
              ), // Required some widget in between to float AppBar,
            ), // Required some widget in between to float AppBar
            Container(
              height: size.height,
              //width:size.width*0.33,
              //color:Colors.white,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: size.height,
                  ),
                  Positioned(
                    top: size.height * 0.15,
                    left: size.width * 0.52,
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height * 0.05,
                            ),
                            Text(
                              'Connexion',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: size.height * 0.1,
                                  right: size.width * 0.21),
                              child: Text(
                                'E-mail',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: size.width * 0.01,
                                  left: size.width * 0.03,
                                  right: size.width * 0.03),
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  hintText: 'Saisir votre adresse email',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: size.height * 0.03,
                                  right: size.width * 0.18),
                              child: Text(
                                'Mot de passe',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: size.width * 0.01,
                                  left: size.width * 0.03,
                                  right: size.width * 0.03),
                              child: TextField(
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.lock),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  hintText: 'Saisir votre mot de passe',
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: size.height * 0.08),
                              child: Container(
                                width: size.width * 0.24,
                                height: 40,
                                child: RaisedButton(
                                  onPressed: () {Navigator.pushNamed(context, '/dashboard');},
                                  color: Color.fromRGBO(0, 36, 147, 0.75),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Text(
                                    'Se connecter',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      width: size.width * 0.3,
                      height: size.height * 0.7,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade500,
                                spreadRadius: 0.5,
                                blurRadius: 15)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(20),
                              top: Radius.circular(20))),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.2, top: size.height * 0.25),
                    child: Image.asset('assets/logoTHS.png',width: size.width*0.2,),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          left: size.width * 0.17, top: size.height * 0.55),
                      child: Container(
                        width: size.width * 0.25,
                        child: Text(
                          "Connectez-vous à l'espace administrateur",
                          style: TextStyle(
                              color: Color.fromRGBO(0, 36, 147, 1),
                              fontSize: size.width*0.018,
                              fontWeight: FontWeight.bold),textAlign: TextAlign.center,
                        ),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}
