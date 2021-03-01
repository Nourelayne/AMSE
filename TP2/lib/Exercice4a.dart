import 'dart:math';

import 'package:flutter/material.dart';

import 'Exercice4b.dart';
import 'main.dart';

class Exercice4a extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final numberOfRows = 3;
    return Scaffold(
        appBar: AppBar(
          title: Text('Grid Of Colored Box'),
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
                      }))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    elevation: 2.0,
                    fillColor: Colors.blue,
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 25.0,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: CircleBorder(),
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Exercice4b(),
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
