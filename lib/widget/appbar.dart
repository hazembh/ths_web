import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget AppBars (){
  return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.account_circle,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:10),
                    child: Text('admin@admin.com',
                        style: TextStyle(color: Colors.black)),
                  ),
                ],
              )
            ],
          );
}


Widget Titles ({required String title}){
  return  Container(
          padding: EdgeInsets.only(
            bottom: 2, // Space between underline and text
          ),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
            color: Color.fromRGBO(0, 36, 147, 0.5),
            width: 4.0, // Underline thickness
          ))),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        );
}