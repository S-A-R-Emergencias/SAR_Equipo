import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NavBarButton extends HookConsumerWidget{
  final VoidCallback onTap;
  final String text;

  const NavBarButton ({
    Key ? key,
    required this.onTap,
    required this.text,
  }) : super (key: key);
  
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final textColor = useState<Color>(Color.fromRGBO(34, 40, 49, 1));
    return MouseRegion(
      onEnter: (value){
        textColor.value = Color.fromRGBO(75, 75, 75, 1);
      },
      onExit: (value){
        textColor.value = Color.fromRGBO(34, 40, 49, 1);
      },
      child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: textColor.value,
              ),
          ),
        ),
      ),
    ),
    );
  }
}