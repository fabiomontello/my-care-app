import 'package:flutter/material.dart';
import 'package:my_care/ui/plus.dart';
import '../ui/plus.dart';

class HomeSwitcher extends StatelessWidget {
  final int index;
  HomeSwitcher(this.index);


  @override
  Widget build(BuildContext context) {
    Widget child = Text ('This text '+ index.toString() );

    
      // switch (index) {
      //   case 0:
      //     child = IconButton(
      //       onPressed: () => {},
      //       icon: Icon(
      //         Icons.add_circle,
      //       ),
      //     );
      //     break;
      //   case 1:
      //     child = FlutterLogo(colors: Colors.orange);
      //     break;
      //   case 2:
          
      //     break;
      //   default:
      //     child = FlutterLogo(
      //       colors: Colors.deepPurple,
      //     );
      // }
    return Center(child: child);
  }
}
