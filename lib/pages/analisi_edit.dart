import 'package:flutter/material.dart';

class AnalisiEdit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text(
          'Aggiungi analisi',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Container( 
        child: Text('Text'),
      ),
    );
  }
}
