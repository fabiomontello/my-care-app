import 'package:flutter/material.dart';
import '../models/analisi.dart';

var anList = {
  'Analisi colesterolo': [],
  'Analisi del sangue': [
    Analisi(id: 'something', titolo: 'analisi', note: 'something else')
  ]
};

class AnalisiPage extends StatefulWidget {
  @override
  _AnalisiPageState createState() => _AnalisiPageState();
}

class _AnalisiPageState extends State<AnalisiPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 18, 15, 0),
      child: Column(children: <Widget>[
        ...anList.keys.map((e) => Column(
              children: <Widget>[
                ListTile(
                  dense: true,
                  title: Text(
                    e.toString(),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      color: Color(0xffBE1622),
                    ),
                  ),
                ),
                Column(children: <Widget>[
                  ...anList[e].map((elem) => Container(
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).pushNamed('/analisi/view',
                                arguments: {
                                  'object': elem,
                                  'cat': e,
                                  'fun': (){setState(() {});}
                                });
                          },
                          title: Text(
                            elem.titolo,
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: elem.note != ''
                              ? Text(
                                  elem.note,
                                  style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    fontSize: 16,
                                  ),
                                )
                              : null,
                        ),
                      ))
                ])
              ],
            ))
      ]),
    );
  }
}
