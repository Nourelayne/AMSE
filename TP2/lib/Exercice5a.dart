import 'package:flutter/material.dart';

import 'Tile2.dart';
import 'TileWidget.dart';

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
      ),
      body: Row(children: tiles),
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
