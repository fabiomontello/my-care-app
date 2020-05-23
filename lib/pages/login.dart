import 'package:flutter/material.dart';
import '../logos/logos.dart';

class LoginPage extends StatelessWidget {
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
                decoration: InputDecoration(labelText: "User"),
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
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
