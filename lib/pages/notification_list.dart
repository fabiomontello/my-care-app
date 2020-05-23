import 'package:flutter/material.dart';
import './home_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/medicinali.dart';
import '../models/analisi.dart';

class Notifica {
  final IconData icona;
  final String titolo;
  final String sottotitolo;
  final String oradata;

  Notifica(
      {@required this.icona,
      @required this.titolo,
      @required this.sottotitolo,
      @required this.oradata});
}

class NotificationList extends StatelessWidget {
  IconData _medIcons(val) {
    switch (val) {
      case TipoMedicinale.compresse:
        return FontAwesomeIcons.pills;
      case TipoMedicinale.goccie:
        return FontAwesomeIcons.tint;
      case TipoMedicinale.pillole:
        return FontAwesomeIcons.tablets;
    }
    return FontAwesomeIcons.pills;
  }

  List<Notifica> notifList = [];

  @override
  Widget build(BuildContext context) {
    for (var elem in medList) {
      for (var time in elem.promemoriaList) {
        int diffe = (time.hour - TimeOfDay.now().hour);
        notifList.add(Notifica(
            icona: _medIcons(elem.icon),
            titolo: elem.title,
            sottotitolo: diffe > 0 ? 'In' + diffe.toString()+' ore': '' + diffe.abs().toString()+' ore fa',
            oradata: time.hour.toString().padLeft(2, '0') +
                ':' +
                time.minute.toString().padLeft(2, '0')));
      }
    }
    // for (var elem in appuntamentiList) {
    //     int diffe = (time.hour - TimeOfDay.now().hour);
    //     notifList.add(Notifica(
    //         icona: _medIcons(elem.icon),
    //         titolo: elem.title,
    //         sottotitolo: diffe > 0 ? 'In' + diffe.toString()+' ore': '' + diffe.abs().toString()+' ore fa',
    //         oradata: time.hour.toString().padLeft(2, '0') +
    //             ':' +
    //             time.minute.toString().padLeft(2, '0')));
    // }
    return Container(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.fromLTRB(15, 24, 15, 0),
            child: Column(
              children: <Widget>[
                ListTile(
                  dense: true,
                  title: Text(
                    'Notifiche',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      color: Color(0xffBE1622),
                    ),
                  ),
                ),
                ...notifList.map((elem) {
                  return Container(
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed('/medicinale/view',
                            arguments: {'object': elem});
                      },
                      leading: Icon(
                        elem.icona,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            elem.titolo,
                            style: TextStyle(
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(elem.oradata,
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ))
                        ],
                      ),
                      subtitle: Text(
                        elem.sottotitolo.toString(),
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                }).toList()
              ],
            )),
      ),
    );
  }
}
