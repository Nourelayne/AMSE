import 'package:flutter/material.dart';
import 'package:tp_2/Exercice1.dart';
import 'package:tp_2/Exercice4c.dart';

import 'Exercice2.dart';
import 'Exercice2b.dart';
import 'Exercice3.dart';
import 'Exercice4a.dart';
import 'Exercice4b.dart';
import 'Exercice4c.dart';
import 'Exercice5a.dart';
import 'Exercice5b.dart';
import 'Exercice6.dart';
import 'Exercice7.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _play = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              'Road To a Taquin Board',
              style: TextStyle(
                  letterSpacing: 3,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue[600]),
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text(
                'Display image',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.play_arrow),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Exercice1(),
                    ));
              },
              selected: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text(
                'Rotate and resize image',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.play_arrow),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Exercice2(),
                    ));
              },
              selected: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text(
                'Animated Rotate and resize image',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.play_arrow),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Exercice2b(),
                    ));
              },
              selected: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text(
                'Display a Tile as a Cropped Image',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.play_arrow),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Exercice3(),
                    ));
              },
              selected: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text(
                'Grid of colored box',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.play_arrow),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Exercice4a(),
                    ));
              },
              selected: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text(
                'Fixed Grid of Cropped Image',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.play_arrow),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Exercice4b(),
                    ));
              },
              selected: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text(
                'Configurable Taquin Board',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.play_arrow),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Exercice4c(),
                    ));
              },
              selected: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text(
                'Moving Tiles',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.play_arrow),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Exercice5a(),
                    ));
              },
              selected: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text(
                'Moving Tiles in Grid',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.play_arrow),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Exercice5b(),
                    ));
              },
              selected: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text(
                'Taquin Board',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.play_arrow),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Exercice6(),
                    ));
              },
              selected: true,
            ),
          ),
          Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text(
                'Taquin Board With Image',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(Icons.play_arrow),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Exercice7(),
                    ));
              },
              selected: true,
            ),
          ),
        ])
      ],
    ));
  }
}
