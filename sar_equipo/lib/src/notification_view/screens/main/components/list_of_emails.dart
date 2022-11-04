import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sar_equipo/src/notification_view/responsive.dart';
import 'package:sar_equipo/src/notification_view/screens/email/email_screen.dart';
import '../../../models/Email.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../constants.dart';
import 'email_card.dart';
import 'package:intl/intl.dart';

class ListOfEmails extends StatefulWidget {
  @override
  State<ListOfEmails> createState() => _ListOfEmailsState();
}

class _ListOfEmailsState extends State<ListOfEmails> {
  CollectionReference collection =
      FirebaseFirestore.instance.collection("notification");
  late List<Email> notificationList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //padding: EdgeInsets.all(kDefaultPadding),
        color: kBgDarkColor,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: kDefaultPadding),
              TextField(
                onChanged: (value) {},
                decoration: InputDecoration(
                  hintText: "Search",
                  fillColor: kBgLightColor,
                  filled: true,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                    child: WebsafeSvg.asset(
                      "assets/Icons/Search.svg",
                      width: 24,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Row(
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
                        if (not.get("normal_Panic")) {
                          col = Color.fromARGB(255, 255, 0, 0);
                        } else {
                          col = Color.fromARGB(255, 39, 54, 115);
                        }
                        Email a = Email(
                            id: not.id,
                            name: not.get("name").toString(),
                            image: not.get("image").toString(),
                            type: not.get("type"),
                            normalPanic: not.get("normal_Panic"),
                            tagColor: col,
                            isChecked: not.get("isChecked"),
                            time: not.get("time"),
                            body: not.get("body").toString());
                        if (!not.get("isChecked")) myNotifications.add(a);
                      }
                      return ListView.builder(
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
                                      builder: (context) => EmailScreen(
                                          email: myNotifications[index]),
                                    ),
                                  );
                                },
                              ));
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
