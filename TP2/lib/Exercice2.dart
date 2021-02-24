import 'dart:math';

import 'package:flutter/material.dart';

class Exercice2 extends StatefulWidget {
  Exercice2({Key key}) : super(key: key);

  @override
  _Exercice2State createState() => _Exercice2State();
}

class _Exercice2State extends State<Exercice2> {
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
                  ]))
            ])));
  }
}
