import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import '../models/medicinali.dart';

class MedicinaleEdit extends StatefulWidget {
  @override
  _MedicinaleEditState createState() => _MedicinaleEditState();
}

class _MedicinaleEditState extends State<MedicinaleEdit> {
  bool _promemoria = false;
  String dropdownValue = 'One';
  final _nomeMed = TextEditingController();
  int _frequency = 1;
  List<DateTime> timesList = [DateFormat.Hm().parse('00:00')];

  void _submitData() {
    if (_nomeMed.text.isEmpty) {
      return;
    }
  }

  void _addFrequency() {
    if (_frequency < 5) {
      setState(() {
        _frequency = _frequency + 1;
        timesList.add(DateFormat.Hm().parse('00:00'));
      });
    }
  }

  void _removeFrequency() {
    if (_frequency > 0) {
      setState(() {
        _frequency = _frequency - 1;
        timesList.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aggiungi medicinale'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(14, 20, 14, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    child: TextField(
                      controller: _nomeMed,
                      expands: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: "User"),
                      style: TextStyle(
                        //color: Color(0xffBE1622),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  child: DropdownButton<String>(
                    items: [
                      DropdownMenuItem(
                        child: Icon(
                          FontAwesomeIcons.pills,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      DropdownMenuItem(
                        child: Icon(
                          FontAwesomeIcons.pills,
                          color: Theme.of(context).primaryColor,
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
            Row(
              children: <Widget>[
                Text(
                  'Promemoria',
                  style: TextStyle(
                    fontFamily: 'Ubuntu',
                    fontSize: 20,
                  ),
                ),
                Switch(
                  value: _promemoria,
                  onChanged: (val) {
                    setState(() {
                      _promemoria = val;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: <Widget>[
                RawMaterialButton(
                  onPressed: _removeFrequency,
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Icon(
                    FontAwesomeIcons.minus,
                    size: 25.0,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
                Text(_frequency.toString()),
                RawMaterialButton(
                  onPressed: _addFrequency,
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Icon(
                    FontAwesomeIcons.plus,
                    size: 25.0,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                )
              ],
            ),
            Column(
              children: <Widget>[
                for (var i = 0; i < timesList.length; i++)
                  FlatButton(
                      onPressed: () {
                        DatePicker.showTimePicker(context,
                            showSecondsColumn: false,
                            showTitleActions: true, onConfirm: (date) {
                          setState(() {
                            timesList[i] = date;
                          });
                        }, currentTime: DateTime.now(), locale: LocaleType.it);
                      },
                      child: Text(
                        DateFormat.Hm().format(timesList[i]),
                        style: TextStyle(color: Colors.blue),
                      ))
              ],
            )
          ],
        ),
      ),
      // ),
      floatingActionButton: FlatButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('/home', arguments: {
            'type': 'medicinale',
            'object': new Medicinale(
                frequency: _frequency,
                icon: dropdownValue,
                id: DateTime.now().toString(),
                promemoria: _promemoria,
                title: _nomeMed.text.toString(),
                promemoriaList: timesList)
          });
        },
        child: Text(
          "Aggiungi",
          textAlign: TextAlign.right,
          style: TextStyle(
              color: Color(0xffBE1622),
              fontSize: 20,
              fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
