import 'package:flutter/material.dart';

import 'Exercice4c.dart';
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

class Exercice4b extends StatelessWidget {
  final imageUrl = 'assets/images/Image.jpg';
  final numberOfRows = 3;

  final children = <Widget>[];

  List<Widget> croppedImageGenerator() {
    for (double i = -1; i <= 1; i += 2 / (numberOfRows - 1)) {
      for (double j = -1; j <= 1; j += 2 / (numberOfRows - 1)) {
        children.add(new Tile(imageURL: imageUrl, alignment: Alignment(j, i))
            .croppedImageTile(1 / numberOfRows, 1 / numberOfRows));
      }
    }
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fixed Grid Of Cropped Image'),
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
        body: Material(
            type: MaterialType.transparency,
            child: Column(
              children: [
                new Expanded(
                    child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.fromLTRB(20, 100, 20, 100),
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 2,
                        crossAxisCount: numberOfRows,
                        children: croppedImageGenerator())),
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
                              builder: (context) => Exercice4c(),
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
                  height: 50,
                )
              ],
            )));
  }
}
