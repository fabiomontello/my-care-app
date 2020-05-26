import 'package:flutter/material.dart';
import './home_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/medicinali.dart';
import '../models/appuntamenti.dart';

class Notifica {
  final Icon icona;
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

  _appIcons(val) {
    switch (val) {
      case TipoApp.rosso:
        return Colors.redAccent;
      case TipoApp.blue:
        return Colors.blueAccent;
      case TipoApp.verde:
        return Colors.greenAccent;
    }
    return Colors.white;
  }

  List<Notifica> notifListNext = [];
  List<Notifica> notifListBef = [];

  @override
  Widget build(BuildContext context) {
    for (var elem in medList) {
      for (var time in elem.promemoriaList) {
        int diffe = (time.hour - TimeOfDay.now().hour);
        diffe > 0
            ? notifListNext.add(Notifica(
                icona: Icon(
                  _medIcons(elem.icon),
                  color: Theme.of(context).primaryColor,
                  size: 35,
                ),
                titolo: elem.title,
                sottotitolo: 'In' + diffe.toString() + ' ore',
                oradata: time.hour.toString().padLeft(2, '0') +
                    ':' +
                    time.minute.toString().padLeft(2, '0')))
            : notifListBef.add(Notifica(
                icona: Icon(
                  _medIcons(elem.icon),
                  color: Theme.of(context).primaryColor,
                  size: 35,
                ),
                titolo: elem.title,
                sottotitolo: '' + diffe.abs().toString() + ' ore fa',
                oradata: time.hour.toString().padLeft(2, '0') +
                    ':' +
                    time.minute.toString().padLeft(2, '0')));
      }
    }
    for (var elem in appuntamentiList) {
      int diffe = elem.date.difference(DateTime.now()).inHours;
      int diffeDay = elem.date.difference(DateTime.now()).inDays;
      String sotto = '';
      bool past = false;
      if (diffeDay == 0) {
        if (diffe < 0) {
          sotto = '' + diffe.toString() + ' ore fa';
          past = true;
        } else if (diffe == 0) {
          sotto = 'Ora';
          past = false;
        } else {
          sotto = 'In ' + diffe.toString() + ' ore';
        }
      } else if (diffeDay == -1) {
        sotto = 'Ieri';
        past = true;
      } else if (diffeDay == 1) {
        sotto = 'Domani';
      } else if (diffeDay <= -2) {
        sotto = '' + diffeDay.abs().toString() + ' giorni fa';
        past = true;
      } else if (diffeDay >= 2) {
        sotto = 'Tra ' + diffeDay.toString() + ' giorni';
      }
      if (past) {
        notifListBef.add(Notifica(
            icona: Icon(
              Icons.fiber_manual_record,
              color: _appIcons(elem.tipo),
              size: 35,
            ),
            titolo: elem.title,
            sottotitolo: sotto,
            oradata: elem.date.hour.toString().padLeft(2, '0') +
                ':' +
                elem.date.minute.toString().padLeft(2, '0') +
                ' ' +
                elem.date.day.toString().padLeft(2, '0') +
                '/' +
                elem.date.month.toString().padLeft(2, '0')));
      } else {
        notifListNext.add(Notifica(
            icona: Icon(
              Icons.fiber_manual_record,
              color: _appIcons(elem.tipo),
              size: 35,
            ),
            titolo: elem.title,
            sottotitolo: sotto,
            oradata:  elem.date.hour.toString().padLeft(2, '0') +
                ':' +
                elem.date.minute.toString().padLeft(2, '0') +
                ' ' +
                elem.date.day.toString().padLeft(2, '0') +
                '/' +
                elem.date.month.toString().padLeft(2, '0')));
      }

      // int diffe = (time.hour - TimeOfDay.now().hour);
      // notifList.add(Notifica(
      //     icona: _medIcons(elem.icon),
      //     titolo: elem.title,
      //     sottotitolo: diffe > 0 ? 'In' + diffe.toString()+' ore': '' + diffe.abs().toString()+' ore fa',
      //     oradata: time.hour.toString().padLeft(2, '0') +
      //         ':' +
      //         time.minute.toString().padLeft(2, '0')));
    }
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
                ListTile(
                  dense: true,
                  title: Text(
                    'Nuove',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      color: Color(0xffBE1622),
                    ),
                  ),
                ),
                ...notifListNext.map((elem) {
                  return Container(
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed('/medicinale/view',
                            arguments: {'object': elem});
                      },
                      leading: elem.icona,
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
                }).toList(),
                notifListNext.length == 0
                    ? ListTile(
                        title: Text(
                          'Non hai ancora inserito nessun appuntamento',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
                ListTile(
                  dense: true,
                  title: Text(
                    'Precedenti',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      color: Color(0xffBE1622),
                    ),
                  ),
                ),
                ...notifListBef.map((elem) {
                  return Container(
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed('/medicinale/view',
                            arguments: {'object': elem});
                      },
                      leading: elem.icona,
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
                }).toList(),
                notifListBef.length == 0
                    ? ListTile(
                        title: Text(
                          'Non hai ancora inserito nessun appuntamento',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
              ],
            )),
      ),
    );
  }
}
