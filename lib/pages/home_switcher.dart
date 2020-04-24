import 'package:flutter/material.dart';

class HomeSwitcher extends StatelessWidget {
  final int index;
  HomeSwitcher(this.index);
  @override
    Widget build(BuildContext context) {
      Widget child;
      switch (index) {
        case 0:
          child = FlutterLogo();
          break;
        case 1:
          child = FlutterLogo(colors: Colors.orange);
          break;
        case 2:
          child = FlutterLogo(colors: Colors.red);
          break;
        default:
          child = FlutterLogo(colors: Colors.deepPurple,);
      }
      return Center(
          child: child
        );
    }
}