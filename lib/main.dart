import 'package:flutter/material.dart';
import './pages/login.dart';
import './pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final bool login = false;

  //static const myColour = 0xff55BDBB;
  //static const accentRed = 0xffBE1622;
  //this.primary = const Color(0xff55BDBB),
  //static const myColour = const MaterialColor (0xff55BDBB);
  //  static const MaterialColor  = const MaterialColor(myColour,
  //   const <int, Color>{});
  // static const MaterialColor red = const MaterialColor(accentRed,
  //const <int, Color>{});
  //final theme = MyCareTheme();
  static const color = const Color(0xffBE1622);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Care',
      theme: ThemeData(
        primarySwatch: CustomColorSwatchs.appPrimaryColor,
        accentColor: Color(0xff1A938D),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      initialRoute: login ? '/home' : '/login',
      routes: {
        '/home': (context) => MyHomePage(title: 'My Care'),
        '/login': (context) => LoginPage(),
      },
    );
  }
}

class CustomColorSwatchs {
  static MaterialColor get appPrimaryColor {
    Map<int, Color> colorSwatch = {
      50: Color.fromRGBO(136, 14, 79, .1),
      100: Color.fromRGBO(136, 14, 79, .2),
      200: Color.fromRGBO(136, 14, 79, .3),
      300: Color.fromRGBO(136, 14, 79, .4),
      400: Color.fromRGBO(136, 14, 79, .5),
      500: Color.fromRGBO(136, 14, 79, .6),
      600: Color.fromRGBO(136, 14, 79, .7),
      700: Color.fromRGBO(136, 14, 79, .8),
      800: Color.fromRGBO(136, 14, 79, .9),
      900: Color.fromRGBO(136, 14, 79, 1),
    };

    return MaterialColor(0xff55BDBB, colorSwatch);
  }
}
