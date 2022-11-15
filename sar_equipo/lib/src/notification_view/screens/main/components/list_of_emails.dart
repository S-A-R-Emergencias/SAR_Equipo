import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sar_equipo/src/notification_view/components/components/side_menu.dart';
import 'package:sar_equipo/src/notification_view/responsive.dart';
import 'package:sar_equipo/src/notification_view/screens/email/email_screen.dart';
import 'package:sar_equipo/src/notification_view/screens/main/main_screen.dart';
import '../../../models/Email.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../constants.dart';
import 'email_card.dart';
import 'package:intl/intl.dart';

Email Cargar(QueryDocumentSnapshot<Object?> not) {
  Color col = Color.fromARGB(0, 0, 0, 0);
  switch (not.get("normal_Panic")) {
    case 0:
      col = Color.fromARGB(255, 255, 0, 0);
      break;
    case 1:
      col = Color.fromARGB(255, 39, 54, 115);
      break;
    case 2:
      col = Color.fromARGB(255, 0, 0, 0);
      break;
  }
  Email a = Email(
      id: not.id,
      name: not.get("name").toString(),
      image: not.get("image").toString(),
      type: not.get("type"),
      normalPanicAnonymous: not.get("normal_Panic"),
      tagColor: col,
      isChecked: not.get("isChecked"),
      time: not.get("time"),
      body: not.get("body").toString(),
      latitude: not.get("latitude"),
      longitude: not.get("longitude"),
      mail: not.get("mail"));
  return a;
}

class ListOfEmails extends StatefulWidget {
  @override
  State<ListOfEmails> createState() => _ListOfEmailsState();
}

class _ListOfEmailsState extends State<ListOfEmails> {
  @override
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CollectionReference collection =
      FirebaseFirestore.instance.collection("notification");
  late List<Email> notificationList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250),
        child: SideMenu(),
      ),
      body: Container(
        //padding: EdgeInsets.all(kDefaultPadding),
        color: kBgDarkColor,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: Row(
                    children: [
                      if (Responsive.isMobile(context) ||
                          Responsive.isTablet(context))
                        IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            _scaffoldKey.currentState!.openDrawer();
                          },
                        ),
                      SizedBox(width: 5),
                      Expanded(
                        child: TextField(
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            hintText: "Search",
                            fillColor: kBgLightColor,
                            filled: true,
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.all(kDefaultPadding * 0.75),
                              child: WebsafeSvg.asset(
                                "assets/Icons/Search.svg",
                                width: 24,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: Row(
                  children: [
                    WebsafeSvg.asset(
                      "assets/Icons/Angle down.svg",
                      width: 16,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Sort by date",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Spacer(),
                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {},
                      child: WebsafeSvg.asset(
                        "assets/Icons/Sort.svg",
                        width: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: kDefaultPadding),
              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('notificacion')
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text("Something went wrong");
                    } else if (snapshot.hasData) {
                      myNotifications.clear();
                      for (var not in snapshot.data!.docs) {
                        Color col;
                        if (not.get("normal_Panic")==0) {
                          col = Color.fromARGB(255, 255, 0, 0);
                        } else if (not.get("normal_Panic")==1){
                          col = Color.fromARGB(255, 39, 54, 115);
                        }else if (not.get("normal_Panic")==2){
                          col = Color.fromARGB(255, 0, 0, 0);
                        }
                        switch (filter) {
                          case 1:
                            if (!not.get("isChecked")) {
                              myNotifications.add(Cargar(not));
                            }
                            break;
                          case 2:
                            if (not.get("isChecked")) {
                              myNotifications.add(Cargar(not));
                            }
                            break;
                          case 3:
                            if (not.get("normal_Panic") == 0) {
                              myNotifications.add(Cargar(not));
                            }
                            break;
                          case 4:
                            if (not.get("normal_Panic") == 1) {
                              myNotifications.add(Cargar(not));
                            }
                            break;
                          case 5:
                            if (not.get("normal_Panic") == 2) {
                              myNotifications.add(Cargar(not));
                            }
                            break;
                        }
                      }
                      return Expanded(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: myNotifications.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  EmailCard(
                                    isActive: Responsive.isMobile(context)
                                        ? false
                                        : index == 0,
                                    email: myNotifications[index],
                                    press: () {
                                      sessionNotif.clear();
                                      sessionNotif.add(myNotifications[index]);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            if (Responsive.isMobile(context)) {
                                              return EmailScreen(
                                                  email:
                                                      myNotifications[index]);
                                            } else {
                                              return MainScreen(
                                                  emailDefault:
                                                      myNotifications[index]);
                                            }
                                          },
                                        ),
                                      );
                                    },
                                  )));
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
