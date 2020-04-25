import 'package:flutter/material.dart';
import '../ui/drawer.dart';
import '../ui/bottom_navbar.dart';
import '../logos/logos.dart';
import './home_switcher.dart';
import '../ui/plus.dart';


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
  void startAddButton(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: PlusButton(),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
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
      body: HomeSwitcher(_index, startAddButton),
      bottomNavigationBar: MyCareBottomNavBar(_pageHandler,),
    );
  }
}
