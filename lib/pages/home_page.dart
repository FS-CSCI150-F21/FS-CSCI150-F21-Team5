import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  //Color? primaryColor = Colors.deepOrange[900];
  //Color? secondaryColor = Colors.amber[600];
  //Color? lightBdColor = Colors.grey[200];
  //Color? lightBdAtColor = Colors.grey[300];
  const Home({Key? key}) : super(key: key);
  // override "StatelessWidget"'s "build" method with this
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed: () { print('asdf'); },
        child: const Icon(Icons.add), //const Text('click'),
        backgroundColor: Colors.amber[600],
      ),

      body: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(0.0),

        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[

              const SizedBox(height: 32.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  ElevatedButton.icon(
                    onPressed: () { print('I\'ve been pressed!'); },
                    icon: const Icon(Icons.ac_unit),
                    label: const Text(
                      'myLabel',
                      style: TextStyle(
                          color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.amber[600]),
                  ),
                  Container(
                    color: Colors.deepOrange[900],
                    padding: const EdgeInsets.all(16.0),
                    child: const Text('Look At Me!'),
                  ),
                  Container(
                    color: Colors.deepOrange[900],
                    padding: const EdgeInsets.all(16.0),
                    child: const Text('Look At Me Harder!'),
                  ),

                ],
              ),

              const Divider(
                height: 32.0,
                color: Colors.deepOrange,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  ElevatedButton.icon(
                    onPressed: () { print('I\'ve been pressed!'); },
                    icon: const Icon(Icons.account_box),
                    label: const Text(
                      'Personeax',
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.amber[600]),
                  ),

                ],
              ),

            ]
        ),
      ),

    );
  }
}