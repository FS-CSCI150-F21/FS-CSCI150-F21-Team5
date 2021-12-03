import 'package:flutter/material.dart';
import 'package:shakshuka/main.dart';
import 'package:shakshuka/screens/all_recipes.dart';
import 'package:shakshuka/screens/grocery_page.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int currentIndex = 0;
  final screens = [
    const AllRecipes(),
    const GroceryPage(),
    const SearchPage(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          selectedItemColor: Colors.amber.shade600,
          unselectedItemColor: Colors.white,
          selectedFontSize: 14,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded),
              label: 'Recipes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_outlined),
              label: 'Recipes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Recipes',
            ),
          ],
        ),
      );
}
