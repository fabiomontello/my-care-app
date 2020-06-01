import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '../models/medicinali.dart';
import './medicinale_edit_freq.dart';

class MedicinaleEdit extends StatefulWidget {
  @override
  _MedicinaleEditState createState() => _MedicinaleEditState();
}

class _MedicinaleEditState extends State<MedicinaleEdit> {
  bool _promemoria = true;
  TipoMedicinale dropdownValue = TipoMedicinale.compresse;
  final _nomeMed = TextEditingController();
  int _frequency = 1;
  List<TimeOfDay> timesList = [
    TimeOfDay.fromDateTime(DateFormat.Hm().parse('00:00'))
  ];
  DateTime startDate = null;
  List<bool> dOfWeek = [];

  List<IconData> iconsList = [
    FontAwesomeIcons.pills,
    FontAwesomeIcons.tablets,
    FontAwesomeIcons.tint
  ];

  bool applicazione = true;
  final applicazioneDose = TextEditingController();
  final applicazioneDurata = TextEditingController();
  bool scorte = true;
  final scorteQuantita = TextEditingController();
  bool scorteAlert = false;
  final _note = TextEditingController();
  String _id = DateTime.now().toString();

  _editAllFunc(freq, startDayDate, dOfWeekList, timelist) {
    setState(() {
      _frequency = freq;
      startDate = startDayDate;
      dOfWeek = dOfWeekList;
      timesList = timelist;
    });
  }

  String _textQuantity() {
    switch (dropdownValue) {
      case TipoMedicinale.compresse:
        return 'mg';
      case TipoMedicinale.goccie:
        return 'ml';
      case TipoMedicinale.pillole:
        return '';
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final _controller = new PageController();
    const _kDuration = const Duration(milliseconds: 300);
    const _kCurve = Curves.ease;
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    if(arguments != null){
      if (arguments['edit'] != null) {
        Medicinale med = arguments['edit'];

        _promemoria = med.promemoria;
        dropdownValue = med.icon;
        _nomeMed.value = new TextEditingController.fromValue(
                new TextEditingValue(text: med.title))
            .value;
        _frequency = med.frequency;
        timesList = med.promemoriaList;
        startDate = med.startDate;
        dOfWeek = med.dOfWeek;
        applicazione = med.applicazione;
        applicazioneDose.value = new TextEditingController.fromValue(
                new TextEditingValue(text: med.applicazioneDose.toString()))
            .value;
        applicazioneDurata.value = new TextEditingController.fromValue(
                new TextEditingValue(text: med.applicazioneDurata.toString()))
            .value;
        scorte = med.scorte;
        scorteQuantita.value = new TextEditingController.fromValue(
                new TextEditingValue(text: med.scorteQuantita.toString()))
            .value;
        scorteAlert = med.scorteAlert;
        _note.value = new TextEditingController.fromValue(
                new TextEditingValue(text: med.note.toString()))
            .value;
        _id = med.id;
      }
    }
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
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.normal,
                          color: Color(0xffBE1622),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                      child: DropdownButton<TipoMedicinale>(
                          value: dropdownValue,
                          onChanged: (TipoMedicinale newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          items: TipoMedicinale.values
                              .map((TipoMedicinale classType) {
                            int idx = classType.index;
                            return DropdownMenuItem<TipoMedicinale>(
                                value: classType,
                                child: Icon(
                                  iconsList[idx],
                                  color: Theme.of(context).primaryColor,
                                  size: 25,
                                ));
                          }).toList())),
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
              _promemoria
                  ? InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                MedicinaleEditFreq(_editAllFunc)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: new BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                            border: Border.all(
                                width: 2,
                                color: Theme.of(context).primaryColor)),
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
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'Ubuntu',
                                    ),
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
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'Ubuntu',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            for (var i = 0; i < timesList.length; i++)
                              Container(
                                height: 70,
                                child: FlatButton(
                                    // onPressed:() => _presentTimePicker(timesList[i]),
                                    onPressed: () {
                                      showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.fromDateTime(
                                            DateFormat.Hm().parse('00:00')),
                                      ).then((pickedDate) {
                                        if (pickedDate == null) {
                                          return;
                                        }
                                        setState(() {
                                          timesList[i] = pickedDate;
                                        });
                                      });
                                    },
                                    padding: EdgeInsets.all(0),
                                    child: Text(
                                      timesList[i]
                                              .hour
                                              .toString()
                                              .padLeft(2, '0') +
                                          ':' +
                                          timesList[i]
                                              .minute
                                              .toString()
                                              .padLeft(2, '0') +
                                          ' h',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 45,
                                        fontFamily: 'Ubuntu',
                                      ),
                                    )),
                              )
                          ],
                        ),
                      ),
                    )
                  : SizedBox.shrink(),
              Container(
                  padding: EdgeInsets.only(top: 20),
                  child: FlatButton(
                    textColor: Color(0xffBE1622),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Prossima pagina',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Ubuntu',
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 34,
                        )
                      ],
                    ),
                    onPressed: () {
                      _controller.nextPage(
                          duration: _kDuration, curve: _kCurve);
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
              applicazione
                  ? Container(
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
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xffBE1622),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              _textQuantity(),
                              style: TextStyle(
                                fontFamily: 'Ubuntu',
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox.shrink(),
              applicazione
                  ? Container(
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
                                  fontFamily: 'Ubuntu',
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
                    )
                  : SizedBox.shrink(),
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
              scorte
                  ? Container(
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
                                  fontFamily: 'Ubuntu',
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
                    )
                  : SizedBox.shrink(),
              scorte
                  ? Container(
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
                    )
                  : SizedBox.shrink(),
              TextField(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Ubuntu',
                ),
                autofocus: false,
                controller: _note,
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
              ),
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
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Ubuntu',
                                ),
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
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Ubuntu',
                                ),
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
                                content:
                                    Text('Inserisci il nome del medicinale'),
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
                                    id: _id,
                                    promemoria: _promemoria,
                                    title: _nomeMed.text.toString(),
                                    promemoriaList: timesList,
                                    startDate: startDate,
                                    dOfWeek: dOfWeek,
                                    applicazione: applicazione,
                                    applicazioneDose:
                                        applicazioneDose.text.toString() == ''
                                            ? -1
                                            : int.parse(applicazioneDose.text),
                                    applicazioneDurata: applicazioneDurata.text
                                                .toString() ==
                                            ''
                                        ? -1
                                        : int.parse(applicazioneDurata.text),
                                    scorte: scorte,
                                    scorteQuantita:
                                        scorteQuantita.text.toString() == ''
                                            ? -1
                                            : int.parse(scorteQuantita.text),
                                    scorteAlert: scorteAlert,
                                    note: _note.text)
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
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Ubuntu',
          ),
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
        ],
      ),
    );
  }
}
