import 'package:flutter/foundation.dart';

class Medicinale {
  final String id;
  final String title;
  final String icon;
  final bool promemoria; 
  final int frequency;
  final DateTime startDate;
  final List<DateTime> promemoriaList;
  final List<bool> dOfWeek;

  const Medicinale({
    @required this.id,
    @required this.title,
    @required this.icon,
    @required this.promemoria,
    @required this.frequency,
    @required this.promemoriaList,
    @required this.startDate,
    @required this.dOfWeek,
  });
}
 

