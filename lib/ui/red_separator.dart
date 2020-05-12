import 'package:flutter/material.dart';

class RedSeparator extends StatelessWidget {

 RedSeparator();
      
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Color(0xffBE1622),
      indent: 10,
      endIndent: 10,
      height: 5,
      thickness: 2,
    );
  }
}