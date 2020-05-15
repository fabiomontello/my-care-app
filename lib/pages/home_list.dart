import 'package:flutter/material.dart';
import '../models/appuntamenti.dart';
import '../models/medicinali.dart';
import '../ui/red_separator.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<Medicinale> medList = [
  Medicinale(
      id: '1 every minute',
      title: 'Buscopan',
      icon: 'Icon',
      promemoria: true,
      frequency: 3,
      promemoriaList: [DateTime.now(), DateTime.now(), DateTime.now()],
      startDate: DateTime.now(),
      dOfWeek: [true, true, true, true, true, true, true],
      applicazione: true,
      applicazioneDose: 5,
      applicazioneDurata: 10,
      scorte: true,
      scorteQuantita: 50,
      scorteAlert: true),
];

List<Appuntamenti> appuntamentiList = [
  Appuntamenti(
    title: 'Visita Froscio',
    icon: 'Icon1',
    promemoria: true,
    date: DateTime.now(),
  ),
];

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    if (arguments != null) {
      if (arguments['type'] == 'medicinale') {
        if (!medList.contains(arguments['object'])) {
          medList.add(arguments['object']);
        }
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
                        FontAwesomeIcons.pills,
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
                  return Container(
                    child: ListTile(
                      leading: Icon(
                        FontAwesomeIcons.checkCircle,
                        color: Colors.green,
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
                        DateFormat.yMMMd().format(elem.date),
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
