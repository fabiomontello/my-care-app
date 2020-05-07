import 'package:flutter/material.dart';

class MedicinaleEdit extends StatefulWidget {
  @override
  _MedicinaleEditState createState() => _MedicinaleEditState();
}

class _MedicinaleEditState extends State<MedicinaleEdit> {
  bool _promemoria = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aggiungi medicinale'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Promemoria',
            style: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 16,
            ),
          ),
          Switch(
              value: _promemoria,
              onChanged: (val) {
                setState(() {
                  _promemoria = val;
                });
              })
        ],
      ),
    );
  }
}
