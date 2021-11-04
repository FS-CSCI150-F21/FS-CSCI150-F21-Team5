import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Juan is building this

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  // if the statemangement logic says their was an error logining in it will display a sanckbar informing the user of the error
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            height: 100,
            padding: const EdgeInsets.fromLTRB(30.0, 50.0, 0.0, 0.0),
            child: Row(
              children: const [
                Text(
                  "Search",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.all(40.0),
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
