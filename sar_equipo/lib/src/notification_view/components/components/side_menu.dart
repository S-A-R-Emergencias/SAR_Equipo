import 'package:flutter/material.dart';
import 'package:sar_equipo/src/notification_view/models/Email.dart';
import 'package:sar_equipo/src/notification_view/screens/main/components/list_of_emails.dart';
//import 'package:notifications_sar/extensions.dart';
import 'package:sar_equipo/src/notification_view/extensions.dart';
import 'package:sar_equipo/src/notification_view/responsive.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constants.dart';
import 'side_menu_item.dart';
import 'tags.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      color: kBgLightColor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/sar.png",
                width: 46,
              ),
              if (Responsive.isMobile(context) || Responsive.isTablet(context))
                Spacer(),
              if (Responsive.isMobile(context) || Responsive.isTablet(context))
                CloseButton()
            ],
          ),
          const SizedBox(height: kDefaultPadding),
          ElevatedButton.icon(
            onPressed: () {},
            icon: WebsafeSvg.asset("assets/Icons/Reply.svg",
                width: 16, color: Colors.white),
            label: const Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
          ).addNeumorphism(
            topShadowColor: Colors.white,
            bottomShadowColor: const Color(0xFF234395).withOpacity(0.2),
          ),
          const SizedBox(height: kDefaultPadding),
          ElevatedButton.icon(
            onPressed: () {},
            icon: WebsafeSvg.asset("assets/Icons/Inbox.svg",
                width: 16, color: Colors.white),
            label: const Text(
              "Home",
              style: TextStyle(color: Colors.white),
            ),
          ).addNeumorphism(),
          const SizedBox(height: kDefaultPadding * 2),
          // Menu Items
          SideMenuItem(
            press: () {
              todas = true;
              emergencias = false;
              reportes = false;
              atendidos = false;
              filter = 2;
              Navigator.pushNamed(context, '/');
            },
            title: "Todas",
            iconSrc: "assets/Icons/Inbox.svg",
            isActive: todas,
            itemCount: 1,
          ),
          SideMenuItem(
            press: () {
              todas = false;
              emergencias = true;
              reportes = false;
              atendidos = false;
              filter = 3;
              Navigator.pushNamed(context, '/');
            },
            title: "Emergencias",
            iconSrc: "assets/Icons/Send.svg",
            isActive: emergencias,
            itemCount: 2,
          ),
          SideMenuItem(
            press: () {
              todas = false;
              emergencias = false;
              reportes = true;
              atendidos = false;
              filter = 4;
              Navigator.pushNamed(context, '/');
            },
            title: "Reportes",
            iconSrc: "assets/Icons/File.svg",
            isActive: reportes,
            itemCount: 3,
          ),
          SideMenuItem(
            press: () {
              todas = false;
              emergencias = false;
              reportes = false;
              atendidos = true;
              filter = 2;
              Navigator.pushNamed(context, '/');
            },
            title: "Atendidos",
            iconSrc: "assets/Icons/Trash.svg",
            isActive: atendidos,
            showBorder: false,
            itemCount: 4,
          ),

          const SizedBox(height: kDefaultPadding * 2),
          // Tags
        ],
      ),
    );
  }
}
