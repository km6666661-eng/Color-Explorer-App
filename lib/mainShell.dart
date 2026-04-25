import 'package:flutter/material.dart';
import 'package:karim_navigator_task/galleryColors.dart';
import 'package:karim_navigator_task/setitngs.dart';

class Mainshell extends StatefulWidget {
  final String usernamee;
  const Mainshell({super.key , required this.usernamee});

  @override
  State<Mainshell> createState() => _MainshellState();
}

class _MainshellState extends State<Mainshell> {
  int _currentIndex = 0;
  List<Widget> get padges => [Gallerycolors(), Setitngs(user: widget.usernamee)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: padges[_currentIndex],

      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          backgroundColor: Colors.brown,
          indicatorColor: Colors.brown.shade300,
          iconTheme: WidgetStateProperty.all(
            IconThemeData(color: Colors.black),
          ),
          labelTextStyle: WidgetStateProperty.all(
            TextStyle(fontSize: 15, color: Colors.white),
          ),
        ),
        child: NavigationBar(
          onDestinationSelected: (val) {
            setState(() {
              _currentIndex = val;
            });
          },
          selectedIndex: _currentIndex,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.photo_filter_sharp),
              label: "Gallery",
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
    );
  }
}
