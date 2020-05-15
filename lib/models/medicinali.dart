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
  final bool applicazione;
  final int applicazioneDose;
  final int applicazioneDurata;
  final bool scorte;
  final int scorteQuantita;
  final bool scorteAlert;

  const Medicinale({
    @required this.id,
    @required this.title,
    @required this.icon,
    @required this.promemoria,
    @required this.frequency,
    @required this.promemoriaList,
    @required this.startDate,
    @required this.dOfWeek,
    @required this.applicazione,
    @required this.applicazioneDose,
    @required this.applicazioneDurata,
    @required this.scorte,
    @required this.scorteQuantita,
    @required this.scorteAlert,
  });
}
 

