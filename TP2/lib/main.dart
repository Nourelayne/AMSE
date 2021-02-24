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
    return ListView(
      children: <Widget>[
        Card(
          child: ListTile(
            leading: FlutterLogo(size: 56.0),
            title: Text('Exercice 1'),
            subtitle: Text('Display image'),
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
            title: Text('Exercice 2'),
            subtitle: Text('Rotate and resize image'),
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
            title: Text('Exercice 2b'),
            subtitle: Text('Animated Rotate and resize image'),
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
            title: Text('Exercice 3'),
            subtitle: Text('Displat a Tile'),
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
            title: Text('Exercice 4a'),
            subtitle: Text('Grid of colored box'),
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
            title: Text('Exercice 4b'),
            subtitle: Text('Fixed Grid of Cropped Image'),
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
            title: Text('Exercice 4c'),
            subtitle: Text('Configurable Taquin Board'),
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
            title: Text('Exercice 5a'),
            subtitle: Text('Moving Tiles'),
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
            title: Text('Exessrcice 5b'),
            subtitle: Text('Moving Tiles in Grid'),
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
            title: Text('Exessrcice 7'),
            subtitle: Text('Taquin Board'),
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
      ],
    );
  }
}
