import 'package:flutter/material.dart';
import 'package:ths_web/widget/appbar.dart';
import 'package:ths_web/widget/cardwidget%20copy.dart';
import 'package:ths_web/widget/drawer.dart';
import 'package:ths_web/widget/rapportcontentWidget.dart';

class Rapport extends StatefulWidget {
  final bool b;

  Rapport({required this.b});

  @override
  State<Rapport> createState() => _RapportState();
}

class _RapportState extends State<Rapport> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey[400],
        title: Titles(title: 'Les Rapports'),
        automaticallyImplyLeading: widget.b,
        actions: [
          AppBars(),
        ],
      ),
      drawer: widget.b ? Drawers(context) : null,
      body: Center(
        child: CardWidget(
          h: size.height * 0.75,
          w: size.width * 0.75,
          context: context,
          title: 'Listes des techniciens',
          widget: Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFieldContent(
                        text: 'Rechercher',
                        icon: Icons.search,
                        context: context),
                    InkWell(
                      onTap: () {
                        print("hello");
                      },
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.date_range)),
                          Container(
                            child: Center(
                                child: Text(
                              'choisir une date',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              textAlign: TextAlign.center,
                            )),
                            width: size.width * 0.2,
                            height: 45,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade500,
                                      spreadRadius: 0.5,
                                      blurRadius: 5)
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                    bottom: Radius.circular(5),
                                    top: Radius.circular(5))),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Carddescrapport(
                      context: context,
                      text: 'Hazem Bouaziz',
                      widget: Expanded(
                          child: Column(
                        children: [
                          CardContent(context: context),
                          CardContent(context: context),
                        ],
                      ))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
