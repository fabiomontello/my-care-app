import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../ui/red_separator.dart';
import '../models/medicinali.dart';
import 'package:url_launcher/url_launcher.dart';

class MedicinaliView extends StatefulWidget {
  @override
  _MedicinaliViewState createState() => _MedicinaliViewState();
}

class _MedicinaliViewState extends State<MedicinaliView> {
  @override
// void initState() {
//     super.initState();
//     _tapRecognizer = TapGestureRecognizer();
//       ..onTap = https://www.buscopan.it/prodotti-buscopan-compresse';
//   }
  String _textQuantity(val) {
    switch (val) {
      case TipoMedicinale.compresse:
        return 'mg';
      case TipoMedicinale.goccie:
        return 'ml';
      case TipoMedicinale.pillole:
        return '';
    }
    return '';
  }

  Widget build(BuildContext context) {
    final argum = ModalRoute.of(context).settings.arguments as Map;
    Medicinale med = argum['object'];
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text(
          'Informazioni medicinale',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Ubuntu',
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(18, 25, 18, 0),
        child: Column(
          children: [
            Container(
              child: ListTile(
                trailing: Icon(
                  FontAwesomeIcons.pills,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  med.title,
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffBE1622),
                  ),
                ),
              ),
            ),
            RedSeparator(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(15, 18, 15, 0),
              child: Text(
                med.applicazioneDose.toString() +
                    ' ' +
                    _textQuantity(med.icon) +
                    ' di ' +
                    med.title +
                    ' da assumere ' +
                    med.promemoriaList.length.toString() +
                    ' al giorno' +
                    (med.applicazione
                        ? (', alle ' +
                                med.promemoriaList
                                    .map((e) =>
                                        'ore ' +
                                        e.hour.toString() +
                                        ':' +
                                        e.minute.toString())
                                    .toString()
                                    .replaceAll('(', '')
                                    .replaceAll(')', '')
                                    .replaceFirst(',', ' e',
                                        6 * med.promemoriaList.length)) +
                            '.'
                        : '.'),
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 22,
                ),
              ),
              margin: EdgeInsets.only(bottom: 20),
              //alignment: FractionalOffset.bottomCenter,
            ),
            RedSeparator(),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(15, 18, 15, 10),
                  child: Text(
                    'Note',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                  child: Text(
                    med.note == '' ? 'Nessuna nota' : med.note,
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            RedSeparator(),
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(15, 18, 15, 10),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Scopri di più',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Ubuntu',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launch(
                              'https://www.buscopan.it/prodotti-buscopan-compresse');
                        },
                    ),
                    TextSpan(
                      text: ' su ' + med.title,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Ubuntu',
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/medicinale/edit',
                          arguments: {'edit': med});
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Color(0xffBE1622),
                      size: 36,
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Color(0xffBE1622),
                        size: 36,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/home',
                            arguments: {
                              'delete': med.id
                            });
                      })
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xffBE1622),
          child: Icon(
            Icons.add,
            size: 40,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('/medicinale/edit');
          }),
    );
  }
}
