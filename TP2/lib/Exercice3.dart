import 'package:flutter/material.dart';

import 'Exercice4a.dart';
import 'main.dart';

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
            child: Image.asset(this.imageURL),
          ),
        ),
      ),
    );
  }
}

Tile tile =
    new Tile(imageURL: 'assets/images/Image.jpg', alignment: Alignment(0, 0));

class Exercice3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display a Tile as a Cropped Image'),
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
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
            width: 150.0,
            height: 150.0,
            child: Container(
                margin: EdgeInsets.all(20.0),
                child: this.createTileWidgetFrom(tile))),
        Container(
            height: 200,
            child: Image.asset('assets/images/Image.jpg', fit: BoxFit.cover)),
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
                      builder: (context) => Exercice4a(),
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
        SizedBox(
          height: 30,
        )
      ]),
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
