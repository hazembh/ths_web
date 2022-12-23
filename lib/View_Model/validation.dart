
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ths_web/auth_admin/auth.dart';

import 'condition.dart';

var data = SnackViewModel();
//Validation and login for the sign in
void validation(BuildContext context, TextEditingController email,
    TextEditingController password, fct) {
  var c1 = email.text.trim().isEmpty;
  var c2 = password.text.trim().isEmpty;

  if ((c1) && (c2)) {
    (ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Snack(text: data.field, context: context))));
    return;
  }
  if (c1) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        backgroundColor: Colors.red,
        content: Snack(text: data.email, context: context)));
    return;
  } else if (!RegExp(data.logic).hasMatch(email.text)) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        backgroundColor: Colors.red,
        content: Snack(text: data.Validemail, context: context)));
  } else if (c2) {
    // ignore: deprecated_member_use
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
        backgroundColor: Colors.red,
        content: Snack(text: data.pwd, context: context)));
    return;
  } else {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => Alert(context: context));
    fct;
  }
}


Widget Alert({required BuildContext context}) {
  var size = MediaQuery.of(context).size;

  return SimpleDialog(
      backgroundColor:Colors.white,
      title: Center(
          child: Column(
            children: [
              SizedBox(
                height: size.height*0.1,
              ),
              Container(width: size.width * 0.3,height: size.height * 0.3, child: Text(data.wait,style:TextStyle(fontSize: 20),textAlign: TextAlign.center,)),
              CircularProgressIndicator(
                color: Colors.black,
              ),
              SizedBox(
                height: size.height*0.1,
              ),
            ],
          )));
}

