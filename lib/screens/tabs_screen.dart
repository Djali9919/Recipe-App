import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/drawer.dart';
import './categories_screen.dart';
import './favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabsScreen(this.favouriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  void _showScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).primaryColor;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: bgColor,
        unselectedItemColor: Colors.white,
        unselectedLabelStyle: TextStyle(color: Colors.white),
        unselectedFontSize: 14,
        selectedLabelStyle: TextStyle(color: Colors.amber),
        selectedItemColor: Colors.amber,
        selectedFontSize: 16,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
              // color: Colors.black,
            ),
            label: 'Categories',
            // backgroundColor: Colors.black
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star_border,
              // color: Colors.black,
            ),
            label: 'Favourites',
            // backgroundColor: Colors.white
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int a) => _showScreen(a),
      ),
      body: _selectedIndex == 0
          ? CategoriesScreen()
          : FavouritesScreen(widget.favouriteMeals),
      appBar: AppBar(
        title: _selectedIndex == 0 ? Text('Categories') : Text('Favourites'),
      ),
      drawer: SideDrawer(),
    );
  }
}
