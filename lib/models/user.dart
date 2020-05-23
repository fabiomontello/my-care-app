import 'package:flutter/foundation.dart' show required;

class User {
  final int idUser;
  String id;
  String nome;
  String cognome;
  DateTime data;
  String img;

  User({
    @required this.idUser,
    this.id,
    this.nome,
    this.cognome,
    this.data,
    this.img
  });

}
