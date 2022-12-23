import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

SendMessage(BuildContext context,TextEditingController message) async{
  FocusScope.of(context).unfocus();
  FirebaseFirestore.instance.collection('Messages').add({
    'text': message.text.trim(),
    'createdAt': DateFormat('dd-MM-yyyy hh:mm').format(DateTime.now()),
  });

}



