import 'package:flutter/material.dart';

class DrawerListElem extends StatelessWidget {
  final String label;
  final listDrawerPadding = EdgeInsets.fromLTRB(30, 0, 0, 0);
  DrawerListElem(this.label);

  @override
  Widget build(BuildContext context) {
    var onTapGeneral = () {
      Navigator.pop(context);
    };
    return ListTile(
      title:
          Text(this.label, style: TextStyle(color: Colors.white, fontSize: 22)),
      onTap: onTapGeneral,
      contentPadding: listDrawerPadding,
      dense: true,
    );
  }
}
