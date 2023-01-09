import 'dart:io';

import 'package:dashed_container/dashed_container.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ths_web/widget/appbar.dart';
import 'package:ths_web/widget/drawer.dart';
import 'package:excel/excel.dart';

class Tache extends StatefulWidget {
  final bool b;

  Tache({required this.b});

  @override
  State<Tache> createState() => _TacheState();
}

class _TacheState extends State<Tache> {
  var _openResult = false;
  List table = [];
  Future<void> openFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      print(file);
      var excel = Excel.decodeBytes(file.bytes);
      excel.removeRow('Sheet1', 0);
      excel.removeRow('Sheet1', 0);
      excel.removeRow('Sheet1', 0);
      excel.removeRow('Sheet1', 0);
      excel.removeColumn('Sheet1', 0);
      excel.removeColumn('Sheet1', 10);
      excel.removeColumn('Sheet1', 10);
      print(excel.tables['Sheet1']!.rows);
      setState(() {
        table = excel.tables['Sheet1']!.rows;
        _openResult = true;
      });
    } else {
      // User canceled the picker
      return null;
    }
  }

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
            child: _openResult == false
                ? (GestureDetector(
                    onTap: () {
                      openFile();
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
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
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
                  ))
                : (DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Name',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Age',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Role',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ],
                    rows: const <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Sarah')),
                          DataCell(Text('19')),
                          DataCell(Text('Student')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Janine')),
                          DataCell(Text('43')),
                          DataCell(Text('Professor')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('William')),
                          DataCell(Text('27')),
                          DataCell(Text('Associate Professor')),
                        ],
                      ),
                    ],
                  ))));
  }

  late File image;

  _imgFromGallery(setState) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      print(imageTemp);
      //setState(() =>
      //this.image = imageTemp
      //);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
