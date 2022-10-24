// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sar_equipo/src/notification_view/responsive.dart';
import 'package:sar_equipo/src/notification_view/screens/email/email_screen.dart';
import '../../components/components/side_menu.dart';
//import '../../screens/email/email_screen.dart';
import '../../models/Email.dart';
import 'components/list_of_emails.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Responsive(
      mobile: Expanded(
        flex: 6,
        child: ListOfEmails(),
      ), //Row(
      //   // ignore: prefer_const_literals_to_create_immutables
      //   children: [
      //     Expanded(
      //       flex: 6,
      //       child: ListOfEmails(),
      //     ),
      //   ],
      // ),
      tablet: Row(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Expanded(
            flex: 6,
            child: ListOfEmails(),
          ),
          Expanded(
            flex: 9,
            child: EmailScreen(email: emails[0]),
          ),
        ],
      ),
      desktop: Row(
        children: [
          Expanded(
            flex: size.width > 1340 ? 2 : 4,
            child: SideMenu(),
          ),
          Expanded(
            flex: size.width > 1340 ? 3 : 5,
            child: ListOfEmails(),
          ),
          Expanded(
            flex: size.width > 1340 ? 8 : 10,
            child: EmailScreen(email: emails[1]),
          ),
        ],
      ),
    ));
  }
}
