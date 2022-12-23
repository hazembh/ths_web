import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    late UserCredential userCredential;
    return Container(

      child: RaisedButton(onPressed: ()async {
        /*userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: 'hazembouaziz@supcom.tn', password: '123456');*/
        final FirebaseAuth _auth = FirebaseAuth.instance;
          _auth.createUserWithEmailAndPassword(
            email:"hazem123@supcom.com",
            password: "SuperSecretPassword!",
          ).catchError((e) {
            print(e);
          });
        }
      ,child: Text('test'),),
    );
  }
}
