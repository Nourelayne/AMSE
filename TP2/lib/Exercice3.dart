import 'package:flutter/material.dart';

import 'Tile1.dart';

Tile tile =
    new Tile(imageURL: 'assets/images/Image.jpg', alignment: Alignment(0, 0));

class Exercice3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display a Tile as a Cropped Image'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(children: [
        SizedBox(
            width: 150.0,
            height: 150.0,
            child: Container(
                margin: EdgeInsets.all(20.0),
                child: this.createTileWidgetFrom(tile))),
        Container(
            height: 200,
            child: Image.network('assets/images/Image.jpg', fit: BoxFit.cover))
      ])),
    );
  }

  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile.croppedImageTile(1 / 3, 1 / 3),
      onTap: () {
        print("tapped on tile");
      },
    );
  }
}
