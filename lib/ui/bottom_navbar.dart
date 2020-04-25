import 'package:flutter/material.dart';

class MyCareBottomNavBar extends StatefulWidget {
  final Function pageHandler;

  @override
  MyCareBottomNavBar(this.pageHandler);
  _MyCareBottomNavBarState createState() => _MyCareBottomNavBarState(pageHandler);
}

class _MyCareBottomNavBarState extends State<MyCareBottomNavBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    print('something');
    _pageHandler(index);
    setState(() {
      _selectedIndex = index;
    });
  }
  final Function _pageHandler;

  _MyCareBottomNavBarState(this._pageHandler);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).primaryColor, 
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.watch),
          title: Text('Smart Devices'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle,),
          title: Text('add'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          title: Text('notification'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.place),
          title: Text('Place'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.white,
      onTap: _onItemTapped,
    );
  }
}