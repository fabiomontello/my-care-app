import 'package:flutter/material.dart';
import 'package:my_care/ui/plus_list_elem.dart';
import './drawer_list_separator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlusButton extends StatefulWidget {
  PlusButton();

  @override
  _PlusButton createState() => _PlusButton();
}

class _PlusButton extends State<PlusButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 55),
      decoration: new BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: new BorderRadius.all(
          const Radius.circular(20.0),
        ),
      ),
      padding: EdgeInsets.all(10),
      height: 290,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Divider(
            color: Colors.white,
            indent: 140,
            endIndent: 140,
            height: 20,
            thickness: 6,
          ),
          DrawerListSeparator(),
          PlusListElem(
              'Medicinale', FontAwesomeIcons.pills, '/medicinale/edit'),
          DrawerListSeparator(),
          PlusListElem('Appuntamento', FontAwesomeIcons.checkCircle,
              '/appuntamento/edit'),
          DrawerListSeparator(),
          PlusListElem(
              'Documento', FontAwesomeIcons.fileVideo, '/documento/edit'),
          DrawerListSeparator(),
          PlusListElem(
              'Analisi', FontAwesomeIcons.fileMedicalAlt, '/analisi/edit'),
        ],
      ),
    );
  }
}
