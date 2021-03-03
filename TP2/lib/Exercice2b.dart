import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'Exercice3.dart';
import 'main.dart';

class Exercice2b extends StatefulWidget {
  Exercice2b({Key key}) : super(key: key);

  @override
  _Exercice2bState createState() => _Exercice2bState();
}

class _Exercice2bState extends State<Exercice2b> {
  double rotateXSliderValue;
  double rotateZSliderValue;
  double translateZSliderValue;
  bool mirror;
  bool play;

  @override
  void initState() {
    super.initState();
    rotateXSliderValue = 0;
    rotateZSliderValue = 0;
    translateZSliderValue = 100;
    mirror = false;
    play = false;
  }

  void animateRotationX(Timer t) {
    if (play == true) {
      setState(() {
        if (rotateXSliderValue < 180) {
          rotateXSliderValue++;
        } else {
          rotateXSliderValue = 0;
          animateRotationX(t);
        }
      });
    } else {
      t.cancel();
    }
  }

  void animateRotationZ(Timer t) {
    if (play == true) {
      setState(() {
        if (rotateZSliderValue < 180) {
          rotateZSliderValue++;
        } else {
          rotateZSliderValue = 0;
          animateRotationZ(t);
        }
      });
    } else {
      t.cancel();
    }
  }

  void animateTranslationZ(Timer t) {
    if (play == true) {
      setState(() {
        if (translateZSliderValue > 0) {
          translateZSliderValue--;
        } else {
          translateZSliderValue = 100;
          animateTranslationZ(t);
        }
      });
    } else {
      t.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animated Rotate and Resize Image'),
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
                      SizedBox(
                        width: 70,
                      ),
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
                      SizedBox(
                        width: 10,
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
                    RawMaterialButton(
                      onPressed: () {
                        setState(() {
                          play = !play;
                          Duration d1 = Duration(milliseconds: 20);
                          Duration d2 = Duration(milliseconds: 30);
                          Duration d3 = Duration(milliseconds: 10);
                          if (play == true) {
                            Timer.periodic(d1, animateRotationX);
                            Timer.periodic(d2, animateRotationZ);
                            Timer.periodic(d3, animateTranslationZ);
                          }
                        });
                      },
                      elevation: 2.0,
                      fillColor: Colors.blue,
                      child: Icon(
                        (play ? Icons.pause : Icons.play_arrow),
                        size: 25.0,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(15.0),
                      shape: CircleBorder(),
                    ),
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
                            builder: (context) => Exercice3(),
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
