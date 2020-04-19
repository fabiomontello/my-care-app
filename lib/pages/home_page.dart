import 'package:flutter/material.dart';
import '../ui/drawer.dart';
import '../ui/bottom_navbar.dart';
import '../style/style.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final theme = MyCareTheme();
  final String title;

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
      drawer: MyCareDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'We are taking "Care" of it 😉',
            ),
          ],
        ),
      ),
    bottomNavigationBar: MyCareBottomNavBar(),
    );
  }
}
