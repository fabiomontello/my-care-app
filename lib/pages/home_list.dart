import 'package:flutter/material.dart';
import '../models/appuntamenti.dart';
import '../models/medicinali.dart';
import '../ui/red_separator.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Medicinale> medList = [
  // Medicinale(
  //     id: '1 every minute',
  //     title: 'Buscopan',
  //     icon: TipoMedicinale.compresse,
  //     promemoria: true,
  //     frequency: 3,
  //     promemoriaList: [
  //       TimeOfDay.fromDateTime(DateTime.now()),
  //       TimeOfDay.fromDateTime(DateTime.now()),
  //       TimeOfDay.fromDateTime(DateTime.now())
  //     ],
  //     startDate: DateTime.now(),
  //     dOfWeek: [true, true, true, true, true, true, true],
  //     applicazione: true,
  //     applicazioneDose: 5,
  //     applicazioneDurata: 10,
  //     scorte: true,
  //     scorteQuantita: 50,
  //     scorteAlert: true,
  //     note: ''),
];

List<Appuntamenti> appuntamentiList = [
  // Appuntamenti(
  //     id: 'dentificaçion',
  //     title: 'Visita Fricalo',
  //     promemoria: true,
  //     date: DateTime.now(),
  //     repeatAppointment: Frequency.None,
  //     promemoriaTime: -1,
  //     tipo: TipoApp.rosso,
  //     note: 'Portare analisi sangue, via Milano 12, UDINE'),
];

class HomeList extends StatefulWidget {
  final Function homeSwitcher;
  HomeList(this.homeSwitcher);
  @override
  _HomeListState createState() => _HomeListState(homeSwitcher);
}

class _HomeListState extends State<HomeList> {
  final Function homeSwitcher;
  _HomeListState(this.homeSwitcher);
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

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    if (arguments != null) {
      if (arguments['type'] == 'medicinale') {
        medList.removeWhere((item) => item.id == arguments['object'].id);
        medList.add(arguments['object']);
      }
      if(arguments['delete'] != null){
        medList.removeWhere((item) => item.id == arguments['delete']);
        appuntamentiList.removeWhere((item) => item.id == arguments['delete']);
      }
      if (arguments['type'] == 'appuntamento') {
        appuntamentiList
            .removeWhere((item) => item.id == arguments['object'].id);
        appuntamentiList.add(arguments['object']);
      }
    }

    return Container(
      padding: EdgeInsets.fromLTRB(15, 18, 15, 0),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  dense: true,
                  title: Text(
                    'I tuoi medicinali',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      color: Color(0xffBE1622),
                    ),
                  ),
                ),
                ...medList.map((elem) {
                  return Container(
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).pushNamed('/medicinale/view',
                            arguments: {'object': elem});
                      },
                      leading: Icon(
                        _medIcons(elem.icon),
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text(
                        elem.title,
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        elem.frequency.toString() + ' volte al giorno',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                }).toList(),
                medList.length == 0
                    ? Container(
                        margin: EdgeInsets.only(bottom:15),
                        child: ListTile(
                          title: Text(
                            'Non hai ancora inserito nessun medicinale',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
                RedSeparator(),
                ListTile(
                  title: Text(
                    'I tuoi appuntamenti',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                      color: Color(0xffBE1622),
                    ),
                  ),
                ),
                ...appuntamentiList.map((elem) {
                  return InkWell(
                    onTap: () => homeSwitcher(6),
                    child: Container(
                      child: ListTile(
                        leading: Icon(
                          Icons.fiber_manual_record,
                          color: _appIcons(elem.tipo),
                          size: 35,
                        ),
                        title: Text(
                          elem.title,
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          DateFormat('dd MMM yy – kk:mm').format(elem.date),
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
                appuntamentiList.length == 0
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
                    : SizedBox.shrink()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
