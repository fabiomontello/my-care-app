import 'package:flutter/foundation.dart' show required;

class User {
  final int idUser;
  String id;
  String nome;
  String cognome;
  DateTime data;
  String img;
  String pw;
  String email;

  User({
    @required this.idUser,
    this.id,
    this.nome,
    this.cognome,
    this.data,
    this.img,
    this.pw,
    this.email
  });

}
