import 'dart:math';

import 'package:flutter/material.dart';

import 'main.dart';

Random random = new Random();

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

class Exercice7 extends StatefulWidget {
  @override
  _Exercice7State createState() => _Exercice7State();
}

class _Exercice7State extends State<Exercice7> {
  final imageUrl = 'assets/images/Image.jpg';
  int numberOfRows;
  static int isEmptyValue;
  List<Widget> liste;
  bool started;
  int counter;

  @override
  void initState() {
    super.initState();
    numberOfRows = 3;
    started = false;
    counter = 0;
  }

  List<Widget> listeOfCroppedImage() {
    liste = <Widget>[];
    for (double i = -1; i <= 1; i += 2 / (numberOfRows - 1)) {
      for (double j = -1; j <= 1; j += 2 / (numberOfRows - 1)) {
        liste.add(new Tile(imageURL: imageUrl, alignment: Alignment(j, i))
            .croppedImageTile(1 / numberOfRows, 1 / numberOfRows));
      }
    }
    return liste;
  }

  @override
  Widget build(BuildContext context) {
    listeOfCroppedImage();
    return Scaffold(
        appBar: AppBar(
          title: Text('Taquin Board With Image'),
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
        body: Column(children: [
          new Expanded(
              child: GridView.count(
            primary: false,
            padding: const EdgeInsets.fromLTRB(20, 100, 20, 100),
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            crossAxisCount: numberOfRows,
            children: List.generate(
                pow(numberOfRows, 2),
                (index) => InkWell(
                    child: Container(
                      child: index == isEmptyValue ? null : liste[index],
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: isEmptyValue == null || started == false
                                  ? Colors.transparent
                                  : isSwappable(index)
                                      ? Colors.red
                                      : Colors.transparent,
                              width: 2)),
                    ),
                    onTap: () {
                      setState(() {
                        if (isSwappable(index)) {
                          swapTiles(index);
                        }
                      });
                    })),
          )),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
              onPressed: started
                  ? null
                  : () {
                      setState(() {
                        if (numberOfRows > 2) {
                          numberOfRows--;
                        }
                      });
                    },
              elevation: 2.0,
              fillColor: Colors.blue,
              child: Icon(
                Icons.horizontal_rule,
                size: 15.0,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
            ),
            RawMaterialButton(
              onPressed: () {
                setState(() {
                  started = !started;
                  counter++;
                  if (counter <= 1) {
                    isEmptyValue = random.nextInt(pow(numberOfRows, 2) - 1);
                  }
                });
              },
              elevation: 2.0,
              fillColor: Colors.blue,
              child: Icon(
                (started ? Icons.pause : Icons.play_arrow),
                size: 15.0,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
            ),
            RawMaterialButton(
              onPressed: started
                  ? null
                  : () {
                      setState(() {
                        if (numberOfRows < 10) {
                          numberOfRows++;
                        }
                      });
                    },
              elevation: 2.0,
              fillColor: Colors.blue,
              child: Icon(
                Icons.add,
                size: 15.0,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15.0),
              shape: CircleBorder(),
            ),
          ]),
          SizedBox(
            height: 40,
          )
        ]));
  }

  bool isSwappable(int index) {
    return ((isEmptyValue != index) &&
        (((isEmptyValue % numberOfRows != 0) && (index + 1 == isEmptyValue)) ||
            (((isEmptyValue + 1) % numberOfRows != 0) &&
                (index - 1 == isEmptyValue)) ||
            (((isEmptyValue + numberOfRows >= 0) &&
                (index + numberOfRows == isEmptyValue))) ||
            (((isEmptyValue + numberOfRows < pow(numberOfRows, 2)) &&
                (index - numberOfRows == isEmptyValue)))));
  }

  void swapTiles(int index) {
    var tempValue;

    tempValue = liste[isEmptyValue];

    liste[isEmptyValue] = liste[index];
    isEmptyValue = index;
    liste[index] = tempValue;
  }
}
