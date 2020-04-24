import 'package:flutter/material.dart';

class DrawerListElem extends StatelessWidget {
  final String label;
  final listDrawerPadding = EdgeInsets.fromLTRB(30, 0, 0, 0);
  final Function pageHandler;
  final int pageNumber;
  DrawerListElem(this.label, this.pageHandler, [this.pageNumber = -1]);

  @override
  Widget build(BuildContext context) {
    var onTapGeneral = () {
      Navigator.pop(context);
      pageHandler(pageNumber);
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
