import 'package:flutter/material.dart';
import '../widgets/recipe_card.dart';

class SliverTestPage extends StatefulWidget {
  const SliverTestPage({Key? key}) : super(key: key);

  @override
  _SliverTestPageState createState() => _SliverTestPageState();
}

class _SliverTestPageState extends State<SliverTestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppBar')),
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: Colors.amber,
            floating: false,
            expandedHeight: 120,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('SliverList'),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return Container(
                      height: 50,
                      alignment: Alignment.center,
                      color: Colors.deepOrange[100 * (index % 9)],
                      child: Text('deepOrange $index'),
                    );
                  }
              ),
          ),
        ],
      ),
    );
  }
}
