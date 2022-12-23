import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ShowDialogWidget({required String title,required bool test,required String para, }){
  return AlertDialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)),
    title: test?Icon(
      Icons.check_circle,
      color: Colors.green[600],
      size: 130,
    ):  Center(child: CircularProgressIndicator(color: Colors.black)),
    content: SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            para,
            style: TextStyle(fontSize: 18, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 70,
          ),
        ],
      ),
    ),
  );
}


ShowMyDialog2(BuildContext context) async {
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return ShowDialogWidget(
              para: 'Votre message est envoyé avec succés', title: 'Congratulations', test: true);
        });
      });
}