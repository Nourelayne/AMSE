import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tp_2/Exercice6.dart';

import 'main.dart';

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

class Exercice5b extends StatefulWidget {
  Exercice5b({Key key}) : super(key: key);

  @override
  _Exercice5bState createState() => _Exercice5bState();
}

class _Exercice5bState extends State<Exercice5b> {
  static int isEmptyValue = random.nextInt(pow(4, 2) - 1);
  List<Widget> liste =
      List.generate(pow(4, 2), (index) => TileWidget(Tile(index)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Moving Tiles in Grid'),
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
            child: Column(children: [
              new Expanded(
                  child: GridView.count(
                      padding: const EdgeInsets.fromLTRB(20, 100, 20, 100),
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 2,
                      crossAxisCount: 4,
                      children: List.generate(
                          pow(4, 2),
                          (index) => InkWell(
                              child: Container(
                                child: liste[index],
                                decoration: BoxDecoration(
                                    color: index == isEmptyValue
                                        ? Colors.white
                                        : Colors.grey,
                                    border: Border.all(
                                        color: isSwappable(index)
                                            ? Colors.red
                                            : Colors.transparent,
                                        width: 5)),
                              ),
                              onTap: () {
                                setState(() {
                                  if (isSwappable(index)) {
                                    swapTiles(index);
                                  }
                                });
                              })))),
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
                            builder: (context) => Exercice6(),
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

  bool isSwappable(int index) {
    return ((isEmptyValue != index) &&
        (((isEmptyValue % 4 != 0) && (index + 1 == isEmptyValue)) ||
            (((isEmptyValue + 1) % 4 != 0) && (index - 1 == isEmptyValue)) ||
            (((isEmptyValue + 4 >= 0) && (index + 4 == isEmptyValue))) ||
            (((isEmptyValue + 4 < 16) && (index - 4 == isEmptyValue)))));
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
