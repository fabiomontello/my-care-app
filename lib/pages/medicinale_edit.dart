import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import '../models/medicinali.dart';
import './medicinale_edit_freq.dart';

class MedicinaleEdit extends StatefulWidget {
  @override
  _MedicinaleEditState createState() => _MedicinaleEditState();
}

class _MedicinaleEditState extends State<MedicinaleEdit> {
  bool _promemoria = true;
  String dropdownValue = 'One';
  final _nomeMed = TextEditingController();
  int _frequency = 1;
  List<DateTime> timesList = [DateFormat.Hm().parse('00:00')];
  DateTime startDate = null;
  List<bool> dOfWeek = [];

  _editAllFunc(freq, startDayDate, dOfWeekList, timelist) {
    setState(() {
      _frequency = freq;
      startDate = startDayDate;
      dOfWeek = dOfWeekList;
      timesList = timelist;
    });
  }
  // void _submitData() {
  //   if (_nomeMed.text.isEmpty) {
  //     return;
  //   }
  // }

  // void _addFrequency() {
  //   if (_frequency < 5) {
  //     setState(() {
  //       _frequency = _frequency + 1;
  //       timesList.add(DateFormat.Hm().parse('00:00'));
  //     });
  //   }
  // }

  // void _removeFrequency() {
  //   if (_frequency > 1) {
  //     setState(() {
  //       _frequency = _frequency - 1;
  //       timesList.removeLast();
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final _controller = new PageController();
    const _kDuration = const Duration(milliseconds: 300);
    const _kCurve = Curves.ease;

    List<Widget> _samplePages = [
      Container(
        padding: EdgeInsets.fromLTRB(18, 25, 18, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Container(
                    // margin: const EdgeInsets.all(15.0),
                    // padding: const EdgeInsets.all(3.0),
                    child: TextField(
                      controller: _nomeMed,
                      expands: false,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Nome del medicinale",
                        fillColor: Color(0xffBE1622),
                        hintStyle: TextStyle(color: Color(0xffBE1622)),
                        helperStyle: TextStyle(color: Color(0xffBE1622)),
                        enabledBorder: new UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffBE1622),
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffBE1622),
                            width: 2.0,
                          ),
                        ),
                      ),
                      style: TextStyle(
                        //color: Color(0xffBE1622),
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        color: Color(0xffBE1622),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30),
                  width: 60,
                  child: DropdownButton<String>(
                    items: [
                      DropdownMenuItem(
                        value: 'pills',
                        child: Icon(
                          FontAwesomeIcons.pills,
                          color: Theme.of(context).primaryColor,
                          size: 35,
                        ),
                      ),
                      DropdownMenuItem(
                        value: 'mobile',
                        child: Icon(
                          FontAwesomeIcons.mobile,
                          color: Theme.of(context).primaryColor,
                          size: 35,
                        ),
                      ),
                    ],
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    elevation: 4,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
              child: Row(
                children: <Widget>[
                  Text(
                    'Promemoria',
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 25,
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 50,
                    margin: EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child: Switch(
                      value: _promemoria,
                      onChanged: (val) {
                        setState(() {
                          _promemoria = val;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MedicinaleEditFreq(_editAllFunc)));
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 2, color: Theme.of(context).primaryColor)),
                child: Column(
                  children: <Widget>[
                    Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text(
                          'Frequenza',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              fontFamily: 'Ubuntu',
                              fontSize: 25,
                              color: Color(0xffBE1622)),
                        )),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: Row(
                        children: <Widget>[
                          Text(
                            _frequency.toString() + ' volte al giorno',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Orario',
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                    ),
                    for (var i = 0; i < timesList.length; i++)
                      Container(
                        height: 70,
                        child: FlatButton(
                            onPressed: () {
                              DatePicker.showTimePicker(context,
                                  showSecondsColumn: false,
                                  showTitleActions: true, onConfirm: (date) {
                                setState(() {
                                  timesList[i] = date;
                                });
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.it);
                            },
                            padding: EdgeInsets.all(0),
                            child: Text(
                              DateFormat.Hm().format(timesList[i]) + ' h',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 45),
                            )),
                      )
                  ],
                ),
              ),
            ),
            // Column(
            //   children: <Widget>[],
            // )
          ],
        ),
      ),
      Center(child: Text('Page 2'))
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text(
          'Aggiungi medicinale',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: PageView.builder(
              controller: _controller,
              itemCount: _samplePages.length,
              itemBuilder: (BuildContext context, int index) {
                return _samplePages[index % _samplePages.length];
              },
            ),
          ),
          Container(
            color: Colors.lightBlueAccent,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  child: Text('Prev'),
                  onPressed: () {
                    _controller.previousPage(
                        duration: _kDuration, curve: _kCurve);
                  },
                ),
                FlatButton(
                  child: Text('Next'),
                  onPressed: () {
                    _controller.nextPage(duration: _kDuration, curve: _kCurve);
                  },
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: Builder(
        builder: (context) => FlatButton(
          onPressed: () {
            if (_nomeMed.text.toString() == '') {
              final snackBar = SnackBar(
                content: Text('Inserisci il nome del medicinale'),
                backgroundColor: Color(0xffBE1622),
                duration: Duration(seconds: 3),
              );
              //Navigator.of(context).pushReplacementNamed('/home');
              final scaffold = Scaffold.of(context);
              // Find the Scaffold in the widget tree and use it to show a SnackBar.
              scaffold.showSnackBar(snackBar);
            } else {
              Navigator.of(context).pushReplacementNamed('/home', arguments: {
                'type': 'medicinale',
                'object': new Medicinale(
                  frequency: _frequency,
                  icon: dropdownValue,
                  id: DateTime.now().toString(),
                  promemoria: _promemoria,
                  title: _nomeMed.text.toString(),
                  promemoriaList: timesList,
                  startDate: startDate,
                  dOfWeek: dOfWeek,
                )
              });
            }
          },
          child: Text(
            "Applica",
            textAlign: TextAlign.right,
            style: TextStyle(
                color: Color(0xffBE1622),
                fontSize: 20,
                fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}
