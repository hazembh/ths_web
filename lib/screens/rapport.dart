import 'package:flutter/material.dart';
import 'package:ths_web/widget/appbar.dart';
import 'package:ths_web/widget/drawer.dart';

class Rapport extends StatefulWidget {
    final bool b;

  Rapport({required this.b});



  @override
  State<Rapport> createState() => _RapportState();
}

class _RapportState extends State<Rapport> {
  @override
  Widget build(BuildContext context) {
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
        drawer: widget.b?Drawers(context):null,
    );
  }
}
