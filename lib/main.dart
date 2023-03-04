import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import './screens/filters_screen.dart';
import './widgets/category_item.dart';
import './screens/recipe_screen.dart';
import './screens/selected_meals_screen.dart';
import './widgets/meal_item.dart';
import './screens/tabs_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String mealId = '';
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'veg': false,
    'lactose': false,
  };
  List<Meal> _filteredItems = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];
  void _setFavourites(String id) {
    var existingIndex =
        _favouriteMeals.indexWhere((element) => element.id == id);
    if (existingIndex >= 0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favouriteMeals
            .add(DUMMY_MEALS.firstWhere((element) => element.id == id));
      });
    }
  }

  bool _isFavorite(String id) {
    return _favouriteMeals.any((element) => element.id == id);
  }

  void _setFilters(Map<String, bool> setFilters) {
    setState(() {
      _filters = setFilters;
      _filteredItems = DUMMY_MEALS.where((element) {
        if ((_filters['gluten'] == true) && !element.isGlutenFree) {
          return false;
        }
        if ((_filters['vegan'] == true) && !element.isVegan) {
          return false;
        }
        if ((_filters['veg'] == true) && !element.isVegetarian) {
          return false;
        }
        if ((_filters['lactose'] == true) && !element.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.amberAccent,
        canvasColor: Color.fromRGBO(244, 238, 227, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Colors.black),
              bodyText2: TextStyle(color: Colors.black),
              // titleMedium:
              //     TextStyle(fontFamily: 'RobotoCondensed', fontSize: 20),
            ),
      ),
      routes: {
        '/': (context) => TabsScreen(_favouriteMeals),
        CategoryItem.catItemPath: (ctx) => SelectedCategoryItem(_filteredItems),
        MealItem.recipePath: (ctx) => RecipeScreen(_setFavourites, _isFavorite),
        Filters.filtersPath: ((context) => Filters(_setFilters, _filters))
      },
    );
  }
}
