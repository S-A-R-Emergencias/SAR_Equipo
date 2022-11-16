import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sar_equipo/src/global/environment.dart';
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
              ProfileImage(),
              if (Responsive.isMobile(context) || Responsive.isTablet(context))
                Spacer(),
              if (Responsive.isMobile(context) || Responsive.isTablet(context))
                CloseButton()
            ],
          ),
          const SizedBox(height: kDefaultPadding),
          ElevatedButton.icon(
            onPressed: () {
              Environment.usersession = null;
              Navigator.pushNamed(context, '/');
            },
            icon: WebsafeSvg.asset("assets/Icons/Reply.svg",
                width: 16, color: Colors.white),
            label: const Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            ),
          ).addNeumorphism(
            topShadowColor: Colors.white,
            bottomShadowColor: const Color(0xFF234395).withOpacity(0.2),
          ),
          const SizedBox(height: kDefaultPadding),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
            icon: WebsafeSvg.asset("assets/Icons/Inbox.svg",
                width: 16, color: Colors.white),
            label: const Text(
              "Perfil",
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
              anonimos = false;
              filter = 1;
              Navigator.pushNamed(context, '/notification');
            },
            title: "Espera",
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
              anonimos = false;
              filter = 3;
              Navigator.pushNamed(context, '/notification');
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
              anonimos = false;
              filter = 4;
              Navigator.pushNamed(context, '/notification');
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
              anonimos = false;
              filter = 2;
              Navigator.pushNamed(context, '/notification');
            },
            title: "Atendidos",
            iconSrc: "assets/Icons/Markup.svg",
            isActive: atendidos,
            itemCount: 4,
          ),
          SideMenuItem(
            press: () {
              todas = false;
              emergencias = false;
              reportes = false;
              atendidos = false;
              anonimos = true;
              filter = 5;
              Navigator.pushNamed(context, '/notification');
            },
            title: "Anonimos",
            iconSrc: "assets/Icons/Sort.svg",
            isActive: anonimos,
            itemCount: 5,
          ),
          SideMenuItem(
            press: () {
              todas = false;
              emergencias = false;
              reportes = false;
              atendidos = false;
              anonimos = false;
              filter = 2;
              if(Environment.usersession!.role == "2")
              {
                Navigator.pushNamed(context, '/element');
              }else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("No tienes acceso"),
                              ));
              }
            },
            title: "Inventario",
            iconSrc: "assets/Icons/Transfer.svg",
            isActive: false,
            itemCount: 1,
          ),
          SideMenuItem(
            press: () {
              todas = false;
              emergencias = false;
              reportes = false;
              atendidos = false;
              filter = 2;
              if(Environment.usersession!.role == "2")
              {
                Navigator.pushNamed(context, '/logup');
              }else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("No tienes acceso"),
                              ));
              }
            },
            title: "Registro",
            iconSrc: "assets/Icons/Transfer.svg",
            isActive: false,
            itemCount: 1,
          ),
          
          const SizedBox(height: kDefaultPadding * 2),
          // Tags
        ],
      ),
    );
  }

  Widget ProfileImage() {
    if (Environment.usersession!.image == null) {
      return Image.network(
        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
        width: 50,
        fit: BoxFit.fitWidth,
      );
    } else {
      return Image.memory(
        base64Decode(Environment.usersession!.image.toString()),
        width: 50,
        fit: BoxFit.fitWidth,
      );
    }
  }
}
