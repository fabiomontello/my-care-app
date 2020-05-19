import 'package:flutter/material.dart';

class AnalisiEdit extends StatefulWidget {
  @override
  _AnalisiEditState createState() => _AnalisiEditState();
}

class _AnalisiEditState extends State<AnalisiEdit> {
  final _nomeAn = TextEditingController();
  String categoria = null;
  final _nuovaCat = TextEditingController();

  final _noteController = TextEditingController();
  final categList = [
    'Analisi del sangue',
    'Analisi colesterolo',
  ];

  void startAddButton(BuildContext ctx) {
    Navigator.of(ctx).pop();
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      elevation: 0,
      isScrollControlled: true,
      //barrierColor: null,
      context: ctx,
      builder: (_) {
        return Container(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              padding: EdgeInsets.fromLTRB(15, 40, 15, 5),
              height: 200,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  TextField(
                    autofocus: true,
                    controller: _nuovaCat,
                    expands: false,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Titolo analisi",
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
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    height: 60,
                    color: null,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 60,
                            child: FlatButton(
                              child: Text(
                                'Annulla',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 25,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  _nuovaCat.clear();
                                  Navigator.of(ctx).pop();
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            color: null,
                            height: 60,
                            child: FlatButton(
                              child: Text(
                                'Fatto',
                                style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontSize: 25,
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  
                                  if(!categList.contains(_nuovaCat.text) && _nuovaCat.text != ''){
                                    categList.add(_nuovaCat.text);
                                  }
                                  _nuovaCat.clear();
                                  Navigator.of(ctx).pop();
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text(
          'Aggiungi analisi',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(18, 25, 18, 0),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                  height: 60,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                  child: DropdownButton<String>(
                      hint: Text('Categoria',
                          style: TextStyle(
                              fontFamily: 'Ubuntu',
                              color: Color(0xffBE1622),
                              fontSize: 35,
                              fontWeight: FontWeight.w300)),
                      value: categoria,
                      onChanged: (String newValue) {
                        setState(() {
                          categoria = newValue;
                        });
                      },
                      items: categList.map((String categ) {
                            return DropdownMenuItem<String>(
                                value: categ,
                                child: Text(
                                  categ,
                                  style: TextStyle(
                                      fontFamily: 'Ubuntu',
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ));
                          }).toList() +
                          [
                            DropdownMenuItem<String>(
                                value: 'new',
                                child: Center(
                                  child: FlatButton(
                                    onPressed: () => startAddButton(context),
                                    child: Text(
                                      'Aggiungi Categoria',
                                      style: TextStyle(
                                        fontFamily: 'Ubuntu',
                                        fontSize: 20,
                                        color: Color(0xffBE1622),
                                      ),
                                    ),
                                  ),
                                ))
                          ])),
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        // margin: const EdgeInsets.all(15.0),
                        // padding: const EdgeInsets.all(3.0),
                        child: TextField(
                          controller: _nomeAn,
                          expands: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: "Titolo analisi",
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
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 40, 20, 20),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(60.0)),
                  onPressed: () {},
                  child: Text(
                    'Aggiungi il tuo file',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color(0xffBE1622),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 55),
                child: TextField(
                  style: TextStyle(color: Colors.black, fontSize: 25),
                  autofocus: false,
                  controller: _noteController,
                  keyboardType: TextInputType.multiline,
                  minLines: 6,
                  maxLines: 6,
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
              )
            ]),
          ),
        ),
      ),
    );
  }
}
