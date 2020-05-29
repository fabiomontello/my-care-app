import 'package:flutter/material.dart';
import 'package:my_care/ui/red_separator.dart';

class ImpostazioniPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 18, 15, 0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    dense: true,
                    title: Text(
                      'Impostazioni',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                        color: Color(0xffBE1622),
                      ),
                    ),
                  ),
                  RedSeparator(),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      'Privacy e sicurezza',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        //fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      'Notifiche',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        //fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text(
                      'Informazioni',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        //fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}