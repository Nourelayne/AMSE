import 'package:flutter/material.dart';

import 'Tile1.dart';

class Exercice4b extends StatelessWidget {
  final imageUrl = 'assets/images/Image.jpg';

  @override
  Widget build(BuildContext context) {
    final numberOfRows = 3;
    return Material(
        type: MaterialType.transparency,
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.fromLTRB(20, 100, 20, 100),
          crossAxisSpacing: 3,
          mainAxisSpacing: 2,
          crossAxisCount: numberOfRows,
          children: <Widget>[
            Container(
              child: Tile(imageURL: imageUrl, alignment: Alignment(-1, -1))
                  .croppedImageTile(1 / numberOfRows, 1 / numberOfRows),
            ),
            Container(
              child: Tile(imageURL: imageUrl, alignment: Alignment(0, -1))
                  .croppedImageTile(1 / numberOfRows, 1 / numberOfRows),
            ),
            Container(
              child: Tile(imageURL: imageUrl, alignment: Alignment(1, -1))
                  .croppedImageTile(1 / numberOfRows, 1 / numberOfRows),
            ),
            Container(
              child: Tile(imageURL: imageUrl, alignment: Alignment(-1, 0))
                  .croppedImageTile(1 / numberOfRows, 1 / numberOfRows),
            ),
            Container(
              child: Tile(imageURL: imageUrl, alignment: Alignment(0, 0))
                  .croppedImageTile(1 / numberOfRows, 1 / numberOfRows),
            ),
            Container(
              child: Tile(imageURL: imageUrl, alignment: Alignment(1, 0))
                  .croppedImageTile(1 / numberOfRows, 1 / numberOfRows),
            ),
            Container(
              child: Tile(imageURL: imageUrl, alignment: Alignment(-1, 1))
                  .croppedImageTile(1 / numberOfRows, 1 / numberOfRows),
            ),
            Container(
              child: Tile(imageURL: imageUrl, alignment: Alignment(0, 1))
                  .croppedImageTile(1 / numberOfRows, 1 / numberOfRows),
            ),
            Container(
              child: Tile(imageURL: imageUrl, alignment: Alignment(1, 1))
                  .croppedImageTile(1 / numberOfRows, 1 / numberOfRows),
            ),
          ],
        ));
  }
}
