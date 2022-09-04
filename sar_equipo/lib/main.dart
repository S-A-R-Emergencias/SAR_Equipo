import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sar_equipo/src/main_web_page.dart';
import 'package:url_strategy/url_strategy.dart';

void main (){
  setPathUrlStrategy();
  runApp(
    ProviderScope(
      child: MaterialApp(
        title: "Emergencias Sar",
        home: MainWebPage(),
      )
    ),
  );

}
