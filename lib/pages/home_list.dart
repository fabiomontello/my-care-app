import 'package:flutter/material.dart';

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Column(
            children: <Widget>[
              Text('I tuoi medicinali'),
              ListView(
                shrinkWrap: true, 
                children: <Widget>[],
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: <Widget>[
              Text('I tuoi appuntamenti'),
              ListView(
                shrinkWrap: true,
                children: <Widget>[],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
