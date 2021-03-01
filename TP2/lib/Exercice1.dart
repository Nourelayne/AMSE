import 'package:flutter/material.dart';

import 'Exercice2.dart';
import 'main.dart';

class Exercice1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Display an image'),
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
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
              width: 400,
              child: Image(
                image: AssetImage('assets/images/Image.jpg'),
              )),
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
                        builder: (context) => Exercice2(),
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
          )
        ]));
  }
}
