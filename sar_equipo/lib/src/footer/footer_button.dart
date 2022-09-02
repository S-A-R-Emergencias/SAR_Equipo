import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FooterButton extends StatelessWidget{
  final VoidCallback onTap;
  final String text;

  const FooterButton ({
    Key ? key,
    required this.onTap,
    required this.text,
  }) : super (key: key);
  
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(34, 40, 49, 1),
              ),
          ),
        ),
      ),
    );
  }
}