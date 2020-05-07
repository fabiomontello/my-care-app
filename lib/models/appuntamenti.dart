import 'package:flutter/foundation.dart';

class Appuntamenti {
  final String title;
  final String icon; 
  final bool promemoria;
  final DateTime date;

  const Appuntamenti({
    @required this.title,
    @required this.icon,
    @required this.promemoria,
    @required this.date
  });
}