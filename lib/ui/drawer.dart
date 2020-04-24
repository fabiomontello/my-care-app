import 'package:flutter/material.dart';
import '../style/style.dart';
import './drawer_list_elem.dart';
import './drawer_list_separator.dart';

class MyCareDrawer extends StatelessWidget{
  

  @override
  Widget build(BuildContext context) {
    final theme = MyCareTheme();
    
    return Drawer(
      child: Container(
        color: theme.mainColor,
        child:
          ListView(
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
              DrawerListElem('Impostazioni'),
              DrawerListSeparator(),
              DrawerListElem('Medicinali'),
              DrawerListElem('Appuntamenti'),
              DrawerListElem('Documenti'),
              DrawerListElem('Analisi'),
              DrawerListSeparator(),
              DrawerListElem('Connetti B'),
              DrawerListSeparator(),
              DrawerListElem('Assistenza'),
              DrawerListElem('Valutaci'),
            ],
          ),
      ),
    );
  }
}