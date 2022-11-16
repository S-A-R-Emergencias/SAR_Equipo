import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sar_equipo/src/content/home_content.dart';
import 'package:sar_equipo/src/footer/footer.dart';
import 'package:sar_equipo/src/global/environment.dart';
import 'package:sar_equipo/src/login_logup/login.dart';
import 'package:sar_equipo/src/profile/profile_page.dart';
import 'navigation_bar/nav_bar.dart';

class MainWebPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double maxWidth = width > 1200 ? 1920 : width;
    if(Environment.usersession == null){
      return Login(titleName: 'Log In');
    }else{
    return Scaffold(
      body: ListView(
            children: [
              NavBar(),
              Column(
                    children: [
                      ProfileScreen(),
                      Footer(),
                    ],
                  ),
            ],
          ),
      );}
  }
}
