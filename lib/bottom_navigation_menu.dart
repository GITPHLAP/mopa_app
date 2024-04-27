
import 'package:flutter/material.dart';
import 'package:mopa_app/Screens/after.dart';
import 'package:mopa_app/Screens/before.dart';
import 'package:mopa_app/Screens/options.dart';

class BottomNavigationMenu extends StatefulWidget {
  const BottomNavigationMenu({super.key});

  @override
  State<BottomNavigationMenu> createState() => _BottomNavigationMenuState();
}

class _BottomNavigationMenuState extends State<BottomNavigationMenu> {
  static const List<Widget> _pages = <Widget>[
    BeforeWidget(),
    AfterWidget(),
    OptionsWidget()
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.flight_takeoff),
            label: "Before",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flight_land),
            label: "After",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Options",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        // Style
        type: BottomNavigationBarType.shifting,
        selectedFontSize: 20,
        selectedIconTheme: const IconThemeData(size: 40),
        selectedItemColor: Theme.of(context).primaryColor,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedIconTheme: IconThemeData(color: Theme.of(context).disabledColor),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
