import 'dart:io';

import 'package:dashed_container/dashed_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ths_web/widget/appbar.dart';
import 'package:ths_web/widget/drawer.dart';

class Tache extends StatefulWidget {
  final bool b;

  Tache({required this.b});

  @override
  State<Tache> createState() => _TacheState();
}

class _TacheState extends State<Tache> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.grey[400],
          title: Titles(title: 'Affectations des tâches'),
          automaticallyImplyLeading: widget.b,
          actions: [
            AppBars(),
          ],
        ),
        drawer: widget.b ? Drawers(context: context) : null,
        body: Center(
          child:GestureDetector(
            onTap: (){
              _imgFromGallery(setState);
            },
            child: Container(
              width: 400,
              height: 80,
              child: DashedContainer(
                child: Row(
                  children: [
                    SizedBox(
                      width: 90,
                    ),
                    Icon(Icons.upload),
                    Text(
                      "importer le fichier XLSX",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                  ],
                ),
                dashColor: Colors.grey[400],
                boxShape: BoxShape.rectangle,
                dashedLength: 20.0,
                blankLength: 3.0,
                strokeWidth: 3.0,
              ),
            ),
          ),
        ));
  }
  
late File image;

_imgFromGallery(setState) async {
  try {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    //setState(() =>
    //this.image = imageTemp
    //);
  } on PlatformException catch (e) {
    print('Failed to pick image: $e');
  }
}
}
