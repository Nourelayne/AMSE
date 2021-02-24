import 'package:flutter/material.dart';

import 'Exercice3.dart';

class Exercice7 extends StatefulWidget {
  @override
  _Exercice7State createState() => _Exercice7State();
}

class _Exercice7State extends State<Exercice7> {
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
            child: Column(children: [
          new Expanded(
              child: GridView.count(
            primary: false,
            padding: const EdgeInsets.fromLTRB(20, 100, 20, 100),
            crossAxisSpacing: 3,
            mainAxisSpacing: 2,
            crossAxisCount: numberOfRows,
            children: children,
          )),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: IconButton(
                    icon: Icon(Icons.horizontal_rule),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        if (numberOfRows > 1) {
                          numberOfRows--;
                        }
                      });
                    })),
            RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.white,
                    onPressed: () {
                      setState(() {
                        if (numberOfRows < 10) {
                          numberOfRows++;
                        }
                      });
                    })),
          ]),
        ])));
  }
}
