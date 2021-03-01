import 'dart:math';

import 'package:flutter/material.dart';

import 'Exercice2b.dart';
import 'main.dart';

class Exercice2 extends StatefulWidget {
  Exercice2({Key key}) : super(key: key);

  @override
  _Exercice2State createState() => _Exercice2State();
}

class _Exercice2State extends State<Exercice2> {
  double rotateXSliderValue;
  double rotateZSliderValue;
  double translateZSliderValue;
  bool mirror;

  @override
  void initState() {
    super.initState();
    rotateXSliderValue = 0;
    rotateZSliderValue = 0;
    translateZSliderValue = 100;
    mirror = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rotate and Resize Image'),
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 400,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(color: Colors.white),
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4(
                  1,
                  0,
                  0,
                  0,
                  0,
                  1,
                  0,
                  0,
                  0,
                  0,
                  1,
                  0,
                  0,
                  0,
                  0,
                  1,
                )
                  ..rotateX(pi / 180 * rotateXSliderValue)
                  ..rotateY(mirror ? pi : 0)
                  ..rotateZ(pi / 180 * rotateZSliderValue)
                  ..scale(translateZSliderValue / 100),
                child: Image(
                  image: AssetImage('assets/images/Image.jpg'),
                ),
              ),
            ),
            //),
            Container(
                width: 250,
                child: Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      'Rotate X',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0A3068)),
                    ),
                    Slider(
                      value: rotateXSliderValue,
                      min: 0,
                      max: 180,
                      label: rotateXSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          rotateXSliderValue = value;
                        });
                      },
                    )
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      'Rotate Z',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0A3068)),
                    ),
                    Slider(
                      value: rotateZSliderValue,
                      min: 0,
                      max: 180,
                      label: rotateZSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          rotateZSliderValue = value;
                        });
                      },
                    )
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    SizedBox(width: 10),
                    Text(
                      'Mirror :',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0A3068)),
                    ),
                    SizedBox(width: 70),
                    Checkbox(
                      value: mirror,
                      onChanged: (value) {
                        setState(() {
                          mirror = !mirror;
                        });
                      },
                    ),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(
                      'Scale',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0A3068)),
                    ),
                    Slider(
                      value: translateZSliderValue,
                      min: 0,
                      max: 100,
                      label: translateZSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          translateZSliderValue = value;
                        });
                      },
                    )
                  ]),
                ])),
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
                          builder: (context) => Exercice2b(),
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
          ],
        ));
  }
}
