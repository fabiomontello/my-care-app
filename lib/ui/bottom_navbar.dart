//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:my_care/ui/plus.dart';

class MyCareBottomNavBar extends StatefulWidget {
  final Function pageHandler;

  @override
  MyCareBottomNavBar(
    this.pageHandler,
  );
  _MyCareBottomNavBarState createState() =>
      _MyCareBottomNavBarState(pageHandler);
}

class _MyCareBottomNavBarState extends State<MyCareBottomNavBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    _pageHandler(index);
    setState(() {
      _selectedIndex = index;
    });
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

  final Function _pageHandler;

  _MyCareBottomNavBarState(this._pageHandler);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Theme.of(context).primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: Icon(Icons.home),
          ),
          Expanded(
            flex: 1,
            child: Icon(Icons.watch),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () => startAddButton(context),
              icon: Icon(Icons.add_circle),
            ),
          ),
          Expanded(
            flex: 1,
            child: Icon(Icons.notifications),
          ),
          Expanded(
            flex: 1,
            child: Icon(Icons.place),
          ),
        ],
      ),
    );
  }
}
