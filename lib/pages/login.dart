import 'package:flutter/material.dart';
import '../logos/logos.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {

  final _userPw = TextEditingController();
  final _userEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: loginBigLogo,
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              ),
              Text(
                'Benvenuto!',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Ubuntu',
                ),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _userEmail,
                decoration: InputDecoration(labelText: "User"),
              ),
              TextFormField(
                controller: _userPw,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),
              Builder(
                builder: (context) => FlatButton(
                  onPressed: () {
                    if (_userPw.text.isEmpty|| _userEmail.text.isEmpty ) {
                      final snackBar = SnackBar(
                        content: Text('Attenzione! Inserire le credenziali.'),
                        backgroundColor: Color(0xffBE1622),
                        duration: Duration(seconds: 3),
                      );
                      //Navigator.of(context).pushReplacementNamed('/home');
                      final scaffold = Scaffold.of(context);
                      // Find the Scaffold in the widget tree and use it to show a SnackBar.
                      scaffold.showSnackBar(snackBar);
                    } else if(_userPw
                        .text != info.pw || _userEmail.text!=info.email){
                      final snackBar = SnackBar(
                        content: Text('Attenzione! Le credenziali inserite sono errate.'),
                        backgroundColor: Color(0xffBE1622),
                        duration: Duration(seconds: 3),
                      );
                      //Navigator.of(context).pushReplacementNamed('/home');
                      final scaffold = Scaffold.of(context);
                      // Find the Scaffold in the widget tree and use it to show a SnackBar.
                      scaffold.showSnackBar(snackBar);
                    }else {
                      Navigator.pushNamed(context, '/home');

                    }
                  },
                  child: Text(
                    "Accedi",
                    style: TextStyle(
                        color: Color(0xffBE1622),
                        fontSize: 20,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FlatButton(
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        child: Text(
          "Salta",
          textAlign: TextAlign.right,
          style: TextStyle(
              color: Color(0xffBE1622),
              fontSize: 20,
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
