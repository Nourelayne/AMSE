import 'dart:async';
import "dart:math" show pi;

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

// Exercice 1
/*class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercice_1'),
      ),
      body: const Image(
        image: AssetImage('assets/images/Image.jpg'),
      ),
    );
  }
}*/

//Exercice 2
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _rotateXSliderValue;
  double _rotateZSliderValue;
  double _translateZSliderValue;
  bool _mirror;
  bool _play;

  @override
  void initState() {
    super.initState();
    _rotateXSliderValue = 0;
    _rotateZSliderValue = 0;
    _translateZSliderValue = 100;
    _mirror = false;
    _play = false;
  }

  void animateRotationX(Timer t) {
    if (_play == true) {
      setState(() {
        if (_rotateXSliderValue < 180) {
          _rotateXSliderValue++;
        } else {
          _rotateXSliderValue = 0;
          animateRotationX(t);
        }
      });
    } else {
      t.cancel();
    }
  }

  void animateRotationZ(Timer t) {
    if (_play == true) {
      setState(() {
        if (_rotateZSliderValue < 180) {
          _rotateZSliderValue++;
        } else {
          _rotateZSliderValue = 0;
          animateRotationZ(t);
        }
      });
    } else {
      t.cancel();
    }
  }

  void animateTranslationZ(Timer t) {
    if (_play == true) {
      setState(() {
        if (_translateZSliderValue > 0) {
          _translateZSliderValue--;
        } else {
          _translateZSliderValue = 100;
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
          title: Text('Exercice_2'),
        ),
        body: Center(
            child: Column(
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
                    ..rotateX(pi / 180 * _rotateXSliderValue)
                    ..rotateY(_mirror ? pi : 0)
                    ..rotateZ(pi / 180 * _rotateZSliderValue)
                    ..scale(_translateZSliderValue / 100),
                  child: Image(
                    image: AssetImage('assets/images/Image.jpg'),
                  ),
                ),
              ),
              //),
              Container(
                  width: 230,
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
                        value: _rotateXSliderValue,
                        min: 0,
                        max: 180,
                        label: _rotateXSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _rotateXSliderValue = value;
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
                        value: _rotateZSliderValue,
                        min: 0,
                        max: 180,
                        label: _rotateZSliderValue.round().toString(),
                        onChanged: (double value) {
                          const d = const Duration(milliseconds: 50);
                          setState(() {
                            _rotateZSliderValue = value;
                          });
                        },
                      )
                    ]),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Text(
                        'Mirror :',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0A3068)),
                      ),
                      SizedBox(
                        width: 80,
                      ),
                      Checkbox(
                        value: _mirror,
                        onChanged: (value) {
                          setState(() {
                            _mirror = !_mirror;
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
                        value: _translateZSliderValue,
                        min: 0,
                        max: 100,
                        label: _translateZSliderValue.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            _translateZSliderValue = value;
                          });
                        },
                      )
                    ]),
                    SizedBox(
                        width: 40,
                        height: 40,
                        child: RaisedButton(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: IconButton(
                              icon: _play
                                  ? Icon(Icons.pause)
                                  : Icon(Icons.play_arrow),
                              color: Colors.white,
                              onPressed: () {
                                setState(() {
                                  _play = !_play;
                                  Duration d1 = Duration(milliseconds: 20);
                                  Duration d2 = Duration(milliseconds: 30);
                                  Duration d3 = Duration(milliseconds: 10);
                                  if (_play == true) {
                                    Timer.periodic(d1, animateRotationX);
                                    Timer.periodic(d2, animateRotationZ);
                                    Timer.periodic(d3, animateTranslationZ);
                                  }
                                });
                              }),
                          onPressed: () {},
                        )),
                  ]))
            ])));
  }
}
