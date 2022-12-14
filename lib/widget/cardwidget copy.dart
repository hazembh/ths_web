import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget CardWidget(
    {required BuildContext context,
    required Widget widget,
    required String title,
    required double w,
    required double h}) {
  final size = MediaQuery.of(context).size;
  return Container(
    child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(101, 130, 218, 1)),
          ),
          widget,

        ],
      ),
    ),
    width: w,
    height: h,
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade500, spreadRadius: 0.5, blurRadius: 5)
        ],
        color: Color.fromRGBO(249, 249, 249, 1),
        borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), top: Radius.circular(20))),
  );
}

Widget ContentWidgetCard() {
  return Column(
    children: [
      SizedBox(
        height: 10,
      ),
      Container(
        width: 220,
        height: 90,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black, spreadRadius: 0.2, blurRadius: 4)
          ],
          color: Colors.white,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Technicien 1',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Container(
                    width: 55,
                    child: Text(
                      'B2C_2201_CHT_097',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[500]),
                    )),
                Text('31500079',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500])),
                Text('02/11/2022 08:30', style: TextStyle(fontSize: 8)),
              ],
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(167, 167, 183, 0.15),
                  border: Border(
                    top: BorderSide(
                        width: 2, color: Color.fromRGBO(167, 167, 183, 0.5)),
                    bottom: BorderSide(
                        width: 2, color: Color.fromRGBO(167, 167, 183, 0.5)),
                    left: BorderSide(
                        width: 2, color: Color.fromRGBO(167, 167, 183, 0.5)),
                    right: BorderSide(
                        width: 2, color: Color.fromRGBO(167, 167, 183, 0.5)),
                  ),
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(5), top: Radius.circular(5))),
              width: 130,
              height: 70,
              child: Center(child: Text('Commentaire')),
            )
          ],
        ),
      ),
    ],
  );
}
