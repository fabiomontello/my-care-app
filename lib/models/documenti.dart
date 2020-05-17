import 'package:flutter/foundation.dart';

enum TipoDoc { fotoVideo, audio, documento }

class Documenti {
  final String id;
  final String title;
  final TipoDoc tipoDoc;
  final String note;

  Documenti({@required this.id, 
            @required this.title, 
            @required this.tipoDoc,
            @required this.note});
}
//bilu
