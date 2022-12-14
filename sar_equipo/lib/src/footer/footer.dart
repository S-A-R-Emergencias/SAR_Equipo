import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sar_equipo/src/footer/footer_button.dart';
import 'package:sar_equipo/src/navigation_bar/nav_bar_button.dart';
import 'package:sar_equipo/src/widget/responsive_widget.dart';

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
                FooterButton(onTap: (){}, text: 'Página principal'),
                FooterButton(onTap: (){}, text: 'Mapa de Calor'),
                FooterButton(onTap: (){}, text: 'Inventario'),
                FooterButton(onTap: (){}, text: 'Atendidos'),
              ],
            ),
            Column(
              children: [
                FooterButton(onTap: (){}, text: 'Facebook'),
                FooterButton(onTap: (){}, text: 'Instagram'),
                FooterButton(onTap: (){}, text: 'Telegram'),
                FooterButton(onTap: (){}, text: 'Twitter'),
              ],
            ),
            Column(
              children: [
                FooterButton(onTap: (){}, text: 'Política de Privacidad'),
                FooterButton(onTap: (){}, text: 'Terminos y condiciones'),
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
                FooterButton(onTap: (){}, text: 'Página principal'),
                FooterButton(onTap: (){}, text: 'Mapa de Calor'),
                FooterButton(onTap: (){}, text: 'Inventario'),
                FooterButton(onTap: (){}, text: 'Atendidos'),
                FooterButton(onTap: (){}, text: 'Política de Privacidad'),
                FooterButton(onTap: (){}, text: 'Terminos y condiciones'),
              ],
            ),
            Column(
              children: [
                FooterButton(onTap: (){}, text: 'Facebook'),
                FooterButton(onTap: (){}, text: 'Instagram'),
                FooterButton(onTap: (){}, text: 'Telegram'),
                FooterButton(onTap: (){}, text: 'Twitter'),
              ],
            ),
          ],
        ),
      ),
    );
  }

}