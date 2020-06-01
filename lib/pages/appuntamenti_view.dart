import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'home_list.dart';
import '../models/appuntamenti.dart';

class AppuntamentiView extends StatefulWidget {
  @override
  _AppuntamentiViewState createState() => _AppuntamentiViewState();
}

class _AppuntamentiViewState extends State<AppuntamentiView>
    with TickerProviderStateMixin {
  TabController _tabController;
  Map<String, TipoApp> _evTipo = {};
  Map<DateTime, List<String>> _events = {};
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;
  int index = 0;

  //static String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);

  // Example holidays
  final Map<DateTime, List> _holidays = {
    DateTime(2021, 1, 1): ['New Year\'s Day'],
    DateTime(2021, 1, 6): ['Epiphany'],
    DateTime(2021, 2, 14): ['Valentine\'s Day'],
    DateTime(2021, 4, 21): ['Easter Sunday'],
    DateTime(2021, 4, 22): ['Easter Monday'],
  };

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

  @override
  void initState() {
    super.initState();
    DateTime data;
    final DateTime now = DateTime.now();

    if (appuntamentiList.length != 0) {
      for (Appuntamenti element in appuntamentiList) {
        print(element);
        print(element.date);
        data =
            DateTime(element.date.year, element.date.month, element.date.day);
        if (_events.containsKey(data) == false) {
          _events[data] = [];
        }
        _events[data].add(element.title);
        _evTipo[element.title] = element.tipo;
      }
    }

    _selectedEvents = _events[now] ?? [];

    _calendarController = CalendarController();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _animationController.forward();
    _tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _tabController.dispose();
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  @override

  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      locale: 'en_US',
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle:
            TextStyle().copyWith(color: Theme.of(context).primaryColor),
        holidayStyle:
            TextStyle().copyWith(color: Theme.of(context).primaryColorDark),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle:
            TextStyle().copyWith(color: Theme.of(context).primaryColor),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              color: Colors.teal[100],
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
            color: Theme.of(context).primaryColorLight,
            width: 100,
            height: 100,
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(fontSize: 16.0),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          if (holidays.isNotEmpty) {
            children.add(
              Positioned(
                right: -2,
                top: -2,
                child: _buildHolidaysMarker(),
              ),
            );
          }

          return children;
        },
      ),
      onDaySelected: (date, events) {
        _onDaySelected(date, events);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? Theme.of(context).primaryColor
            : _calendarController.isToday(date)
                ? Theme.of(context).primaryColorDark
                : Theme.of(context).primaryColorDark,
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }

  Widget _buildEventList() {
    return ListView(
      children: _selectedEvents
          .map((event) => Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 2.0, vertical: 4.0),
                child: ListTile(
                  title: Row(
                    children: <Widget>[
                      Icon(
                        Icons.fiber_manual_record,
                        color: _appIcons(_evTipo[event]),
                        size: 35,
                      ),
                      Text(
                        event.toString(),
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => print('$event tapped!'),
                ),
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(children: <Widget>[
                  Container(
                    height: 60,
                    child: TabBar(
                      tabs: [
                        Container(
                          child: new Text(
                            'Lista',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Container(
                          child: new Text(
                            'Calendario',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                      unselectedLabelColor: Colors.black,
                      indicatorColor: Theme.of(context).primaryColor,
                      labelColor: Theme.of(context).primaryColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 3.0,
                      indicatorPadding: EdgeInsets.all(10),
                      isScrollable: false,
                      controller: _tabController,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TabBarView(controller: _tabController, children: <
                          Widget>[
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              DateFormat('yyyy-MM-dd – kk:mm')
                                                  .format(elem.date),
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
                              appuntamentiList.length == 0
                                  ? Container(
                                      margin: EdgeInsets.only(bottom: 15),
                                      child: ListTile(
                                        title: Text(
                                          'Non hai ancora inserito nessun appuntamento',
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
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              // Switch out 2 lines below to play with TableCalendar's settings
                              //-----------------------
                              //_buildTableCalendar(),
                              _buildTableCalendarWithBuilders(),

                              Expanded(child: _buildEventList()),
                            ],
                          ),
                        )
                      ]),
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
