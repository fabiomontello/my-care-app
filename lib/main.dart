import 'package:flutter/material.dart';
import 'package:my_care/pages/medicinali_view.dart';
import './pages/documento_edit.dart';
import './pages/appuntamento_edit.dart';
import './pages/login.dart';
import './pages/home_page.dart';
import './pages/medicinale_edit.dart';
import './pages/analisi_edit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final bool login = false;
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
                color: Colors.white,
                fontFamily: 'Ubuntu',
                fontWeight: FontWeight.normal,
                fontSize: 18,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Ubuntu',
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
        '/appuntamento/edit': (context) => AppuntamentoEdit(),
        '/medicinale/edit': (context) => MedicinaleEdit(),
        '/documento/edit': (context) => DocumentoEdit(),
        '/analisi/edit': (context) => AnalisiEdit(),
        '/medicinale/view': (context) => MedicinaliView(),
       // '/appuntamento/view': (context) => (),
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
