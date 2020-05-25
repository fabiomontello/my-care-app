import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../models/documenti.dart';
import './documenti_page.dart';

class DocumentoEdit extends StatefulWidget {
  @override
  _DocumentoEditState createState() => _DocumentoEditState();
}

class _DocumentoEditState extends State<DocumentoEdit> {
  String _id = DateTime.now().toString();
  final _nomeDoc = TextEditingController();
  TipoDoc _tipoDoc = TipoDoc.documento;
  final _noteController = TextEditingController();
  _docIcons(val) {
    switch (val) {
      case TipoDoc.fotoVideo:
        return Colors.redAccent;
      case TipoDoc.documento:
        return Colors.blueAccent;
      case TipoDoc.audio:
        return Colors.greenAccent;
    }
    return Colors.white;
  }

  String _path;

  Future getPath() async {
    var filePath = await FilePicker.getFilePath(type: FileType.any);

    setState(() {
      _path = filePath;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    final Function onItemTapped = arguments['routeFunction'];
    if (arguments['edit'] != null) {
      Documenti doc = arguments['edit'];
      _id = doc.id;
      _tipoDoc = doc.tipoDoc;
      _nomeDoc.value = new TextEditingController.fromValue(
                new TextEditingValue(text: doc.title.toString()))
            .value;
      _noteController.value = new TextEditingController.fromValue(
                new TextEditingValue(text: doc.note.toString()))
            .value;
    }
    
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        iconTheme: new IconThemeData(color: Colors.white),
        title: Text(
          'Aggiungi documento',
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
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      // margin: const EdgeInsets.all(15.0),
                      // padding: const EdgeInsets.all(3.0),
                      child: TextField(
                        controller: _nomeDoc,
                        expands: false,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: "Titolo documento",
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
                    child: Icon(Icons.fiber_manual_record,
                        color: _docIcons(_tipoDoc), size: 35),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(60.0)),
                  onPressed: () {
                    getPath();
                  },
                  child: Text(
                    'Aggiungi il tuo file',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                    ),
                  ),
                  color: Color(0xffBE1622),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Container(
                  height: 40,
                  padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(60)),
                      border: Border.all(
                        color: Color(0xffBE1622),
                        width: 2,
                      )),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                            height: 40,
                            decoration: _tipoDoc == TipoDoc.fotoVideo
                                ? BoxDecoration(
                                    color: Color(0xffBE1622),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(60)),
                                    // borderRadius: BorderRadius.only(
                                    //     bottomLeft: Radius.circular(60),
                                    //     topLeft: Radius.circular(60)),
                                    // BorderRadius.all(Radius.circular(60)),
                                    border: Border.all(
                                      color: Color(0xffBE1622),
                                      width: 0,
                                    ),
                                  )
                                : null,
                            child: InkWell(
                              onTap: () => {
                                setState(() {
                                  _tipoDoc = TipoDoc.fotoVideo;
                                })
                              },
                              child: Container(
                                width: double.infinity,
                                child: Text(
                                  'Foto/Video',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Ubuntu',
                                      color: _tipoDoc == TipoDoc.fotoVideo
                                          ? Colors.white
                                          : null),
                                ),
                                padding: EdgeInsets.all(5),
                              ),
                            )),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: _tipoDoc == TipoDoc.audio
                                  ? Color(0xffBE1622)
                                  : null,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(60)),
                            ),
                            child: InkWell(
                              onTap: () => {
                                setState(() {
                                  _tipoDoc = TipoDoc.audio;
                                })
                              },
                              child: Container(
                                width: double.infinity,
                                child: Text(
                                  'Audio',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Ubuntu',
                                      color: _tipoDoc == TipoDoc.audio
                                          ? Colors.white
                                          : null),
                                ),
                                padding: EdgeInsets.all(5),
                              ),
                            )),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                            decoration: _tipoDoc == TipoDoc.documento
                                ? BoxDecoration(
                                    color: Color(0xffBE1622),
                                    // borderRadius: BorderRadius.only(
                                    //     bottomRight: Radius.circular(60),
                                    //     topRight: Radius.circular(60)),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(60)),
                                    border: Border.all(
                                      color: Color(0xffBE1622),
                                      width: 0,
                                    ),
                                  )
                                : null,
                            height: 40,
                            child: InkWell(
                              onTap: () => {
                                setState(() {
                                  _tipoDoc = TipoDoc.documento;
                                })
                              },
                              child: Container(
                                width: double.infinity,
                                child: Text(
                                  'Documento',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Ubuntu',
                                      color: _tipoDoc == TipoDoc.documento
                                          ? Colors.white
                                          : null),
                                ),
                                padding: EdgeInsets.all(5),
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 55),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: 'Ubuntu',
                  ),
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
            ],
          ),
        ),
      ),
      floatingActionButton: Builder(
        builder: (context) => FlatButton(
          onPressed: () {
            if (_nomeDoc.text.toString() == '') {
              final snackBar = SnackBar(
                content: Text('Inserisci il nome del documento'),
                backgroundColor: Color(0xffBE1622),
                duration: Duration(seconds: 3),
              );
              //Navigator.of(context).pushReplacementNamed('/home');
              final scaffold = Scaffold.of(context);
              // Find the Scaffold in the widget tree and use it to show a SnackBar.
              scaffold.showSnackBar(snackBar);
            } else {
              if(arguments['routeFunction'] != null){
                onItemTapped(7);
              } else {
                Navigator.of(context).pop();
              }
              Navigator.of(context).pop();
              docuList.removeWhere((item) => item.id == _id);
              docuList.add(Documenti(
                  id: _id,
                  title: _nomeDoc.text,
                  tipoDoc: _tipoDoc,
                  note: _noteController.text,
                  doc: _path));
              // Navigator.of(context).pushReplacementNamed('/home', arguments: {
              //   'type': 'documento',
              //   'object': new Documenti(
              //       id: DateTime.now().toString(),
              //       title: _nomeDoc.text,
              //       tipoDoc: _tipoDoc,
              //       note: _noteController.text
              //       )
              // });
            }
          },
          child: Text(
            "Applica",
            textAlign: TextAlign.right,
            style: TextStyle(
                color: Color(0xffBE1622),
                fontFamily: 'Ubuntu',
                fontSize: 20,
                fontWeight: FontWeight.w300),
          ),
        ),
      ),
    );
  }
}
