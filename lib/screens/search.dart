import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:algolia/algolia.dart';

class OldSearch extends StatefulWidget {
  const OldSearch({Key? key}) : super(key: key);

  @override
  _OldSearchState createState() => _OldSearchState();
}

class _OldSearchState extends State<OldSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            height: 100,
            padding: const EdgeInsets.fromLTRB(30.0, 50.0, 0.0, 0.0),
            child: Row(
              children: [
                const Text(
                  "Search",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
                Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                        icon: const Icon(Icons.person),
                        color: Colors.orange,
                        onPressed: () {}))
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const TextField(
              decoration: InputDecoration(),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchText = TextEditingController(text: "");
  List<AlgoliaObjectSnapshot> _results = [];
  bool _searching = false;

  _search() async {
    setState(() {
      _searching = true;
    });

    Algolia algolia = const Algolia.init(
      applicationId: '15SQZUJ0VB',
      apiKey: '98479aad0605e1d0239def199086fd45',
    );

    AlgoliaQuery query = algolia.instance.index('recipes');
    query = query.query(_searchText.text);

    _results = (await query.getObjects()).hits;

    setState(() {
      _searching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text("Search",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                )),
            TextField(
              controller: _searchText,
              decoration: const InputDecoration(
                  hintText: "Search query here...",
                  filled: true,
                  fillColor: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  color: Colors.white,
                  child: const Text(
                    "Search",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: _search,
                ),
              ],
            ),
            Expanded(
              child: _searching == true
                  ? const Center(
                      child: Text("Searching, please wait..."),
                    )
                  : _results.isEmpty
                      ? const Center(
                          child: Text("No results found."),
                        )
                      : ListView.builder(
                          itemCount: _results.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            AlgoliaObjectSnapshot snap = _results[index];

                            return ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: Text((index + 1).toString(),
                                      style:
                                          const TextStyle(color: Colors.black)),
                                ),
                                title: Text(snap.data["name"],
                                    style:
                                        const TextStyle(color: Colors.white)),
                                subtitle: Text(
                                    snap.data["ingredients"][0] +
                                        ", " +
                                        snap.data["ingredients"][1] +
                                        ", " +
                                        snap.data["ingredients"][2] +
                                        ", " +
                                        "...",
                                    style:
                                        const TextStyle(color: Colors.white)));
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
