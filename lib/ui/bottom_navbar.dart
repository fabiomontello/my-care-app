//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:my_care/ui/plus.dart';
import '../logos/logos.dart';
class MyCareBottomNavBar extends StatefulWidget {
  final Function pageHandler;

  @override
  MyCareBottomNavBar(this.pageHandler);
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
      backgroundColor: Colors.transparent,
      elevation: 0,
      //barrierColor: null,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: PlusButton(),
          behavior: HitTestBehavior.translucent,
        );
      },
    );
  }

  final Function _pageHandler;

  _MyCareBottomNavBarState(this._pageHandler);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(0),
      height: 50,
      color: Color(0xFFE0E0E0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              height: 50,
              color:
                  _selectedIndex == 0 ? Theme.of(context).primaryColor : null,
              child: IconButton(
                  icon: Icon(Icons.home, size: 35),
                  onPressed: () => _onItemTapped(0),
                  color: _selectedIndex == 0
                      ? Colors.white
                      : Theme.of(context).primaryColor),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              height: 50,
              color:
                  _selectedIndex == 1 ? Theme.of(context).primaryColor : null,
              child: IconButton(
                  icon: Icon(Icons.watch, size: 35),
                  onPressed: () => _onItemTapped(1),
                  color: _selectedIndex == 1
                      ? Colors.white
                      : Theme.of(context).primaryColor),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              height: 50,
              child: InkWell(
                onTap: () => startAddButton(context),
                child: plusButton,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              height: 50,
              color:
                  _selectedIndex == 3 ? Theme.of(context).primaryColor : null,
              child: IconButton(
                  // disabledColor: Colors.black,
                  icon: Icon(Icons.notifications, size: 35),
                  onPressed: () => _onItemTapped(3),
                  color: _selectedIndex == 3
                      ? Colors.white
                      : Theme.of(context).primaryColor
                  // highlightColor: InkResponse(onTap: Colors.white,
                  ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              height: 50,
              color:
                  _selectedIndex == 4 ? Theme.of(context).primaryColor : null,
              child: IconButton(
                  icon: Icon(Icons.place, size: 35,),
                  onPressed: () => _onItemTapped(4),
                  color: _selectedIndex == 4
                      ? Colors.white
                      : Theme.of(context).primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
