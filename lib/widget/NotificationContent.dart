import 'package:flutter/material.dart';

Widget ContentNotifcationCard({
  required String date,
  required String nom,
  required String idclient,
  required String action,
  required bool b,
  required String cin,
  required Function check,
  required Function delete,
}) {
  return Column(
    children: [
      SizedBox(
        height: 10,
      ),
      Container(
        width: 165,
        height: 76,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black, spreadRadius: 0.2, blurRadius: 4)
          ],
          color: Colors.white,
        ),
        child: b
            ? Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        child: Center(
                          child: Text(
                            "$nom a $action  un RDV avec $idclient le $date ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 140,
                        child: Column(
                          children: [
                            Text(
                              "Compte a été crée sous le nom $nom,$cin",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Text(
                                  '$date',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    iconSize: 15,
                                    onPressed: () {
                                      check();
                                    },
                                    icon: Icon(
                                      Icons.check,
                                      color: Colors.green,
                                    )),
                                IconButton(
                                    iconSize: 15,
                                    onPressed: () {
                                      delete();
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    ],
  );
}
