import 'dart:io';
import 'dart:ui';
import 'dart:math' as math;
import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ths_web/widget/appbar.dart';
import 'package:ths_web/widget/cardwidget.dart';
import 'package:ths_web/widget/drawer.dart';

class Dashboard extends StatefulWidget {
  final bool b;
  Dashboard({required this.b});
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey[400],
        title: Titles(title: 'Acceuil'),
        automaticallyImplyLeading: widget.b,
        actions: [
          AppBars(),
        ],
      ),
      drawer: widget.b ? Drawers(context) : null,
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: size.width * 0.015, left: size.width * 0.012),
                child: Text(
                  'Tableau de board',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
                top: size.width * 0.015, left: size.width * 0.012),
            child: Row(
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.date_range)),
                Container(
                  child: Center(
                      child: Text(
                    'choisir une date',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                    textAlign: TextAlign.center,
                  )),
                  width: 140,
                  height: 25,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade500,
                            spreadRadius: 0.5,
                            blurRadius: 5)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(5), top: Radius.circular(5))),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 220),
                    child: Row(
                      children: [
                        CardWidget(
                            context: context,
                            w: 250,
                            h: size.height * 0.75,
                            title: "Listes des demandes Traités",
                            widget: Column(
                              children: [
                                ContentWidgetCard(),
                                ContentWidgetCard(),
                                ContentWidgetCard(),
                                ContentWidgetCard(),
                              ],
                            )),
                        SizedBox(
                          width: size.height * 0.03,
                        ),
                        Column(
                          children: [
                            CardWidget(
                                context: context,
                                w: 250,
                                h: size.height * 0.36,
                                title: "Interventions Annulées",
                                widget: Column(
                                  children: [
                                    ContentWidgetCard(),
                                    ContentWidgetCard(),
                                  ],
                                )),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            CardWidget(
                                context: context,
                                w: 250,
                                h: size.height * 0.36,
                                title: "Interventions interrempus",
                                widget: Column(
                                  children: [],
                                )),
                          ],
                        ),
                        SizedBox(
                          width: size.height * 0.03,
                        ),
                        Column(
                          children: [
                            CardWidget(
                                context: context,
                                w: 250,
                                h: size.height * 0.36,
                                title: "Interventions Reportées",
                                widget: Column(
                                  children: [
                                    ContentWidgetCard(),
                                  ],
                                )),
                            SizedBox(
                              height: size.height * 0.03,
                            ),
                            CardWidget(
                                context: context,
                                w: 250,
                                h: size.height * 0.36,
                                title: "Interventions Ratées",
                                widget: Column(
                                  children: [
                                    ContentWidgetCard(),
                                    ContentWidgetCard(),
                                    ContentWidgetCard(),
                                    ContentWidgetCard(),
                                    ContentWidgetCard(),
                                    ContentWidgetCard(),
                                  ],
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
