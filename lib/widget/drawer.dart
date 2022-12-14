import 'dart:io';
import 'dart:ui';
import 'dart:math' as math;
import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

Widget Drawers(BuildContext context) {
  bool? _expanded2;
  int selectedPage;
  var size = MediaQuery.of(context).size;
  return Theme(
    data: Theme.of(context).copyWith(
      canvasColor: Colors.grey[400],
    ),
    child: Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey[400],
            ),
            child: Row(
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/logoTHS.png',
                      width: size.width * 0.075,
                    ),
                    Container(
                      width: size.width * 0.085,
                      child: Text(
                        "Bienvenu à l'espace administrateur",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(101, 130, 218, 1)),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.025,
          ),
          TextField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              hintText: 'Rechercher',
            ),
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Carddesc(
            context,
            Content(
                text: 'Accueil',
                icon: Icons.home,
                ontap: () {
                   Navigator.pushReplacementNamed(context, '/dashboard');
                },
                context: context),
            false,
            SizedBox(),
          ),
          Carddesc(
              context,
              Content(
                  text: 'Notifications',
                  icon: Icons.notifications,
                  ontap: () {
                     Navigator.pushReplacementNamed(context, '/Notification');
                  },
                  context: context),
              false,
              SizedBox()),
          Carddesc(
              context,
              Content(
                  text: 'Affectation des tâches',
                  icon: Icons.date_range,
                  ontap: () {
                    Navigator.pushNamed(context, '/tache');
                  },
                  context: context),
              false,
              SizedBox()),
          Carddesc(
            context,
            Content(
                text: 'Message à diffuser',
                icon: Icons.message,
                ontap: () {},
                context: context),
            true,
            IconButton(
              icon: Icon(
                Icons.attach_file,
                size: 20,
              ),
              onPressed: () {
                _imgFromGallery(context);
              },
            ),
          ),
          Carddesc(
              context,
              Content(
                  text: 'Comptes des techniciens',
                  icon: Icons.account_circle,
                  ontap: () {
                     Navigator.pushNamed(context,'/compte_tech');
                  },
                  context: context),
              false,
              SizedBox()),
          Carddesc(
              context,
              Content(
                  text: 'Rapports',
                  icon: Icons.article,
                  ontap: () {
                      Navigator.pushNamed(context, '/rapport');
                  },
                  context: context),
              false,
              SizedBox()),
          Carddesc(
              context,
              Content(
                  text: 'Déconnexion',
                  icon: Icons.logout,
                  ontap: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  context: context),
              false,
              SizedBox()),
        ],
      ),
    ),
  );
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

Widget Content(
    {required IconData icon,
    required String text,
    required BuildContext context,
    required Function ontap}) {
        var size = MediaQuery.of(context).size;
  return ListTile(
    tileColor: Colors.white,
    leading: Icon(
      icon,
      color: Colors.black,
    ),
    title: Text(
      text,
      style: TextStyle(color: Colors.black,fontSize: 14),
    ),
    onTap: () {
      ontap();
    },
  );
}

Widget Carddesc(BuildContext context, Widget widget, bool b, Widget widget2) {
  bool? _expanded2;
  var size = MediaQuery.of(context).size;
  return Card(
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
                      child: widget,
                    ),
                    b
                        ? Transform.rotate(
                            angle: math.pi * (easeInValue + 0.5),
                            child:
                                Icon(Icons.add, size: 30, color: Colors.black),
                            alignment: Alignment.center,
                          )
                        : Transform.rotate(
                            angle: 0,
                          ),
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
                  widget2,
                ],
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  focusedBorder: OutlineInputBorder(),
                  hintText:
                      "Saisir le message à justifier……………………………………………………………………………………………………………………………………………………………………………………………………………………………………………………………………………………………………………………………",
                ),
                maxLines: 5,
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: size.width * 0.008, top: size.width * 0.008),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buttonValiderAnuller(
                        val: 'Annuler',
                        color1: Colors.red,
                        color2: Colors.white,
                        onTap: () {}),
                    buttonValiderAnuller(
                        val: 'Envoyer',
                        color1: Color.fromRGBO(0, 36, 147, 0.8),
                        color2: Colors.white,
                        onTap: () {})
                  ],
                ),
              ),
            ],
          ),
        )),
  );
}

Widget buttonValiderAnuller({
  required String val,
  required Function onTap,
  required Color color1,
  required Color color2,
}) {
  return Container(
    width: 110,
    height: 30,
    child: RaisedButton(
      onPressed: () {
        onTap();
      },
      color: color1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: color1, width: 2)),
      child: Text(
        val,
        style:
            TextStyle(fontSize: 18, color: color2, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
