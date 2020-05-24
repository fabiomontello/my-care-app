import 'package:flutter/material.dart';
import 'package:my_care/models/user.dart';
import '../ui/drawer.dart';
import '../ui/bottom_navbar.dart';
import '../logos/logos.dart';
import './home_switcher.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  void _pageHandler(int pageNum) {
    if (pageNum != -1) {
      setState(() {
        _index = pageNum;
      });
    }
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

        actions: <Widget>[
          InkWell(
            onTap: () {Navigator.pushNamed(context, '/profilo/page');;},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                info.img,
                width: 50.0,
                height: 50.0,
                fit: BoxFit.cover,

              ),
            ),
          ),
        ],
      ),
      drawer: MyCareDrawer(_pageHandler),
      body: HomeSwitcher(_index, _pageHandler),
      bottomNavigationBar: MyCareBottomNavBar(_pageHandler),
    );
  }
}


User info  = User(
    idUser: 1,
    id: 'ValentinoV68',
    nome: 'Valentino',
    cognome: 'Visentin',
    data: DateTime(1968,03,21),
    img: "assets/images/Brad_Pitt.jpg",
    pw: 'password',
    email: 'vale68@gmail.com'

);
