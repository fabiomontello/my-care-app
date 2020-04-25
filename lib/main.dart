import 'package:flutter/material.dart';
import './pages/login.dart';
import './pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final bool login = false;
  
  //static const myColour = 0xff55BDBB;
  static const accentRed = 0xffBE1622;
  //this.primary = const Color(0xff55BDBB),
  //static const myColour = const MaterialColor (0xff55BDBB);
  //  static const MaterialColor lime = const MaterialColor(myColour,
  //   const <int, Color>{});
   static const MaterialColor red = const MaterialColor(accentRed, 
   const <int, Color>{});
  //final theme = MyCareTheme();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Care',
      theme: ThemeData(
        primarySwatch: CustomColorSwatchs.appPrimaryColor,
        accentColor: Color(0xff1A938D),
        //primarySwatch: MaterialColor myColor = MaterialColor(0xFF880E4F, color),
        //accentColor: theme.mainColorDark
      ),
      initialRoute: login ? '/home': '/login',
      routes: {
        '/home': (context) => MyHomePage(title: 'My Care'),
        '/login': (context) =>LoginPage() ,
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

// class ChartBar extends StatelessWidget {
//   final String label;
//   final double spendingAmount;
//   final double spendingPctOfTotal;

//   ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         FittedBox(
//           child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
//         SizedBox(
//           height: 4,
//         ),
//         Container(
//           height: 60,
//           width: 10,
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey, width: 1.0),
//                   color: Color.fromRGBO(220, 220, 220, 1),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               FractionallySizedBox(
//                 heightFactor: spendingPctOfTotal,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Theme.of(context).primaryColor,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 4,
//         ),
//         Text(label),
//       ],
//     );
//   }
// }


// Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter App',
//       theme: ThemeData(
//           primarySwatch: Colors.purple,
//           accentColor: Colors.amber[400],
//           textTheme: ThemeData.light().textTheme.copyWith(
//                 title: TextStyle(
//                   fontFamily: 'OpenSans',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 18,
//                 ),
//               ),
//           fontFamily: 'Quicksand',
//           appBarTheme: AppBarTheme(
//             textTheme: ThemeData.light().textTheme.copyWith(
//                   title: TextStyle(
//                     fontFamily: 'OpenSans',
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//           )),
//       home: MyHomePage(),
//     );
//   }
// }