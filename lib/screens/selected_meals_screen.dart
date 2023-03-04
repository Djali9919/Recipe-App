import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy_data.dart';

class SelectedCategoryItem extends StatefulWidget {
  final List filteredMeals;
  const SelectedCategoryItem(this.filteredMeals);

  @override
  State<SelectedCategoryItem> createState() => _SelectedCategoryItemState();
}

class _SelectedCategoryItemState extends State<SelectedCategoryItem> {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final title = routeArgs['title'].toString();
    final id = routeArgs['id'].toString();
    final categoryMeal = widget.filteredMeals.where(((element) {
      return element.categories.contains(id);
    })).toList();
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: ListView.builder(
          itemBuilder: ((context, index) {
            return MealItem(
                mealId: categoryMeal[index].id,
                affordability: categoryMeal[index].affordability,
                complexity: categoryMeal[index].complexity,
                duration: categoryMeal[index].duration,
                imageUrl: categoryMeal[index].imageUrl,
                title: categoryMeal[index].title);
          }),
          itemCount: categoryMeal.length,
        ));
  }
}
