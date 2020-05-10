import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MedicinaleEdit extends StatefulWidget {
  @override
  _MedicinaleEditState createState() => _MedicinaleEditState();
}

class _MedicinaleEditState extends State<MedicinaleEdit> {
  bool _promemoria = false;
  String dropdownValue = 'One';
  final _nomeMed = TextEditingController();

  void _submitData() {
    if (_nomeMed.text.isEmpty) {
      return;
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
                /* Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: */ /* Text(
                    'something',
/*                     onSubmitted: (_) => _submitData(),
                    controller: _nomeMed,
                    decoration: InputDecoration(labelText:'Nome del medicinale'), */
                    style: TextStyle(
                      color: Color(0xffBE1622),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ), */
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.all(3.0),
                    child: TextField(
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
                //),
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
            Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
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
              ],
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
