import 'package:flutter/material.dart';
import '../logos/logos.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20.0),
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
              style: TextStyle(fontSize: 40),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 20),
              child: Text(
                'Accedi',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20),
              ),
            ),
            TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(labelText: "User")),
            TextFormField(
                obscureText: true,
                decoration: InputDecoration(labelText: "Password")),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text(
                "Registrati",
                style: TextStyle(
                    color: Color(0xffBE1622),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
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
              color: Color(0xffBE1622), fontSize: 20, fontWeight: FontWeight.w300),
        ),
      ),
    );
    // void main() {
    //   var isLoggedIn = false;
    //   var userName = 'Sandrula';
    //   var password = 'tester';
    //   var hasCorrectCredentials = userName == 'Sandrula' $$ password == tester;
    //   if (hasCorrectCredentials) { (Navigator.pushNamed(context, '/home'),);
    //   }
    //   else ()
  }
}

// void main() {
//       var isLoggedIn = false;
//       var userName = 'Sandrula';
//       var password = 'tester';
//       var hasCorrectCredentials = userName == 'Sandrula' $$ pasword == tester;
//       if (hasCorrectCredentials) { go to main;
//       }
//       else ()
