import 'package:flutter/material.dart';

class DocumentoEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aggiungi documento'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Titolo Documento'),
                    ),
                  ),
                ),
                //DropdownButton(items: [DropdownB], onChanged: null)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
