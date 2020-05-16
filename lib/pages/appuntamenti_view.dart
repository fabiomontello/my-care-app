import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AppuntamentiView extends StatefulWidget {
  @override
  _AppuntamentiViewState createState() => _AppuntamentiViewState();
}

class _AppuntamentiViewState extends State<AppuntamentiView> {
  static final _calendarController = CalendarController();
  final _controller = new PageController();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  List<Widget> _samplePages = [
    Center(
      child: Text('Page 1'),
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
                  FlatButton(
                    child: Text('Lista'),
                    onPressed: () {
                      _controller.previousPage(
                          duration: _kDuration, curve: _kCurve);
                    },
                  ),
                  FlatButton(
                    child: Text('Calendario'),
                    onPressed: () {
                      _controller.nextPage(
                          duration: _kDuration, curve: _kCurve);
                    },
                  )
                ],
              ),
            ),
            Flexible(
              child: PageView.builder(
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
