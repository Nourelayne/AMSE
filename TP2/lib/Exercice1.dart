import 'package:flutter/material.dart';

class Exercice1 extends StatelessWidget {
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
}
