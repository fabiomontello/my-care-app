import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'home_list.dart';
import 'package:intl/intl.dart';
import '../models/appuntamenti.dart';

class AppuntamentiView extends StatefulWidget {
  @override
  _AppuntamentiViewState createState() => _AppuntamentiViewState();
}

class _AppuntamentiViewState extends State<AppuntamentiView> {
  static final _calendarController = CalendarController();
  final _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  int index = 0;
  static DateTime now = DateTime.now();
  static String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

  static _appIcons(val) {
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

  List<Widget> _samplePages = [
    Container(
      child: Column(
        children: [
          ...appuntamentiList.map((elem) {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(15, 18, 15, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
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
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          formattedDate,
                          //DateFormat.yMMMd().format(elem.date),
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            fontSize: 16,
                          ),
                        ),
                        Text(elem.note)
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    ),
    TableCalendar(
      calendarController: _calendarController,
    )
  ];

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              height: 60,
              color: Colors.lightBlueAccent,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: index == 0 ? Colors.grey[50] : Colors.white,
                      height: 60,
                      child: FlatButton(
                        child: Text('Lista'),
                        onPressed: () {
                          setState(() {
                            index = 0;
                          });
                          _controller.previousPage(
                              duration: _kDuration, curve: _kCurve);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: index == 1 ? Colors.grey[50] : Colors.white,
                      height: 60,
                      child: FlatButton(
                        child: Text('Calendario'),
                        onPressed: () {
                          setState(() {
                            index = 1;
                          });
                          _controller.nextPage(
                              duration: _kDuration, curve: _kCurve);
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: _controller,
                itemCount: _samplePages.length,
                itemBuilder: (BuildContext context, int index) {
                  return _samplePages[index % _samplePages.length];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//https://pub.dev/packages/table_calendar#-readme-tab-
