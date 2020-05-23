import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';


import '../logos/logos.dart';
import '../ui/red_separator.dart';
import 'home_page.dart';

class ProfiloPage extends StatefulWidget {

  @override
  _ProfiloPageState createState() => _ProfiloPageState();
}

class _ProfiloPageState extends State<ProfiloPage> {

  final _userId = TextEditingController(text: info.id);
  final _userNome = TextEditingController(text: info.nome);
  final _userCognome = TextEditingController(text: info.cognome);
  final _userData = TextEditingController(text:DateFormat('dd/MM/yyyy').format(info.data));
  File _image;
  bool _check;

  Future getPhoto() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  Future getImg() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 50,
          child: appLogo,
        ),
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(18, 25, 18, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                info.img,
                width: 120.0,
                height: 120.0,
                fit: BoxFit.cover,

              ),
            ),
            Container(
              //margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: (){
                      getImg();
                      if(_image.path != null){
                        _image.copy('assets/images/img.png');
                        info.img = 'assets/images/img.png';
                      }else{
                        final snackBar = SnackBar(

                          content: Text('Non é stato possibile caricare la foto.'),
                          backgroundColor: Color(0xffBE1622),
                          duration: Duration(seconds: 3),
                        );
                        //Navigator.of(context).pushReplacementNamed('/home');
                        final scaffold = Scaffold.of(context);
                        // Find the Scaffold in the widget tree and use it to show a SnackBar.
                        scaffold.showSnackBar(snackBar);
                      }
                    },
                    icon: Icon(
                      Icons.photo_library,
                      color: Color(0xffBE1622),
                      size: 20,
                    ),
                  ),

                  IconButton(
                      icon: Icon(
                        Icons.photo_camera,
                        color: Color(0xffBE1622),
                        size: 20,
                      ),
                      onPressed:() {
                        getPhoto();
                        if(_image.path != null){
                          _image.copy('assets/images/img.png');
                          info.img = 'assets/images/img.png';
                        }else{
                          final snackBar = SnackBar(

                            content: Text('Non é stato possibile caricare la foto.'),
                            backgroundColor: Color(0xffBE1622),
                            duration: Duration(seconds: 3),
                          );
                          //Navigator.of(context).pushReplacementNamed('/home');
                          final scaffold = Scaffold.of(context);
                          // Find the Scaffold in the widget tree and use it to show a SnackBar.
                          scaffold.showSnackBar(snackBar);
                        }
                      })
                ],
              ),
            ),

            TextField(
              controller: _userId,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              decoration: new InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none),
              //controller: TextEditingController(text: info.id),
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xffBE1622),
              ),
            ),
            RedSeparator(),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'Info',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
            ),

            TextField(
              controller: _userNome,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Nome"),
            ),

            TextField(
              controller: _userCognome,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: "Cognome"),

            ),
            TextField(
              controller: _userData,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(labelText: "Data di nascita"),

            ),
            SizedBox(height: 10),

            Builder(
              builder: (context) => FlatButton(
                onPressed: () {
                  if (_userId.text.isEmpty  || _userNome.text.isEmpty ) {
                    final snackBar = SnackBar(
                      content: Text('Attenzione! Specificare username o nome.'),
                      backgroundColor: Color(0xffBE1622),
                      duration: Duration(seconds: 3),
                    );
                    //Navigator.of(context).pushReplacementNamed('/home');
                    final scaffold = Scaffold.of(context);
                    // Find the Scaffold in the widget tree and use it to show a SnackBar.
                    scaffold.showSnackBar(snackBar);
                  } else {
                    info.id = _userId.text.toString();
                    info.nome=_userNome.text.toString();
                    info.cognome=_userCognome.text.toString();
                    info.data = DateFormat("dd/MM/yyyy").parse(_userData.text.toString());
                    Navigator.pushNamed(context, '/home');
                  }
                },
                child: Text(
                  "Salva",
                  style: TextStyle(
                      color: Color(0xffBE1622),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



