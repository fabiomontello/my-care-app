import 'package:flutter/material.dart';
import '../models/analisi.dart';
import '../ui/red_separator.dart';

class AnalisiView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final argum = ModalRoute.of(context).settings.arguments as Map;
    Analisi med = argum['object'];

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
                title: Text(
                  med.titolo,
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xffBE1622),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(60.0)),
                onPressed: () {},
                child: Text(
                  'Visualizza il documento',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Ubuntu',
                  ),
                ),
                color: Color(0xffBE1622),
              ),
            ),
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
            size: 40,
          ),
          onPressed: () {}),
    );
  }
}
