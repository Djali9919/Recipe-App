import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../models/meal.dart';

class FavouritesScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: ((context, index) => MealItem(
            mealId: widget.favouriteMeals[index].id,
            affordability: widget.favouriteMeals[index].affordability,
            complexity: widget.favouriteMeals[index].complexity,
            duration: widget.favouriteMeals[index].duration,
            imageUrl: widget.favouriteMeals[index].imageUrl,
            title: widget.favouriteMeals[index].title)),
        itemCount: widget.favouriteMeals.length,
      ),
    );
  }
}
