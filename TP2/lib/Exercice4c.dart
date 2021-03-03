import 'package:flutter/material.dart';
import 'package:tp_2/Exercice5a.dart';

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

class Exercice4c extends StatefulWidget {
  @override
  _Exercice4cState createState() => _Exercice4cState();
}

class _Exercice4cState extends State<Exercice4c> {
  final imageUrl = 'assets/images/Image.jpg';
  int numberOfRows = 1;
  List<Widget> children;

  @override
  Widget build(BuildContext context) {
    children = <Widget>[];
    for (double i = -1; i <= 1; i += 2 / (numberOfRows - 1)) {
      for (double j = -1; j <= 1; j += 2 / (numberOfRows - 1)) {
        children.add(new Tile(imageURL: imageUrl, alignment: Alignment(j, i))
            .croppedImageTile(1 / numberOfRows, 1 / numberOfRows));
      }
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Configurable Taquin Board'),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  new Expanded(
                      child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.fromLTRB(20, 100, 20, 100),
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 2,
                    crossAxisCount: numberOfRows,
                    children: children,
                  )),
                  Slider(
                    value: numberOfRows.toDouble(),
                    min: 1,
                    max: 10,
                    label: numberOfRows.round().toString(),
                    divisions: 9,
                    onChanged: (double value) {
                      setState(() {
                        numberOfRows = value.toInt();
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      RawMaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        elevation: 2.0,
                        fillColor: Colors.blue,
                        child: Container(
                            padding: EdgeInsets.only(left: 6),
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 25.0,
                              color: Colors.white,
                            )),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Exercice5a(),
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
                ])));
  }
}
