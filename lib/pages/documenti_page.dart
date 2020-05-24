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
                ListTile(
                  dense: true,
                  title: Text(
                    'Foto e video',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      color: Color(0xffBE1622),
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
                                '/documenti/view',
                                arguments: {
                                  'object': elem,
                                  'fun': () {
                                    setState(() {});
                                  }
                                },
                              );
                            },
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
                ListTile(
                  dense: true,
                  title: Text(
                    'Audio',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      color: Color(0xffBE1622),
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
                                '/documenti/view',
                                arguments: {
                                  'object': elem,
                                  'fun': () {
                                    setState(() {});
                                  }
                                },
                              );
                            },
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
                ListTile(
                  dense: true,
                  title: Text(
                    'Documenti',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      color: Color(0xffBE1622),
                    ),
                  ),
                ),
                ...docuList.map((elem) {
                  return _docType(elem.tipoDoc) == ''
                      ? Container(
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                '/documenti/view',
                                arguments: {
                                  'object': elem,
                                  'fun': () {
                                    setState(() {});
                                  }
                                },
                              );
                            },
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
