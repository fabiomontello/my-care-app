import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import '../models/appuntamenti.dart';

class AppuntamentoEdit extends StatefulWidget {
  @override
  _AppuntamentoEditState createState() => _AppuntamentoEditState();
}

class _AppuntamentoEditState extends State<AppuntamentoEdit> {
  final _nomeApp = TextEditingController();
  final _noteController = TextEditingController();
  String dropdownValue = 'One';
  bool _promemoria = false;
  DateTime dataAppuntamento = DateTime.now();
  int _alertBefore = 5;

  void _addAlert() {
    if (_alertBefore < 45) {
      setState(() {
        _alertBefore = _alertBefore + 5;
      });
    }
  }

  void _removeAlert() {
    if (_alertBefore > 5) {
      setState(() {
        _alertBefore = _alertBefore - 5;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text(
          'Aggiungi appuntamento',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Container(
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
                      controller: _nomeApp,
                      expands: false,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: "Titolo appuntamento",
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
                    'Inizio',
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: FlatButton(
                  onPressed: () {
                    DatePicker.showDateTimePicker(context,
                        minTime: DateTime.now(),
                        showTitleActions: true, onConfirm: (date) {
                      setState(() {
                        dataAppuntamento = date;
                      });
                    }, currentTime: DateTime.now(), locale: LocaleType.it);
                  },
                  padding: EdgeInsets.all(0),
                  child: Text(
                    DateFormat('dd MMM yyyy hh:mm').format(dataAppuntamento) +
                        ' h',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      decoration: TextDecoration.underline,
                    ),
                  )),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
              child: Row(
                children: <Widget>[
                  Text(
                    'Avvisami',
                    style: TextStyle(
                      fontFamily: 'Ubuntu',
                      fontSize: 25,
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 50,
                    margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
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
            _promemoria? Container(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 60,
                    child: RawMaterialButton(
                      onPressed: _removeAlert,
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
                    _alertBefore.toString(),
                    style: TextStyle(fontSize: 25),
                  ),
                  Container(
                    width: 60,
                    child: RawMaterialButton(
                      onPressed: _addAlert,
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
                    'minuti prima',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ):SizedBox.shrink(),
            TextField(
              autofocus: false,
              controller: _noteController,
              keyboardType: TextInputType.multiline,
              minLines: 3,
              maxLines: 3,
              decoration: new InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 5.0),
                ),
            ),)

            // Column(
            //   children: <Widget>[],
            // )
          ],
        ),
      ),
    );
  }
}
