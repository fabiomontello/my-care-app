import 'package:flutter/material.dart';

class DrawerListSeparator extends StatelessWidget {

  DrawerListSeparator();
      
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.white,
      indent: 30,
      endIndent: 30,
      height: 5,
      thickness: 2,
    );
  }
}