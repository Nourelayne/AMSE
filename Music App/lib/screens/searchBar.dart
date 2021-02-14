import 'package:flutter/material.dart';
import 'package:music_app/constants.dart';
import 'package:music_app/screens/MusicInfo.dart';

class SearchBar extends StatefulWidget {
  final List<String> list = [
    "This Life - Vampire Weekend",
    "Floating Through Space - Sia and David Guetta",
    "Fly Away - Lenny Kravitz",
    "Speed Of Sound - Coldplay",
    "Miami 82 - Syn Cole (Kygo Remix)",
    "Where Is My Mind - Pixies"
  ];

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  bool _folded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFEAEBF3),
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 40),
                child: Text(
                  'Search',
                  style: TextStyle(
                      letterSpacing: 3,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A3068)),
                ),
              ),
              SizedBox(
                height: 120,
              ),
              Center(
                  child: Container(
                      width: 450,
                      height: 300,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(background),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '   Are You searching for a Music ?',
                              style: TextStyle(
                                  letterSpacing: 2,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0A3068)),
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 400),
                              width: _folded ? 60 : 250,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: Colors.white,
                                boxShadow: kElevationToShadow[6],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(left: 16),
                                      child: !_folded
                                          ? TextField(
                                              decoration: InputDecoration(
                                                  hintText: 'Search',
                                                  hintStyle: TextStyle(
                                                      color: Color(0xFF0A3068)),
                                                  border: InputBorder.none),
                                              onTap: () {
                                                FocusScopeNode currentFocus =
                                                    FocusScope.of(context);

                                                if (!currentFocus
                                                        .hasPrimaryFocus &&
                                                    currentFocus.focusedChild !=
                                                        null) {
                                                  currentFocus.focusedChild
                                                      .unfocus();
                                                }
                                                showSearch(
                                                    context: context,
                                                    delegate:
                                                        Search(widget.list));
                                              },
                                            )
                                          : null,
                                    ),
                                  ),
                                  Container(
                                    child: Material(
                                      type: MaterialType.transparency,
                                      child: InkWell(
                                        borderRadius: BorderRadius.only(
                                          topLeft:
                                              Radius.circular(_folded ? 32 : 0),
                                          topRight: Radius.circular(32),
                                          bottomLeft:
                                              Radius.circular(_folded ? 32 : 0),
                                          bottomRight: Radius.circular(32),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4, vertical: 0),
                                          child: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                _folded = !_folded;
                                              });
                                            },
                                            icon: _folded
                                                ? Icon(Icons.search)
                                                : Icon(Icons.close),
                                            color: Color(0xFF0A3068),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ])))
            ])));
  }
}

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    var t = (selectedResult.split("-"))[0];
    final sc = songs.firstWhere((e) => e.title == t.trim());
    return Container(
      child: Center(
          child: MusicInfo(
        songcard: sc,
      )),
    );
  }

  final List<String> listExample;
  Search(this.listExample);

  List<String> recentList = [
    "Floating Through Space - Sia and David Guetta",
    "Speed Of Sound - Coldplay"
  ];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList //In the true case
        : suggestionList.addAll(listExample.where(
            // In the false case
            (element) => element.contains(query),
          ));
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
          ),
          leading: query.isEmpty ? Icon(Icons.access_time) : SizedBox(),
          onTap: () {
            selectedResult = suggestionList[index];
            showResults(context);
          },
        );
      },
    );
  }
}
