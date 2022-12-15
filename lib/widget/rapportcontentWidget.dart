import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

Widget TextFieldContent(
    {required String text,
    required IconData icon,
    required BuildContext context}) {
  var size = MediaQuery.of(context).size;
  return Container(
    width: size.width * 0.2,
    child: TextField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: Icon(icon),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        hintText: 'Rechercher',
      ),
    ),
  );
}

Widget Carddescrapport({required BuildContext context,required String text,required Widget widget}) {
  bool? _expanded2;
  var size = MediaQuery.of(context).size;
  return Container(
    width: size.width*0.43,
    child: Card(
      clipBehavior: Clip.hardEdge,
      child: ExpansionWidget(
          onSaveState: (value) => _expanded2 = value,
          onRestoreState: () => _expanded2,
          duration: const Duration(milliseconds: 300),
          titleBuilder: (_, double easeInValue, bool isExpaned, toogleFunction) {
            return Material(
              color: Colors.white,
              child: InkWell(
                  onTap: () => toogleFunction(animated: true),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 45,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.account_circle),
                              ),
                              Text(text),
                            ],
                          ),
                        )
                      ),
                      Transform.rotate(
                        angle: math.pi * (easeInValue + 0.5),
                        child: Padding(
                          padding: const EdgeInsets.only(left:8.0),
                          child: Icon(Icons.arrow_back_ios,
                              size: 30, color: Colors.black),
                        ),
                        alignment: Alignment.center,
                      )
                    ],
                  )),
            );
          },
          content: Container(
            width: double.infinity,
            color: Colors.white,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    widget,
                  ],
                ),
              ],
            ),
          )),
    ),
  );
}
