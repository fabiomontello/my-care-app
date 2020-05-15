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

  bool applicazione = true;
  final applicazioneDose = TextEditingController();
  final applicazioneDurata = TextEditingController();
  bool scorte = true;
  final scorteQuantita = TextEditingController();
  bool scorteAlert = false;

  _editAllFunc(freq, startDayDate, dOfWeekList, timelist) {
    setState(() {
      _frequency = freq;
      startDate = startDayDate;
      dOfWeek = dOfWeekList;
      timesList = timelist;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _controller = new PageController();
    const _kDuration = const Duration(milliseconds: 300);
    const _kCurve = Curves.ease;

    List<Widget> _samplePages = [
      Container(
        height: double.infinity,
        padding: EdgeInsets.fromLTRB(18, 25, 18, 0),
        child: SingleChildScrollView(
                  child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    fit: FlexFit.tight,
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
              _promemoria ? InkWell(
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
              ) : SizedBox.shrink(),
              Container(
                  padding: EdgeInsets.only(top: 20),
                  child: FlatButton(
                    textColor: Color(0xffBE1622),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Prossima pagina',
                          style: TextStyle(fontSize: 18),
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 34,
                        )
                      ],
                    ),
                    onPressed: () {
                      _controller.nextPage(duration: _kDuration, curve: _kCurve);
                    },
                  )),

              // Column(
              //   children: <Widget>[],
              // )
            ],
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.fromLTRB(18, 25, 18, 0),
        child: SingleChildScrollView(
                  child: Column(
            children: <Widget>[
              Container(
                // padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Applicazione',
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
                        value: applicazione,
                        onChanged: (val) {
                          setState(() {
                            applicazione = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              applicazione ? Container(
                padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Dose: ',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        width: 30,
                        child: TextField(
                          controller: applicazioneDose,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            //color: Color(0xffBE1622),
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Color(0xffBE1622),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'ml',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ): SizedBox.shrink(),
              applicazione?Container(
                padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Durata:',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        width: 30,
                        child: TextField(
                          controller: applicazioneDurata,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            //color: Color(0xffBE1622),
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Color(0xffBE1622),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'giorni',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ):SizedBox.shrink(),
              Container(
                // padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Scorte',
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
                        value: scorte,
                        onChanged: (val) {
                          setState(() {
                            scorte = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              scorte?Container(
                padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: Text(
                        'Quantità a disposizione: ',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        width: 30,
                        child: TextField(
                          controller: scorteQuantita,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            //color: Color(0xffBE1622),
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            color: Color(0xffBE1622),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        'ml',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ):SizedBox.shrink(),
              scorte?Container(
                padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Checkbox(
                          value: scorteAlert,
                          onChanged: (boo) {
                            setState(() {
                              scorteAlert = !scorteAlert;
                            });
                          }),
                    ),
                    Expanded(
                      flex: 6,
                      child: Text(
                        'Avvisami quando sta per finire',
                        style: TextStyle(
                          fontFamily: 'Ubuntu',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ):SizedBox.shrink(),
              Builder(
                builder: (context) => Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FlatButton(
                          textColor: Color(0xffBE1622),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.chevron_left,
                                size: 34,
                              ),
                              Text(
                                'Torna indietro ',
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          ),
                          onPressed: () {
                            _controller.previousPage(
                                duration: _kDuration, curve: _kCurve);
                          },
                        ),
                        FlatButton(
                          textColor: Color(0xffBE1622),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Fine',
                                style: TextStyle(fontSize: 18),
                              ),
                              Icon(
                                Icons.chevron_right,
                                size: 34,
                              ),
                            ],
                          ),
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
                              Navigator.of(context)
                                  .pushReplacementNamed('/home', arguments: {
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
                                    applicazione: applicazione,
                                    applicazioneDose:
                                        int.parse(applicazioneDose.text),
                                    applicazioneDurata:
                                        int.parse(applicazioneDurata.text),
                                    scorte: scorte,
                                    scorteQuantita:
                                        int.parse(scorteQuantita.text),
                                    scorteAlert: scorteAlert)
                              });
                            }
                          },
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
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
          // Container(
          //   color: Colors.lightBlueAccent,
          //   child: Row(
          //     mainAxisSize: MainAxisSize.max,
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: <Widget>[
          //       FlatButton(
          //         child: Text('Prev'),
          //         onPressed: () {
          //           _controller.previousPage(
          //               duration: _kDuration, curve: _kCurve);
          //         },
          //       ),
          //       FlatButton(
          //         child: Text('Next'),
          //         onPressed: () {
          //           _controller.nextPage(duration: _kDuration, curve: _kCurve);
          //         },
          //       )
          //     ],
          //   ),
          // )
        ],
      ),
      // floatingActionButton: Builder(
      //   builder: (context) => FlatButton(
      //     onPressed: () {
      //       if (_nomeMed.text.toString() == '') {
      //         final snackBar = SnackBar(
      //           content: Text('Inserisci il nome del medicinale'),
      //           backgroundColor: Color(0xffBE1622),
      //           duration: Duration(seconds: 3),
      //         );
      //         //Navigator.of(context).pushReplacementNamed('/home');
      //         final scaffold = Scaffold.of(context);
      //         // Find the Scaffold in the widget tree and use it to show a SnackBar.
      //         scaffold.showSnackBar(snackBar);
      //       } else {
      //         Navigator.of(context).pushReplacementNamed('/home', arguments: {
      //           'type': 'medicinale',
      //           'object': new Medicinale(
      //             frequency: _frequency,
      //             icon: dropdownValue,
      //             id: DateTime.now().toString(),
      //             promemoria: _promemoria,
      //             title: _nomeMed.text.toString(),
      //             promemoriaList: timesList,
      //             startDate: startDate,
      //             dOfWeek: dOfWeek,
      //           )
      //         });
      //       }
      //     },
      //     child: Text(
      //       "Applica",
      //       textAlign: TextAlign.right,
      //       style: TextStyle(
      //           color: Color(0xffBE1622),
      //           fontSize: 20,
      //           fontWeight: FontWeight.w300),
      //     ),
      //   ),
      // ),
    );
  }
}
