import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shakshuka/screens/splash_screen.dart';
import 'package:shakshuka/services/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'recipe.dart';
import 'recipe_card.dart';
import 'screens/search.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //int _selectedIndex = 0;
  runApp(MyApp(
    prefs: prefs,
  ));
}

// TODO: Refactor Genric MyApp with proper name
class MyApp extends StatelessWidget {
  // intit states for firebase instance
  final SharedPreferences prefs;
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  //require that that prefs be passed in when MyApp is called
  MyApp({Key? key, required this.prefs}) : super(key: key);

  // with all values passed in we now intilize our auth provider with that data by shadowing the variables
  // this will also help us determin the login state of the user in the splash screen
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(
            create: (_) => AuthProvider(
              auth: FirebaseAuth.instance,
              googleSignIn: GoogleSignIn(),
              // ignore: unnecessary_this
              prefs: this.prefs,
              // ignore: unnecessary_this
              db: this.firebaseFirestore,
            ),
          ),
        ],
        // this will return splash screen which will determin where to redirect useres based on login state
        child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Shakshuka',
            home: SplashPage()));
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
    RecipeCardPage(),
    GroceryPage(),
    Search(),
  ];

  void _onItemTapped(int index) {
    setState(() {
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
        onPressed: () {
          print('asdf');
        },
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
                    onPressed: () {
                      print('I\'ve been pressed!');
                    },
                    icon: const Icon(Icons.ac_unit),
                    label: const Text(
                      'myLabel',
                      style: TextStyle(color: Colors.black),
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
                    onPressed: () {
                      print('I\'ve been pressed!');
                    },
                    icon: const Icon(Icons.account_box),
                    label: const Text(
                      'Personeax',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.amber[600]),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}

class RecipeCardPage extends StatefulWidget {
  const RecipeCardPage({Key? key}) : super(key: key);
  @override
  _RecipeCardPageState createState() => _RecipeCardPageState();
}

class _RecipeCardPageState extends State<RecipeCardPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      /*  Take the list of Recipes "recipes", and then for each member of that
      list we name "recipe", we take that member and shove it into a RecipeCard
      Widget. We then convert this mapping into a list  */
      children: recipes.map((recipe) => RecipeCard(recipe: recipe)).toList(),
    );
  }
}

class GroceryPage extends StatelessWidget {
  const GroceryPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.asset('res/img/shakshuka.jpg');
  }
}
