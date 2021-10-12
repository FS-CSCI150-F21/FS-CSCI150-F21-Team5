import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/recipe_page.dart';
import 'pages/grocery_page.dart';
import 'pages/search_page.dart';




void main() {
  //int _selectedIndex = 0;
  runApp(const ShakshukaApp());
}




class ShakshukaApp extends StatelessWidget {
  const ShakshukaApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shakshuka',
      /*theme: ThemeData(
        // This is the theme of your application.
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),*/
      home: AppWrapper(),
    );
  }
}




class AppWrapper extends StatefulWidget {
  const AppWrapper({Key? key}) : super(key: key);
  @override
  _AppWrapperState createState() => _AppWrapperState();
}

class _AppWrapperState extends State<AppWrapper> {
  int _selectedIndex = 0;

  // this is the list of pages the bottom navigation bar will address
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    RecipePage(),
    GroceryPage(),
    SearchPage(),
  ];

  void _onItemTapped(int index) {
    setState((){
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Shakshuka',
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange[900],
      ),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      //https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepOrange[900],
        selectedItemColor: Colors.amber[600],
        unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

        // background colors only change with "type: .shifting"
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            //backgroundColor: Colors.deepOrange,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Recipes',
            //backgroundColor: Colors.amber,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.kitchen),
            label: 'Grocery List',
            //backgroundColor: Colors.purple,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            //backgroundColor: Colors.pink,
          ),

        ],
      ),
    );
  }
}
