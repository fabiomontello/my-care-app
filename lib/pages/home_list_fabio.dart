import 'package:flutter/material.dart';
import '../models/appuntamenti.dart';
import '../models/medicinali.dart';
import '../ui/red_separator.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  final List<Medicinale> medList = [
    Medicinale(
      id: 't1',
      title: 'Buscopan',
      icon: 'Icon',
      promemoria: true,
      frequancy: 3,
    ),
    Medicinale(
      id: 't2',
      title: 'Snip',
      icon: 'Icon1',
      promemoria: true,
      frequancy: 2,
    ),
    Medicinale(
      id: 't1',
      title: 'Maldiculón',
      icon: 'Icon',
      promemoria: true,
      frequancy: 3,
    ),
    Medicinale(
      id: 't1',
      title: 'Tanto maldiculón',
      icon: 'Icon',
      promemoria: true,
      frequancy: 3,
    ),
    Medicinale(
      id: 't1',
      title: 'Troppo maldiculón',
      icon: 'Icon',
      promemoria: true,
      frequancy: 3,
    ),
  ];

  final List<Appuntamenti> appuntamentiList = [
    Appuntamenti(
      title: 'Visita Froscio',
      icon: 'Icon1',
      promemoria: true,
      date: DateTime.now(),
    ),
    Appuntamenti(
      title: 'Visita Froscio',
      icon: 'Icon1',
      promemoria: true,
      date: DateTime.now(),
    ),
    Appuntamenti(
      title: 'Visita Froscio',
      icon: 'Icon1',
      promemoria: true,
      date: DateTime.now(),
    ),
    Appuntamenti(
      title: 'Visita Froscio',
      icon: 'Icon1',
      promemoria: true,
      date: DateTime.now(),
    ),
    Appuntamenti(
      title: 'Visita Froscio',
      icon: 'Icon1',
      promemoria: true,
      date: DateTime.now(),
    ),
    Appuntamenti(
      title: 'Visita Froscio',
      icon: 'Icon1',
      promemoria: true,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListTile(
                //  trailing: Icon(
                //    FontAwesomeIcons.pills,
                // ),
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
                        elem.id,
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
                  //textAlign: TextAlign.left,
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
                        DateFormat.yMMMd().format(elem.date),
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
              }).toList(),
              // ListView.builder(
                
              //   itemCount: medList.length,
              //   itemBuilder: (context, index) {
              //     return Container(
                    
              //       child: ListTile(
                      
              //         leading: Icon(
              //           FontAwesomeIcons.pills,
              //           color: Theme.of(context).primaryColor,
              //         ),
              //         title: Text(
              //           medList[index].title,
              //           style: TextStyle(
              //             fontFamily: 'Ubuntu',
              //             fontWeight: FontWeight.bold,
              //             fontSize: 16,
              //           ),
              //         ), 
              //         subtitle: Text(
              //           medList[index].id,
              //           style: TextStyle(
              //             fontFamily: 'Ubuntu',
              //             fontSize: 16,
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              //   shrinkWrap: true,
              // ),
            ],
          ),
        ),
// ////////////////////////////////////////////////////

        // Column(
        //   children: <Widget>[
        //     ListTile(
        //       title: Text(
        //         'I tuoi appuntamenti',
        //         //textAlign: TextAlign.left,
        //         style: TextStyle(
        //           fontSize: 18,
        //           fontFamily: 'Ubuntu',
        //           fontWeight: FontWeight.bold,
        //           color: Color(0xffBE1622),
        //         ),
        //       ),
        //     ),
        //     ListView.builder(
        //       itemCount: appuntamentiList.length,
        //       itemBuilder: (context, index) {
        //         return Container(
        //           // elevation: 5,
        //           margin: EdgeInsets.symmetric(
        //             horizontal: 5,
        //           ),
        //           child: ListTile(
        //             leading: Icon(
        //               FontAwesomeIcons.checkCircle,
        //               color: Colors.green,
        //             ),
        //             title: Text(
        //               appuntamentiList[index].title,
        //               style: TextStyle(
        //                 fontFamily: 'Ubuntu',
        //                 fontWeight: FontWeight.bold,
        //                 fontSize: 16,
        //               ),
        //             ),
        //             subtitle: Text(
        //               DateFormat.yMMMd().format(appuntamentiList[index].date),
        //               style: TextStyle(
        //                 fontFamily: 'Ubuntu',
        //                 fontSize: 16,
        //               ),
        //             ),
        //           ),
        //         );
        //       },
        //       shrinkWrap: true,
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
