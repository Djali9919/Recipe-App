import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class RecipeScreen extends StatelessWidget {
  final Function setFavourite;
  final Function isFavourite;
  RecipeScreen(this.setFavourite, this.isFavourite);
  Widget buildIngredients(List ingredients) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        children: ingredients.map((e) {
          return Container(
            width: double.infinity,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.yellow,
              child: Padding(
                padding: EdgeInsets.only(top: 5, bottom: 5),
                child: Text(
                  e,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget buildSteps(List steps, BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        children: steps.map((e) {
          return Container(
              // color: Color.fromRGBO(255, 190, 253, 1),
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 7),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Text(
                    (steps.indexOf(e) + 1).toString(),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                title: Text(
                  e,
                  style: TextStyle(color: Colors.black),
                ),
              ));
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as String;
    final id = routeArgs;
    final mealSelect = DUMMY_MEALS.firstWhere((element) {
      return element.id == id;
    });
    final ingredients = mealSelect.ingredients;
    final steps = mealSelect.steps;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setFavourite(id);
          },
          child: Icon(
            isFavourite(id) ? Icons.star : Icons.star_border,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(title: Text(mealSelect.title)),
        body: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: Image.network(
                mealSelect.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            buildIngredients(ingredients),
            SizedBox(
              height: 8,
            ),
            Text(
              'Description',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            buildSteps(steps, context),
          ],
        ));
  }
}
