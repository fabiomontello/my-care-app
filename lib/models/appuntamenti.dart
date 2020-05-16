import 'package:flutter/foundation.dart';
enum Frequency {
  None,
  Dayly,
  Weekly,
  TwoWeek,
  Monthly,
  TwoMonths,
  ThreeMonths,
  FourMonths,
  SixMonths,
  Year,
}
enum TipoApp{
  blue,
  rosso,
  verde
}
class Appuntamenti {
  final String id;
  final String title;
  final bool promemoria;
  final DateTime date;
  final Frequency repeatAppointment;
  final int promemoriaTime;
  final TipoApp tipo;
  final String note;


  const Appuntamenti({
    @required this.id,
    @required this.title,
    @required this.promemoria,
    @required this.date,
    @required this.repeatAppointment,
    @required this.promemoriaTime,
    @required this.tipo,
    @required this.note
  });
}