import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shakshuka/screens/splash_screen.dart';
import 'package:shakshuka/services/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/home_page.dart';
import 'pages/recipe_page.dart';
import 'pages/grocery_page.dart';
import 'pages/search_page.dart';

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
    RecipePage(),
    GroceryPage(),
    SearchPage(),
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
