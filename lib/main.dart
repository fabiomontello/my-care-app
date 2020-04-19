import 'package:flutter/material.dart';
import 'style/style.dart';
import './pages/login.dart';
import './pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final bool login = false;
  final theme = MyCareTheme();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Care',
      theme: ThemeData(
        primaryColor: theme.mainColor,
        accentColor: theme.mainColorDark
      ),
      initialRoute: login ? '/': '/login',
      routes: {
        '/home': (context) => MyHomePage(title: 'My Care'),
        '/login': (context) =>LoginPage() ,
      },
    );
  }
}