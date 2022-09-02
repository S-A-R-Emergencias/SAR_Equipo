import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeContent extends StatelessWidget{
  const HomeContent({Key? key }):super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      color: Color.fromRGBO(34, 40, 49, 1),
      height: 1080,
    );

  }
}