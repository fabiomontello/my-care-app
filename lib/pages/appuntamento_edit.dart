import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:my_care/models/appuntamenti.dart';

class AppuntamentoEdit extends StatefulWidget {
  @override
  _AppuntamentoEditState createState() => _AppuntamentoEditState();
}

class _AppuntamentoEditState extends State<AppuntamentoEdit> {
  final _nomeApp = TextEditingController();
  final _noteController = TextEditingController();
  TipoApp dropdownValue = TipoApp.rosso;
  bool _promemoria = false;
  DateTime dataAppuntamento = DateTime.now();
  int _alertBefore = 5;
  Frequency ripetiApp = Frequency.None;
  final List<String> tiempo = [
    'Mai',
    'Ogni giorno',
    'Ogni settimana',
    'Due settimane',
    'Ogni mese',
    'Ogni due mesi',
    'Ogni tre mesi',
    'Ogni quattro mesi',
    'Ogni sei mesi',
    'Ogni anno'
  ];

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
      showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(DateFormat.Hm().parse('00:00')),
      ).then((pickedTime) {
        if (pickedTime == null) {
          return;
        }
        setState(() {
          dataAppuntamento = DateTime(pickedDate.year, pickedDate.month,
              pickedDate.day, pickedTime.hour, pickedTime.minute);
        });
      });
    });
  }

  List colorList = [Colors.blueAccent, Colors.redAccent, Colors.greenAccent];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text(
          'Aggiungi appuntamento',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Ubuntu',
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(18, 25, 18, 0),
        child: SingleChildScrollView(
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
                          hintStyle: TextStyle(
                            color: Color(0xffBE1622),
                            fontFamily: 'Ubuntu',
                          ),
                          helperStyle: TextStyle(
                            color: Color(0xffBE1622),
                            fontFamily: 'Ubuntu',
                          ),
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
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                      child: DropdownButton<TipoApp>(
                          value: dropdownValue,
                          onChanged: (TipoApp newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: TipoApp.values.map((TipoApp classType) {
                            int idx = classType.index;
                            return DropdownMenuItem<TipoApp>(
                                value: classType,
                                child: Icon(
                                  Icons.fiber_manual_record,
                                  color: colorList[idx],
                                  size: 35,
                                ));
                          }).toList())),
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
                    onPressed: _presentDatePicker,
                    // onPressed: () {
                    //   DatePicker.showDateTimePicker(context,
                    //       minTime: DateTime.now(),
                    //       showTitleActions: true, onConfirm: (date) {
                    //     setState(() {
                    //       dataAppuntamento = date;
                    //     });
                    //   }, currentTime: DateTime.now(), locale: LocaleType.it);
                    // },
                    padding: EdgeInsets.all(0),
                    child: Text(
                      DateFormat('dd MMM yyyy hh:mm').format(dataAppuntamento) +
                          ' h',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                        fontFamily: 'Ubuntu',
                        // decoration: TextDecoration.underline,
                      ),
                    )),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Ripeti appuntamento: ',
                      style: TextStyle(
                        fontFamily: 'Ubuntu',
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                  child: DropdownButton<Frequency>(
                      value: ripetiApp,
                      onChanged: (Frequency newValue) {
                        setState(() {
                          ripetiApp = newValue;
                        });
                      },
                      items: Frequency.values.map((Frequency classType) {
                        int idx = classType.index;
                        return DropdownMenuItem<Frequency>(
                            value: classType, child: Text(tiempo[idx]));
                      }).toList())),
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
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
              _promemoria
                  ? Container(
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
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Ubuntu',
                            ),
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
                            style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'Ubuntu',
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox.shrink(),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Ubuntu',
                ),
                autofocus: false,
                controller: _noteController,
                keyboardType: TextInputType.multiline,
                minLines: 4,
                maxLines: 4,
                decoration: new InputDecoration(
                  hintText: 'Note',
                  border: OutlineInputBorder(
                    borderRadius: new BorderRadius.all(
                      const Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(
                        color: Theme.of(context).primaryColor, width: 2.0),
                  ),
                ),
              )

              // Column(
              //   children: <Widget>[],
              // )
            ],
          ),
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) => FlatButton(
          onPressed: () {
            if (_nomeApp.text.toString() == '') {
              final snackBar = SnackBar(
                content: Text('Inserisci il nome dell\'appuntamento'),
                backgroundColor: Color(0xffBE1622),
                duration: Duration(seconds: 3),
              );
              //Navigator.of(context).pushReplacementNamed('/home');
              final scaffold = Scaffold.of(context);
              // Find the Scaffold in the widget tree and use it to show a SnackBar.
              scaffold.showSnackBar(snackBar);
            } else {
              Navigator.of(context).pushReplacementNamed(
                '/home',
                arguments: {
                  'type': 'appuntamento',
                  'object': new Appuntamenti(
                      id: DateTime.now().toString(),
                      date: dataAppuntamento,
                      promemoria: _promemoria,
                      promemoriaTime: _alertBefore,
                      repeatAppointment: ripetiApp,
                      tipo: dropdownValue,
                      title: _nomeApp.text,
                      note: _noteController.text)
                },
              );
            }
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
