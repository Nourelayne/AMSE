import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:music_app/screens/bibliotheque.dart';
import 'package:music_app/screens/Info.dart';
import 'package:music_app/screens/favoris.dart';
import 'package:music_app/screens/searchBar.dart';
import 'package:music_app/constants.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Bibliotheque(),
    SearchBar(),
    Favoris(saved: saved),
    Info(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 45,
        backgroundColor: Color(0xFF0A3068),
        items: <Widget>[
          Icon(Icons.library_music_outlined, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.favorite_outline, size: 30),
          Icon(Icons.info_outline, size: 30),
        ],
        animationDuration: Duration(milliseconds: 300),
        onTap: _onItemTapped,
      ),
    );
  }
}
