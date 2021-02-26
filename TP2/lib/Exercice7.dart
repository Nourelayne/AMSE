import 'dart:math';

import 'package:flutter/material.dart';

import 'Tile1.dart';

Random random = new Random();

class Exercice7 extends StatefulWidget {
  @override
  _Exercice7State createState() => _Exercice7State();
}

class _Exercice7State extends State<Exercice7> {
  final imageUrl = 'assets/images/Image.jpg';
  int numberOfRows = 3;
  static int isEmptyValue;

  bool started = false;
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    final liste = <Widget>[];
    for (double i = -1; i <= 1; i += 2 / (numberOfRows - 1)) {
      for (double j = -1; j <= 1; j += 2 / (numberOfRows - 1)) {
        liste.add(new Tile(imageURL: imageUrl, alignment: Alignment(j, i))
            .croppedImageTile(1 / numberOfRows, 1 / numberOfRows));
      }
    }
    void swapTiles(int index) {
      var tempValue;
      var tempIndex;
      tempValue = liste[isEmptyValue];
      tempIndex = isEmptyValue;
      liste[isEmptyValue] = liste[index];
      isEmptyValue = index;
      liste[index] = tempValue;
      index = tempIndex;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Exercice_6'),
        ),
        body: Column(children: [
          new Expanded(
              child: GridView.count(
            primary: false,
            padding: const EdgeInsets.fromLTRB(20, 100, 20, 100),
            crossAxisSpacing: 3,
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
                                  : isClickable(index)
                                      ? Colors.red
                                      : Colors.transparent,
                              width: 2)),
                    ),
                    onTap: () {
                      setState(() {
                        if (isClickable(index)) {
                          swapTiles(index);
                        }
                      });
                    })),
          )),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            SizedBox(
                width: 40,
                height: 40,
                child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: IconButton(
                        icon: Icon(Icons.horizontal_rule),
                        color: Colors.white,
                        onPressed: started
                            ? null
                            : () {
                                setState(() {
                                  if (numberOfRows > 2) {
                                    numberOfRows--;
                                  }
                                });
                              }),
                    onPressed: started ? null : () {})),
            SizedBox(
                width: 40,
                height: 40,
                child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: IconButton(
                        icon: started
                            ? Icon(Icons.pause)
                            : Icon(Icons.play_arrow),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            started = !started;
                            counter++;
                            if (counter <= 1) {
                              isEmptyValue =
                                  random.nextInt(pow(numberOfRows, 2) - 1);
                            }
                          });
                        }),
                    onPressed: () {})),
            SizedBox(
                width: 40,
                height: 40,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: IconButton(
                      icon: Icon(Icons.add),
                      color: Colors.white,
                      onPressed: started
                          ? null
                          : () {
                              setState(() {
                                if (numberOfRows < 10) {
                                  numberOfRows++;
                                }
                              });
                            }),
                  onPressed: started ? null : () {},
                )),
          ]),
          SizedBox(
            height: 40,
          )
        ]));
  }

  bool isClickable(int index) {
    return ((isEmptyValue != index) &&
        (((isEmptyValue % numberOfRows != 0) && (index + 1 == isEmptyValue)) ||
            (((isEmptyValue + 1) % numberOfRows != 0) &&
                (index - 1 == isEmptyValue)) ||
            (((isEmptyValue + numberOfRows >= 0) &&
                (index + numberOfRows == isEmptyValue))) ||
            (((isEmptyValue + numberOfRows < pow(numberOfRows, 2)) &&
                (index - numberOfRows == isEmptyValue)))));
  }
}
