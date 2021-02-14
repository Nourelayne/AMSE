import 'package:flutter/material.dart';
import 'package:music_app/constants.dart';
import './bibliotheque.dart';
import 'package:music_app/screens/MusicInfo.dart';

class Favoris extends StatefulWidget {
  final Set<SongCard> saved;

  Favoris({this.saved});

  @override
  _FavorisState createState() => _FavorisState();
}

class _FavorisState extends State<Favoris> {
  Favoris fav = new Favoris(
    saved: saved,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAEBF3),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 40),
            child: Text(
              'Your Favorite Music',
              style: TextStyle(
                  letterSpacing: 3,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0A3068)),
            ),
          ),
          //Container For Trending Songs
          SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: saved.length == 0
                ? Center(
                    child: Text('No Favorite Music Yet  :(',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        )))
                : Column(
                    children: saved.map((e) => createCard(e)).toList(),
                  ),
          ),
          //Navigation Buttons
        ],
      ),
    );
  }

  Widget createCard(SongCard songcard) {
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MusicInfo(
                  songcard: songcard,
                ),
              ));
        },
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: songcard.saved
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
                  color: songcard.saved ? Colors.red : Color(0xFF0A3068),
                  onPressed: () {
                    setState(() {
                      if (songcard.saved) {
                        songcard.saved = false;
                        saved.remove(songcard);
                      } else {
                        songcard.saved = true;
                        saved.add(songcard);
                      }
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(songcard.img),
                  radius: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(songcard.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0A3068),
                          fontSize: 16,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      songcard.artist,
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
                    )
                  ],
                ),
                Spacer(),
                Text(songcard.time,
                    style: TextStyle(
                      color: Color(0xFF0A3068),
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  width: 10,
                ),
                IconButton(
                  icon: Icon(Icons.access_time),
                  iconSize: 25,
                  color: Color(0xFF0A3068),
                  onPressed: () {},
                ),
              ],
            ),
            if (songcard.sr < songs.length) Divider(),
          ],
        ));
  }
}
