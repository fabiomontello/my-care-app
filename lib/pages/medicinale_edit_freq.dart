import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class MedicinaleEditFreq extends StatefulWidget {
  final Function editallFunc;

  MedicinaleEditFreq(this.editallFunc);

  @override
  _MedicinaleEditFreqState createState() =>
      _MedicinaleEditFreqState(editallFunc);
}

class _MedicinaleEditFreqState extends State<MedicinaleEditFreq> {
  final Function editallFunc;
  _MedicinaleEditFreqState(this.editallFunc);
  DateTime dataAppuntamento = DateTime.now();
  int frequency = 1;
  List<TimeOfDay> timesList = [
    TimeOfDay.fromDateTime(DateFormat.Hm().parse('00:00'))
  ];
  List<bool> weekCheck = [true, true, true, true, true, true, true];
  bool allNone = true;

  void _addFrequency() {
    if (frequency < 4) {
      setState(() {
        frequency = frequency + 1;
        timesList.add(TimeOfDay.fromDateTime(DateFormat.Hm().parse('00:00')));
      });
    }
  }

  void _removeFrequency() {
    if (frequency > 1) {
      setState(() {
        frequency = frequency - 1;
        timesList.removeLast();
      });
    }
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2022),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        dataAppuntamento = pickedDate;
      });
    });
    print('...');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text(
          'Modifica frequenza',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Ubuntu',
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: Column(
          children: <Widget>[
            Container(
                width: double.infinity,
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Frequenza Applicazione',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // decoration: TextDecoration.underline,
                      fontFamily: 'Ubuntu',
                      fontSize: 30,
                      color: Color(0xffBE1622)),
                )),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: FlatButton(
                  onPressed: _presentDatePicker,
                  padding: EdgeInsets.all(0),
                  child: Text(
                    'Data inizio: ' +
                        DateFormat('dd MMM yyyy').format(dataAppuntamento),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Ubuntu',
                      // fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  )),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 60,
                    child: RawMaterialButton(
                      onPressed: _removeFrequency,
                      elevation: 2.0,
                      fillColor: Colors.white,
                      child: Icon(
                        FontAwesomeIcons.minus,
                        size: 15.0,
                      ),
                      padding: EdgeInsets.all(5.0),
                      shape: CircleBorder(),
                    ),
                  ),
                  Text(
                    frequency.toString(),
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                  Container(
                    width: 60,
                    child: RawMaterialButton(
                      onPressed: _addFrequency,
                      elevation: 2.0,
                      fillColor: Colors.white,
                      child: Icon(
                        FontAwesomeIcons.plus,
                        size: 15.0,
                      ),
                      padding: EdgeInsets.all(5.0),
                      shape: CircleBorder(),
                    ),
                  ),
                  Text(
                    'volte al giorno',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  Text(
                    'Tutti i giorni',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                  Checkbox(
                      value: allNone,
                      onChanged: (boo) {
                        setState(() {
                          if (allNone) {
                            allNone = false;
                            weekCheck = [
                              false,
                              false,
                              false,
                              false,
                              false,
                              false,
                              false
                            ];
                          } else {
                            allNone = true;
                            weekCheck = [
                              true,
                              true,
                              true,
                              true,
                              true,
                              true,
                              true
                            ];
                          }
                        });
                      }),
                ],
              ),
            ),
            Row(children: <Widget>[
              Expanded(
                child: Checkbox(
                    value: weekCheck[0],
                    onChanged: (boo) {
                      setState(() {
                        weekCheck[0] = !weekCheck[0];
                      });
                    }),
              ),
              Expanded(
                child: Checkbox(
                    value: weekCheck[1],
                    onChanged: (boo) {
                      setState(() {
                        weekCheck[1] = !weekCheck[1];
                      });
                    }),
              ),
              Expanded(
                child: Checkbox(
                    value: weekCheck[2],
                    onChanged: (boo) {
                      setState(() {
                        weekCheck[2] = !weekCheck[2];
                      });
                    }),
              ),
              Expanded(
                child: Checkbox(
                    value: weekCheck[3],
                    onChanged: (boo) {
                      setState(() {
                        weekCheck[3] = !weekCheck[3];
                      });
                    }),
              ),
              Expanded(
                child: Checkbox(
                    value: weekCheck[4],
                    onChanged: (boo) {
                      setState(() {
                        weekCheck[4] = !weekCheck[4];
                      });
                    }),
              ),
              Expanded(
                child: Checkbox(
                    value: weekCheck[5],
                    onChanged: (boo) {
                      setState(() {
                        weekCheck[5] = !weekCheck[5];
                      });
                    }),
              ),
              Expanded(
                child: Checkbox(
                    value: weekCheck[6],
                    onChanged: (boo) {
                      setState(() {
                        weekCheck[6] = !weekCheck[6];
                      });
                    }),
              )
            ]),
            Container(
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: Text(
                    'L',
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: Text(
                    'M',
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: Text(
                    'M',
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: Text(
                    'G',
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: Text(
                    'V',
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: Text(
                    'S',
                    textAlign: TextAlign.center,
                  )),
                  Expanded(
                      child: Text(
                    'D',
                    textAlign: TextAlign.center,
                  )),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) => FlatButton(
          onPressed: () {
            editallFunc(frequency, dataAppuntamento, weekCheck, timesList);
            Navigator.of(context).pop();
          },
          child: Text(
            "Applica",
            textAlign: TextAlign.right,
            style: TextStyle(
                color: Color(0xffBE1622),
                fontSize: 20,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}
