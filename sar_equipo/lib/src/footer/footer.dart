import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sar_equipo/src/footer/footer_button.dart';
import 'package:sar_equipo/src/global/environment.dart';
import 'package:sar_equipo/src/navigation_bar/nav_bar_button.dart';
import 'package:sar_equipo/src/notification_view/models/Email.dart';
import 'package:sar_equipo/src/notification_view/screens/main/main_screen.dart';
import 'package:sar_equipo/src/pages/element_web_page.dart';
import 'package:sar_equipo/src/widget/responsive_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends ResponsiveWidget{
  const Footer({Key? key }):super(key: key);
  
  @override
  Widget buildDesktop(BuildContext context) {
    return const DesktopFooter();
  }
  
  @override
  Widget buildMobile(BuildContext context) {
    return const MobileFooter();
  }

}

class DesktopFooter extends StatelessWidget{
  const DesktopFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(253, 112, 19, 1),
      child: Padding(
        padding:const EdgeInsets.all(20),
        child: Row(
          
          children: <Widget>[
            const SizedBox(width: 10.0,),
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  "SAR",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(34, 40, 49, 1),
                  ),
                ),
                const Text(
                  "2022 @ SAR All \n rights reserved.",
                  style:TextStyle(
                    color: Color.fromRGBO(34, 40, 49, 1),
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Expanded(child: Container()),
            Column(
              children: [
                FooterButton(onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainScreen(emailDefault: emails[0])),
                    );
                }, text: 'Página principal'),
                FooterButton(onTap: (){
                  if(Environment.usersession!.role == "2")
                  {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ElementPage()),
                    );
                  }else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("No tienes acceso"),
                                  ));
                  }
                }, text: 'Inventario'),
              ],
            ),
            Column(
              children: [
                FooterButton(onTap: (){launchUrl(Uri.parse("https://www.facebook.com/sarboliviacbba/"));}, text: 'Facebook'),
                FooterButton(onTap: (){launchUrl(Uri.parse("https://www.instagram.com/sar_bolivia/?hl=es"));}, text: 'Instagram'),
                FooterButton(onTap: (){launchUrl(Uri.parse("https://twitter.com/sarboliviacbba?lang=es"));}, text: 'Twitter'),
              ],
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }

}

class MobileFooter extends StatelessWidget{
  const MobileFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(253, 112, 19, 1),
      child: Padding(
        padding:const EdgeInsets.all(20),
        child: Row(
          
          children: <Widget>[
            const SizedBox(width: 10.0,),
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  "SAR",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(34, 40, 49, 1),
                  ),
                ),
                const Text(
                  "2022 @ SAR All \n rights reserved.",
                  style:TextStyle(
                    color: Color.fromRGBO(34, 40, 49, 1),
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            Expanded(child: Container()),
            Column(
              children: [
                FooterButton(onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainScreen(emailDefault: emails[0])),
                    );
                }, text: 'Página principal'),
                FooterButton(onTap: (){
                  if(Environment.usersession!.role == "2")
                  {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ElementPage()),
                    );
                  }else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("No tienes acceso"),
                                  ));
                  }
                }, text: 'Inventario'),
              ],
            ),
            Column(
              children: [
                FooterButton(onTap: (){launchUrl(Uri.parse("https://www.facebook.com/sarboliviacbba/"));}, text: 'Facebook'),
                FooterButton(onTap: (){launchUrl(Uri.parse("https://www.instagram.com/sar_bolivia/?hl=es"));}, text: 'Instagram'),
                FooterButton(onTap: (){launchUrl(Uri.parse("https://twitter.com/sarboliviacbba?lang=es"));}, text: 'Twitter'),
              ],
            ),
          ],
        ),
      ),
    );
  }

}