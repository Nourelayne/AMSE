import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'Exercice5b.dart';
import 'main.dart';

math.Random random = new math.Random();

class Tile {
  Color color;

  Tile(this.color);
  Tile.randomColor() {
    this.color = Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}

class TileWidget extends StatelessWidget {
  final Tile tile;

  TileWidget(this.tile);

  @override
  Widget build(BuildContext context) {
    return this.coloredBox();
  }

  Widget coloredBox() {
    return Container(
        color: tile.color,
        child: Padding(
          padding: EdgeInsets.all(70.0),
        ));
  }
}

class Exercice5a extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Exercice5aState();
}

class Exercice5aState extends State<Exercice5a> {
  List<Widget> tiles =
      List<Widget>.generate(2, (index) => TileWidget(Tile.randomColor()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moving Tiles'),
        centerTitle: true,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );
          },
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Row(children: tiles),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RawMaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              elevation: 2.0,
              fillColor: Colors.blue,
              child: Icon(
                Icons.arrow_back_ios,
                size: 25.0,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
            ),
            RawMaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Exercice5b(),
                    ));
              },
              elevation: 2.0,
              fillColor: Colors.blue,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 25.0,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
            ),
          ],
        ),
      ]),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.sentiment_very_satisfied), onPressed: swapTiles),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}
