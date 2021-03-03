import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tp_2/Exercice7.dart';
import 'package:tp_2/main.dart';

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
      child: Text('${tile.number}'),
    );
  }
}

class Exercice6 extends StatefulWidget {
  @override
  _Exercice6State createState() => _Exercice6State();
}

class _Exercice6State extends State<Exercice6> {
  int numberOfRows;
  static int isEmptyValue;
  List<Widget> liste;
  bool started;
  int counter;

  @override
  void initState() {
    super.initState();
    numberOfRows = 3;
    liste = List.generate(pow(10, 2), (index) => TileWidget(Tile(index)));
    started = false;
    counter = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Taquin Board'),
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
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                                isEmptyValue =
                                    random.nextInt(pow(numberOfRows, 2) - 1);
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
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 480, // constrain height
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 2,
                        crossAxisCount: numberOfRows,
                        children: List.generate(
                            pow(numberOfRows, 2),
                            (index) => InkWell(
                                child: Container(
                                  child: liste[index],
                                  decoration: BoxDecoration(
                                      color: isEmptyValue == null
                                          ? Colors.grey
                                          : index == isEmptyValue
                                              ? Colors.white
                                              : Colors.grey,
                                      border: Border.all(
                                          color: isEmptyValue == null ||
                                                  started == false
                                              ? Colors.transparent
                                              : isSwappable(index)
                                                  ? Colors.red
                                                  : Colors.transparent,
                                          width: 5)),
                                ),
                                onTap: () {
                                  swapTiles(index);
                                })),
                      )),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
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
                                  builder: (context) => Exercice7(),
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
                      ]),
                ])));
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
    setState(() {
      if (isSwappable(index)) {
        tempValue = liste[isEmptyValue];

        liste[isEmptyValue] = liste[index];

        liste[index] = tempValue;
        isEmptyValue = index;
      }
    });
  }
}
