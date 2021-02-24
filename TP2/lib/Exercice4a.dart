import 'dart:math';

import 'package:flutter/material.dart';

class Exercice4a extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final numberOfRows = 3;
    return Material(
        type: MaterialType.transparency,
        child: GridView.count(
            primary: false,
            padding: const EdgeInsets.fromLTRB(20, 100, 20, 100),
            crossAxisSpacing: 3,
            mainAxisSpacing: 2,
            crossAxisCount: numberOfRows,
            children: List.generate(pow(numberOfRows, 2), (index) {
              return Container(
                child: Center(child: Text('Tile ${index + 1}')),
                color: Colors.teal[(index + 1) * 100],
              );
            })));
  }
}
