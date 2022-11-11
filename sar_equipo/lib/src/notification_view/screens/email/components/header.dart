import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sar_equipo/src/notification_view/models/Email.dart';
import 'package:sar_equipo/src/notification_view/responsive.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          if (Responsive.isMobile(context)) BackButton(),
          IconButton(
            icon: WebsafeSvg.asset(
              "assets/Icons/Trash.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: kDefaultPadding / 2),
          IconButton(
            icon: WebsafeSvg.asset(
              "assets/Icons/Reply.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: kDefaultPadding / 2),
          IconButton(
            icon: WebsafeSvg.asset(
              "assets/Icons/Reply all.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: kDefaultPadding / 2),
          IconButton(
            icon: WebsafeSvg.asset(
              "assets/Icons/Transfer.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          const Spacer(),
          if (Responsive.isDesktop(context))
            IconButton(
              icon: WebsafeSvg.asset(
                "assets/Icons/Printer.svg",
                width: 24,
              ),
              onPressed: () {},
            ),
          const SizedBox(width: kDefaultPadding / 2),
          IconButton(
            icon: WebsafeSvg.asset(
              "assets/Icons/Markup.svg",
              width: 24,
            ),
            onPressed: () {
              final docNotification = FirebaseFirestore.instance
                  .collection('notificacion')
                  .doc(sessionNotif[0].id);

              docNotification.update({'isChecked': true});
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: kDefaultPadding / 2),
          IconButton(
            icon: WebsafeSvg.asset(
              "assets/Icons/More vertical.svg",
              width: 24,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: kDefaultPadding / 2),
        ],
      ),
    );
  }
}
