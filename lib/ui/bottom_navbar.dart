//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:my_care/ui/plus.dart';

class MyCareBottomNavBar extends StatefulWidget {
  final Function pageHandler;
  final int selectedIndex;

  @override
  MyCareBottomNavBar(
    this.pageHandler,
    this.selectedIndex
  );
  _MyCareBottomNavBarState createState() =>
      _MyCareBottomNavBarState(pageHandler, selectedIndex);
}

class _MyCareBottomNavBarState extends State<MyCareBottomNavBar> {
  int _selectedIndex;
  void _onItemTapped(int index) {
    _pageHandler(index);
/*     setState(() {
      _selectedIndex = index;
    }); */
  } 

  void startAddButton(BuildContext ctx) {
    
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      elevation: 0,

      barrierColor: null,
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

  _MyCareBottomNavBarState(this._pageHandler, this._selectedIndex);
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
            child: IconButton(
                icon: Icon(Icons.home),
                onPressed: () => _onItemTapped(0),
                color: _selectedIndex == 0 ? Colors.white : null),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
                icon: Icon(Icons.watch),
                onPressed: () => _onItemTapped(1),
                color: _selectedIndex == 1 ? Colors.white : null),
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
            child: IconButton(
                // disabledColor: Colors.black,
                icon: Icon(Icons.notifications),
                onPressed: () => _onItemTapped(3),
                color: _selectedIndex == 3 ? Colors.white : null
                // highlightColor: InkResponse(onTap: Colors.white,
                ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
                icon: Icon(Icons.place),
                onPressed: () => _onItemTapped(4),
                color: _selectedIndex == 4 ? Colors.white : null),
          ),
        ],
      ),
    );
  }
}
