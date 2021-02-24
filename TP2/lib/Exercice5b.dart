import 'dart:math';

import 'package:flutter/material.dart';

Random random = new Random();

class Tile {
  int number;
  bool isEmpty;
  bool isSwapable;

  Tile(this.number, this.isEmpty, this.isSwapable);
}

class TileWidget extends StatefulWidget {
  final Tile tile;

  TileWidget(this.tile);

  @override
  _TileWidgetState createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> {
  Tile tile;

  @override
  void initState() {
    super.initState();
    tile = widget.tile;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: !tile.isEmpty ? Colors.grey : Colors.white,
            border: Border.all(
                color: tile.isSwapable ? Colors.red : Colors.transparent,
                width: 5)),
        child: Center(
          child: Text('${tile.number}'),
        ));
  }
}

class Exercice5b extends StatefulWidget {
  Exercice5b({Key key}) : super(key: key);

  @override
  _Exercice5bState createState() => _Exercice5bState();
}

class _Exercice5bState extends State<Exercice5b> {
  int numberOfRows = 4;
  List<Widget> liste;

  List<Widget> listGenerator() {
    int isEmptyValue = random.nextInt(pow(numberOfRows, 2) - 1);
    liste = List.generate(
        pow(numberOfRows, 2),
        (index) => InkWell(
            child: TileWidget(Tile(
                index,
                index == isEmptyValue ? true : false,
                (isEmptyValue - index).abs() == 4 ||
                        (isEmptyValue - index).abs() == 1
                    ? true
                    : false)),
            onTap: () {
              setState(() {
                if ((isEmptyValue - index).abs() == 4) {
                  print(
                      '${liste[index].hashCode} ${liste[isEmptyValue].hashCode}');
                  liste.insert(isEmptyValue, liste.removeAt(index));
                  print(
                      '${liste[index].hashCode} ${liste[isEmptyValue].hashCode}');
                } else if ((isEmptyValue - index).abs() == 1) {
                  print(
                      '${liste[index].hashCode} ${liste[isEmptyValue].hashCode}');
                  liste.insert(isEmptyValue, liste.removeAt(index));
                  print(
                      '${liste[index].hashCode} ${liste[isEmptyValue].hashCode}');
                } else {
                  print('${liste[index].hashCode}');
                }
              });
            }));

    return liste;
  }

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
                crossAxisCount: numberOfRows,
                children: listGenerator())));
  }
}
