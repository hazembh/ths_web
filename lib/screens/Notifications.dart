import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ths_web/screens/dashboard.dart';
import 'package:ths_web/screens/rapport.dart';
import 'package:ths_web/widget/NotificationContent.dart';
import 'package:ths_web/widget/appbar.dart';
import 'package:ths_web/widget/cardwidget.dart';
import 'package:ths_web/widget/drawer.dart';

class Notifications extends StatefulWidget {
  final bool b;

  Notifications({required this.b});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    late UserCredential userCredential;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey[400],
        title: Titles(title: 'Les Notifications'),
        automaticallyImplyLeading: widget.b,
        actions: [
          AppBars(),
        ],
      ),
      drawer: widget.b ? Drawers(context: context) : null,
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Center(
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                CardWidget(
                    context: context,
                    w: 180,
                    h: size.height * 0.75,
                    title: "Création de compte",
                    widget: Column(
                      children: [

                        StreamBuilder(
                          stream: FirebaseFirestore.instance.collection('UserCompte').snapshots(),
                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (context, index) {
                                return
                                  ContentNotifcationCard(
                                    b: false,
                                    idclient: '',
                                    nom: snapshot.data!.docs[index]['Nom et prenom '],
                                    date: snapshot.data!.docs[index]['createdAt'],
                                    action: 'fait',
                                    cin: snapshot.data!.docs[index]['CIN'],
                                    check: () async {
                                       await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                          email: snapshot.data!.docs[index]['email'], password: snapshot.data!.docs[index]['Mot de passe ']);
                                    },
                                    delete: () {});

                              },
                            );
                          },
                        ),
                      ],
                    )),
                SizedBox(
                  width: 20,
                ),
                CardWidget(
                    context: context,
                    w: 180,
                    h: size.height * 0.75,
                    title: "Rendez vous confirmé",
                    widget: Column(
                      children: [
                        ContentNotifcationCard(
                            b: true,
                            idclient: 'B2C_2201_CHT_097',
                            nom: 'Hazem bouaziz',
                            date: '12/12/2022',
                            action: 'fait',
                            cin: '11117999',
                            check: () {},
                            delete: () {}),

                        // ContentWidgetCard(),
                        //ContentWidgetCard(),
                        // ContentWidgetCard(),
                        //ContentWidgetCard(),
                        //ContentWidgetCard(),
                      ],
                    )),
                SizedBox(
                  width: 20,
                ),
                CardWidget(
                    context: context,
                    w: 180,
                    h: size.height * 0.75,
                    title: "Rendez vous annulé ",
                    widget: Column(
                      children: [
                        // ContentWidgetCard(),
                        //ContentWidgetCard(),
                        //ContentWidgetCard(),
                        // ContentWidgetCard(),
                        ContentNotifcationCard(
                            b: true,
                            idclient: 'B2C_2201_CHT_097',
                            nom: 'Hazem bouaziz',
                            date: '12/12/2022',
                            action: 'annulé',
                            cin: '',
                            check: () {},
                            delete: () {}),
                      ],
                    )),
                SizedBox(
                  width: 20,
                ),
                CardWidget(
                    context: context,
                    w: 180,
                    h: size.height * 0.75,
                    title: "Rendez vous raté",
                    widget: Column(
                      children: [
                        ContentNotifcationCard(
                            b: true,
                            idclient: 'B2C_2201_CHT_097',
                            nom: 'Hazem bouaziz',
                            date: '12/12/2022',
                            action: 'raté',
                            cin: '',
                            check: () {},
                            delete: () {}),
                      ],
                    )),
                SizedBox(
                  width: 20,
                ),
                CardWidget(
                    context: context,
                    w: 180,
                    h: size.height * 0.75,
                    title: "Rendez vous interrompu",
                    widget: Column(
                      children: [
                        ContentNotifcationCard(
                            b: true,
                            idclient: 'B2C_2201_CHT_097',
                            nom: 'Hazem bouaziz',
                            date: '12/12/2022',
                            action: 'interrempu',
                            cin: '',
                            check: () {},
                            delete: () {}),
                        ContentNotifcationCard(
                            b: true,
                            idclient: 'B2C_2201_CHT_097',
                            nom: 'Hazem bouaziz',
                            date: '12/12/2022',
                            action: 'interrempu',
                            cin: '',
                            check: () {},
                            delete: () {}),
                        ContentNotifcationCard(
                            b: true,
                            idclient: 'B2C_2201_CHT_097',
                            nom: 'Hazem bouaziz',
                            date: '12/12/2022',
                            action: 'interrempu',
                            cin: '',
                            check: () {},
                            delete: () {}),
                      ],
                    )),
                SizedBox(
                  width: 20,
                ),
                CardWidget(
                    context: context,
                    w: 180,
                    h: size.height * 0.75,
                    title: "Rendez vous Reporté",
                    widget: Column(
                      children: [
                        //ContentWidgetCard(),
                        ContentNotifcationCard(
                            idclient: 'B2C_2201_CHT_097',
                            nom: 'Hazem bouaziz',
                            date: '12/12/2022',
                            action: 'reporté',
                            b: true,
                            cin: '',
                            check: () {},
                            delete: () {}),
                        //ContentWidgetCard(),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
