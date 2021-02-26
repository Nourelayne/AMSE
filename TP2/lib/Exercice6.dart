import 'dart:math';

import 'package:flutter/material.dart';

Random random = new Random();

class Tile {
  int number;

  Tile(this.number);
}

class TileWidget extends StatelessWidget {
  final Tile tile;

  TileWidget(this.tile);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Tile ${tile.number}'),
    );
  }
}

class Exercice6 extends StatefulWidget {
  @override
  _Exercice6State createState() => _Exercice6State();
}

class _Exercice6State extends State<Exercice6> {
  int numberOfRows = 3;
  static int isEmptyValue;
  List<Widget> liste;
  bool started = false;
  int counter = 0;

  List<Widget> listeGenerator() {
    liste =
        List.generate(pow(numberOfRows, 2), (index) => TileWidget(Tile(index)));
    return liste;
  }

  @override
  Widget build(BuildContext context) {
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
                      child: listeGenerator()[index],
                      decoration: BoxDecoration(
                          color: isEmptyValue == null
                              ? Colors.grey
                              : index == isEmptyValue
                                  ? Colors.white
                                  : Colors.grey,
                          border: Border.all(
                              color: isEmptyValue == null || started == false
                                  ? Colors.transparent
                                  : isClickable(index)
                                      ? Colors.red
                                      : Colors.transparent,
                              width: 5)),
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
}
