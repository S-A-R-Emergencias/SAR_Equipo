import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sar_equipo/src/content/home_content.dart';
import 'package:sar_equipo/src/footer/footer.dart';
import 'package:sar_equipo/src/profile/profile_page.dart';
import 'navigation_bar/nav_bar.dart';


class MainWebPage extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    double width = MediaQuery.of(context).size.width;
    double maxWidth = width > 1200 ? 1920 : width;

    return Scaffold(
      body: Center(
        child: Container(
          width: maxWidth,
          child: Column(
            children: [
              const NavBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <Widget>[
                      Container(child:ProfileScreen()),
                      const Footer(),
                      
                    ],
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
  

}