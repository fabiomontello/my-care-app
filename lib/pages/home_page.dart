import 'package:flutter/material.dart';
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
  // final theme = MyCareTheme();
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
      ),
      drawer: MyCareDrawer(_pageHandler),
      body: HomeSwitcher(_index),
      bottomNavigationBar: MyCareBottomNavBar(_pageHandler),
    );
  }
}
