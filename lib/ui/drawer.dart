import 'package:flutter/material.dart';
import './drawer_list_elem.dart';
import './drawer_list_separator.dart';

class MyCareDrawer extends StatelessWidget {
  final Function pageHandler;

  MyCareDrawer(this.pageHandler);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(30, 50, 10, 30),
              title: Text(
                'My Care',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                ),
              ),
            ),
            DrawerListSeparator(),
            DrawerListElem('Impostazioni', pageHandler),
            DrawerListSeparator(),
            DrawerListElem('Medicinali', pageHandler, 5),
            DrawerListElem('Appuntamenti', pageHandler, 6),
            DrawerListElem('Documenti', pageHandler, 7),
            DrawerListElem('Analisi', pageHandler, 8),
            DrawerListSeparator(),
            DrawerListElem(
              'Connetti B',
              pageHandler,
            ),
            DrawerListSeparator(),
            DrawerListElem(
              'Assistenza',
              pageHandler,
            ),
            DrawerListElem(
              'Valutaci',
              pageHandler,
            ),
          ],
        ),
      ),
    );
  }
}
