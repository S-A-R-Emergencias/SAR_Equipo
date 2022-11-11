import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sar_equipo/src/global/environment.dart';
import 'package:sar_equipo/src/login_logup/login.dart';
import 'package:sar_equipo/src/navigation_bar/nav_bar_button.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sar_equipo/src/pages/element_web_page.dart';
import 'package:sar_equipo/src/widget/responsive_widget.dart';

class NavBar extends ResponsiveWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget buildDesktop(BuildContext context) {
    return const DesktopNavBar();
  }

  @override
  Widget buildMobile(BuildContext context) {
    return const MobileNavBar();
  }
}

class DesktopNavBar extends StatelessWidget {
  const DesktopNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(253, 112, 19, 1),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Image.asset(
              "assets/images/sar.png",
              height: 98.0,
            ),
            const SizedBox(
              width: 10.0,
            ),
            const Text(
              "SAR",
              style: TextStyle(
                fontSize: 40.0,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(34, 40, 49, 1),
              ),
            ),
            Expanded(child: Container()),
            NavBarButton(onTap: () {}, text: 'Página principal'),
            NavBarButton(
                onTap: () {
                  if(Environment.usersession!.role == "1")
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
                  
                },
                text: 'Inventario'),
            NavBarButton(onTap: () {
              Environment.usersession = null;
              Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Login(titleName: "Login",)),
                );
            }, text: 'Cerrar Sesión'),
            
          ],
        ),
      ),
    );
  }
}

class MobileNavBar extends HookConsumerWidget {
  const MobileNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final containerHeight = useState<double>(0.0);
    return Stack(
      children: [
        AnimatedContainer(
          margin: EdgeInsets.only(top: 95.0),
          curve: Curves.ease,
          duration: Duration(milliseconds: 350),
          height: containerHeight.value,
          child: SingleChildScrollView(
            child: Column(
              children: [
                NavBarButton(onTap: () {}, text: 'Página principal'),
                NavBarButton(onTap: () {}, text: 'Mapa de Calor'),
                NavBarButton(onTap: () {}, text: 'Inventario'),
                NavBarButton(onTap: () {}, text: 'Atendidos'),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: <Color>[
                                Color.fromARGB(255, 255, 255, 255),
                                Color.fromARGB(255, 255, 255, 255),
                                Color.fromARGB(255, 255, 255, 255),
                              ],
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                          primary: Color.fromRGBO(34, 40, 49, 1),
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('Iniciar Sesión'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: const Color.fromRGBO(253, 112, 19, 1),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              children: <Widget>[
                Image.asset(
                  "assets/images/sar.png",
                  height: 70.0,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                const Text(
                  "SAR",
                  // ignore: unnecessary_const
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(34, 40, 49, 1),
                  ),
                ),
                Expanded(child: Container()),
                Material(
                  child: InkWell(
                    splashColor: Color.fromRGBO(253, 112, 19, 1),
                    onTap: () {
                      final height = containerHeight.value > 0 ? 0.0 : 240.0;
                      containerHeight.value = height;
                    },
                    child: Icon(
                      Icons.menu,
                      color: Color.fromRGBO(34, 40, 49, 1),
                      size: 35.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
