import 'package:flutter/material.dart';

import 'Exercice3.dart';

class Exercice4c extends StatefulWidget {
  @override
  _Exercice4cState createState() => _Exercice4cState();
}

class _Exercice4cState extends State<Exercice4c> {
  final imageUrl = 'assets/images/Image.jpg';
  int numberOfRows;

  @override
  void initState() {
    super.initState();
    numberOfRows = 1;
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];

    for (double i = -1; i <= 1; i += 2 / (numberOfRows - 1)) {
      for (double j = -1; j <= 1; j += 2 / (numberOfRows - 1)) {
        children.add(new Tile(imageURL: imageUrl, alignment: Alignment(j, i))
            .croppedImageTile(1 / numberOfRows, 1 / numberOfRows));
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Exercice_2'),
        ),
        body: Center(
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
              )
            ])));
  }
}
