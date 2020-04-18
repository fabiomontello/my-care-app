import 'package:flutter/material.dart';
import '../style/style.dart';

class MyCareBottomNavBar extends StatefulWidget {
  @override
  _MyCareBottomNavBarState createState() => _MyCareBottomNavBarState();
}

class _MyCareBottomNavBarState extends State<MyCareBottomNavBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final theme = MyCareTheme();
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: theme.mainColor,
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