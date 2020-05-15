import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../ui/red_separator.dart';
import '../models/medicinali.dart';

class MedicinaliView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final argum = ModalRoute.of(context).settings.arguments as Map;
    Medicinale med = argum['object'];
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
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
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(15, 18, 15, 40),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Ubuntu',
                    // fontWeight: FontWeight.bold, here for both
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Note',
                    
                    ),
                    TextSpan(
                      text: 'Antidolorifico',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Ubuntu',
                        //fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
            ),
            RedSeparator(),
          ],
        ),
      ),
    );
  }
}
