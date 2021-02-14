import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bibliotheque.dart';

class MusicInfo extends StatelessWidget {
  final SongCard songcard;

  MusicInfo({this.songcard});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEAEBF3),
        body: Column(children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Color(0xFF0A3068),
                        size: 30,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ])),
          Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                    radius: 120.0,
                    backgroundImage: AssetImage(songcard.img),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    songcard.title,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A3068),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    songcard.artist,
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                      width: 140,
                      height: 40,
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Text(
                          'Play',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {},
                      )),
                  IconButton(
                    icon: songcard.saved
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                    color: songcard.saved ? Colors.red : Color(0xFF0A3068),
                    iconSize: 40,
                    onPressed: () {},
                  ),
                  SizedBox(
                      width: 140,
                      height: 40,
                      child: RaisedButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                        color: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        child: Text(
                          'Delete',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {},
                      )),
                ],
              )
            ],
          ),
        ]));
  }
}
