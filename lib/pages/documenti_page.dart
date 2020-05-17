import 'package:flutter/material.dart';
import '../models/documenti.dart';

List<Documenti> docuList = [
  Documenti(
      id: 'iddoc',
      note: 'Qualche nota qua',
      tipoDoc: TipoDoc.fotoVideo,
      title: 'Documento di prova')
];

class DocumentiPage extends StatefulWidget {
  @override
  _DocumentiPageState createState() => _DocumentiPageState();
}

_docIcons(val) {
  switch (val) {
    case TipoDoc.fotoVideo:
      return Colors.redAccent;
    case TipoDoc.documento:
      return Colors.blueAccent;
    case TipoDoc.audio:
      return Colors.greenAccent;
  }
  return Colors.white;
}

class _DocumentiPageState extends State<DocumentiPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(18, 25, 18, 0),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ...docuList.map((elem) {
              return Container(
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('/medicinale/view',
                        arguments: {'object': elem});
                  },
                  leading: Icon(
                    Icons.fiber_manual_record,
                    color: _docIcons(elem.tipoDoc),
                  ),
                  title: Text(
                    elem.title,
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
