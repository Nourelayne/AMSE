import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_app/constants.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAEBF3),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 10, top: 40),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'About',
                      style: TextStyle(
                          letterSpacing: 3,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0A3068)),
                    ),
                  ])),
          SizedBox(
            height: 30,
          ),
          Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                    radius: 50.0,
                    backgroundColor: Color(0xFF0A3068),
                    child: CircleAvatar(
                      radius: 45.0,
                      backgroundImage: AssetImage(profile_picture),
                    )),
                Column(children: <Widget>[
                  Text(
                    'Salah Eddine Nourelayne',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A3068),
                    ),
                  ),
                  Text(
                    'IT Engineering Student at IMT Lille Douai',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  )
                ]),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Column(children: <Widget>[
              Text('Description',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0A3068),
                    fontSize: 25,
                  )),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  '\"This is my first App using Flutter for a School project, it\'s about a simple music app with functionalities like searching for or liking a Music, they\'re still however a lot of things to add to make this app much better and more complex.\"',
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 7,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ]),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(children: <Widget>[
                  Text('Version: 1.0.0',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A3068),
                        fontSize: 20,
                      )),
                ]),
                Column(children: <Widget>[
                  Text('Contact Us : ',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0A3068),
                        fontSize: 20,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 22.0,
                          backgroundColor: Color(0xFF0A3068),
                          child: CircleAvatar(
                            radius: 20.0,
                            backgroundImage: AssetImage(instagram_icon),
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        radius: 22.0,
                        backgroundColor: Color(0xFF0A3068),
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundImage: AssetImage(facebook_icon),
                        ),
                      ),
                    ],
                  )
                ]),
              ],
            ),
          ]),
        ],
      ),
    );
  }
}
