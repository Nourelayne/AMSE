import 'package:flutter/material.dart';

class Tile {
  String imageURL;
  Alignment alignment;

  Tile({this.imageURL, this.alignment});

  Widget croppedImageTile(widthF, heightF) {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: widthF,
            heightFactor: heightF,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }
}
