import 'package:flutter/material.dart';
import 'package:my_care/ui/plus.dart';
import '../ui/plus.dart';

class HomeSwitcher extends StatelessWidget {
  final int index;
  HomeSwitcher(this.index);

  @override
  Widget build(BuildContext context) {
    Widget child = Text('This text ' + index.toString());

    return Center(child: child);
  }
}
