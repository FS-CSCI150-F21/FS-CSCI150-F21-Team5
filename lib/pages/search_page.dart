import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Juan is building this

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(16.0),
        child: const TextField(),
      ),
    );
  }
}
