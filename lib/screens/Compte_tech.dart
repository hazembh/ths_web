import 'package:flutter/material.dart';
import 'package:ths_web/widget/appbar.dart';
import 'package:ths_web/widget/comptetitle.dart';
import 'package:ths_web/widget/drawer.dart';

class Compte_Tech extends StatefulWidget {
  final bool b;

  Compte_Tech({required this.b});

  @override
  State<Compte_Tech> createState() => _Compte_TechState();
}

class _Compte_TechState extends State<Compte_Tech> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.grey[400],
          title: Titles(title: 'Les comptes de techniciens'),
          automaticallyImplyLeading: widget.b,
          actions: [
            AppBars(),
          ],
        ),
        drawer: widget.b ? Drawers(context: context) : null,
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              LigneWidget(
                  context: context,
                  mat: "Matricule",
                  nom: "Nom & Prénom",
                  cin: "CIN",
                  tel: "Téléphone",
                  color: Color.fromRGBO(101, 130, 218, 1), b: false,ontap: (){}),
              LigneWidget(
                  context: context,
                  mat: "548 TN 1256",
                  nom: "Hazem Bouaziz",
                  cin: "11117999",
                  tel: "28272203",
                  color: Colors.black, b: true, ontap: (){}),
                                LigneWidget(
                  context: context,
                  mat: "548 TN 1256",
                  nom: "Hazem Bouaziz",
                  cin: "11117999",
                  tel: "28272203",
                  color: Colors.black, b: true, ontap: (){}),
                                LigneWidget(
                  context: context,
                  mat: "548 TN 1256",
                  nom: "Hazem Bouaziz",
                  cin: "11117999",
                  tel: "28272203",
                  color: Colors.black, b: true, ontap: (){}),
                                LigneWidget(
                  context: context,
                  mat: "548 TN 1256",
                  nom: "Hazem Bouaziz",
                  cin: "11117999",
                  tel: "28272203",
                  color: Colors.black, b: true, ontap: (){}),
            ],
          ),
        ));
  }
}
