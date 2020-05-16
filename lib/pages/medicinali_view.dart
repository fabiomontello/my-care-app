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

  Widget build(BuildContext context) {
    final argum = ModalRoute.of(context).settings.arguments as Map;
    Medicinale med = argum['object'];
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text(
          'Informazioni medicinale',
          style: TextStyle(color: Colors.white, fontSize: 20),
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
                'Here will be the elem, no ? And I have to write more so I can se how it goes.',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 18,
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
                    'Antodolorifico',
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
                      text: ' su Buscopan',
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
                    onPressed: null,
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
                      onPressed: null)
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
            size: 50,
          ),
          onPressed: () {}),
    );
  }
}
