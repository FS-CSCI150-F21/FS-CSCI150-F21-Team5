import 'package:flutter/material.dart';

void main() {
  //int _selectedIndex = 0;
  runApp(const ShakshukaApp());
}


class ShakshukaApp extends StatelessWidget {
  const ShakshukaApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
      home: StatefulScreen(),//Home(),//
    );
  }
}




class StatefulScreen extends StatefulWidget {
  const StatefulScreen({Key? key}) : super(key: key);
  @override
  _StatefulScreenState createState() => _StatefulScreenState();
}

class _StatefulScreenState extends State<StatefulScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 24, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    /*Text(
      'Index 0: Home',
      style: optionStyle,
    ),*/
    Home(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
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

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.deepOrange,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
            backgroundColor: Colors.green,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
            backgroundColor: Colors.purple,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[600],
        onTap: _onItemTapped,
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

      /*appBar: AppBar(
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
      ),*/

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
                  child: const Text('Click Me!'),
                ),
                Container(
                  color: Colors.deepOrange[900],
                  padding: const EdgeInsets.all(16.0),
                  child: const Text('Click Me Harder!'),
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

      /*Center(
        child: ElevatedButton.icon(
          onPressed: () {
            print('I\'ve been pressed!');
          },
          icon: const Icon(Icons.ac_unit),
          label: const Text('myLabel'/*, style: TextStyle(color: Colors.black),*/),
          style: ElevatedButton.styleFrom(primary: Colors.amber[600]),
        ),
        //Image.asset('res/img/shakshuka.jpg'),
      ),*/

          //Image.network('https://p0.pxfuel.com/preview/18/265/193/food-shakshouka-israel-tel-aviv.jpg'),
          /*Text(
          'Shakshuka is delicious!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange[900],
            fontFamily: 'Roboto',*/

      /*bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          //onTap: /*_onItemTapped*/_selectedIndex = 0,
        ),*/













/*
void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
