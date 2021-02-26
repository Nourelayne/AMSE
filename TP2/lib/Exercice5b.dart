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
        ),
        body: Material(
            type: MaterialType.transparency,
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
                                  color: isClickable(index)
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
                        })))));
  }

  bool isClickable(int index) {
    return ((isEmptyValue != index) &&
        (((isEmptyValue % 4 != 0) && (index + 1 == isEmptyValue)) ||
            (((isEmptyValue + 1) % 4 != 0) && (index - 1 == isEmptyValue)) ||
            (((isEmptyValue + 4 >= 0) && (index + 4 == isEmptyValue))) ||
            (((isEmptyValue + 4 < 16) && (index - 4 == isEmptyValue)))));
  }

  void swapTiles(int index) {
    var temp;
    var temp2;
    temp = liste[isEmptyValue];
    temp2 = isEmptyValue;
    liste[isEmptyValue] = liste[index];
    isEmptyValue = index;
    liste[index] = temp;
    index = temp2;
  }
}
