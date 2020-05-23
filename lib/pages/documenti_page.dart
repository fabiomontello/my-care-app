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

_docType(val) {
  switch (val) {
    case TipoDoc.fotoVideo:
      return 'fotovideo';
    case TipoDoc.documento:
      return 'documento';
    case TipoDoc.audio:
      return 'audio';
  }
  return 'documento';
}

class _DocumentiPageState extends State<DocumentiPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  // padding: EdgeInsets.only(left:20),
                  child: Text(
                    'Foto/Video',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                ...docuList.map((elem) {
                  return _docType(elem.tipoDoc) == 'fotovideo'
                      ? Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                '/medicinale/view',
                                arguments: {'object': elem},
                              );
                            },
                            leading: Icon(
                              Icons.fiber_manual_record,
                              color: _docIcons(elem.tipoDoc),
                            ),
                            title: Text(
                              elem.title,
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                      // (condition) ? something happened : something elese
//                if (condition) {
// something happend
//                }
//                else {
//                  something else
//                }
                      : SizedBox.shrink();
                }).toList(),
                Container(
                  child: Text(
                    'Audio',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                ...docuList.map((elem) {
                  return _docType(elem.tipoDoc) == 'audio'
                      ? Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                '/medicinale/view',
                                arguments: {'object': elem},
                              );
                            },
                            leading: Icon(
                              Icons.fiber_manual_record,
                              color: _docIcons(elem.tipoDoc),
                            ),
                            title: Text(
                              elem.title,
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink();
                }).toList(),
                Container(
                  // margin: EdgeInsets.only(bottom:),
                  child: Text(
                    'Documenti',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                ...docuList.map((elem) {
                  return _docType(elem.tipoDoc) == ''
                      ? Container(
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                '/medicinale/view',
                                arguments: {'object': elem},
                              );
                            },
                            leading: Icon(
                              Icons.fiber_manual_record,
                              color: _docIcons(elem.tipoDoc),
                            ),
                            title: Text(
                              elem.title,
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink();
                }).toList()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
