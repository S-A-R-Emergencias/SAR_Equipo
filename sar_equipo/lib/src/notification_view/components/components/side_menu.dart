import 'package:flutter/material.dart';
//import 'package:notifications_sar/extensions.dart';
import 'package:sar_equipo/src/notification_view/extensions.dart';
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
          Image.asset(
            "assets/images/sar.png",
            width: 46,
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
            press: () {},
            title: "Reportes",
            iconSrc: "assets/Icons/Inbox.svg",
            isActive: true,
            itemCount: 3,
          ),
          SideMenuItem(
            press: () {},
            title: "Emergencias",
            iconSrc: "assets/Icons/Send.svg",
            isActive: false,
            itemCount: 3,
          ),
          SideMenuItem(
            press: () {},
            title: "Similares",
            iconSrc: "assets/Icons/File.svg",
            isActive: false,
            itemCount: 3,
          ),
          SideMenuItem(
            press: () {},
            title: "Atendidos",
            iconSrc: "assets/Icons/Trash.svg",
            isActive: false,
            showBorder: false,
            itemCount: 3,
          ),

          const SizedBox(height: kDefaultPadding * 2),
          // Tags
        ],
      ),
    );
  }
}
