import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealItem extends StatelessWidget {
  final String mealId;
  final String title;
  final String imageUrl;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;
  const MealItem(
      {required this.mealId,
      required this.affordability,
      required this.complexity,
      required this.duration,
      required this.imageUrl,
      required this.title});
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  static const String recipePath = '/recipeScreen';
  void mealSelected(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(recipePath, arguments: mealId);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => mealSelected(context)),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(15),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Image.network(
                      imageUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    )),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: Container(
                    width: 250,
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 26),
                    ),
                  ),
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(children: [
                      Icon(Icons.timer),
                      SizedBox(
                        width: 6,
                      ),
                      Text(duration.toString() + ' min'),
                    ]),
                    Row(children: [
                      Icon(Icons.architecture_sharp),
                      SizedBox(
                        width: 6,
                      ),
                      Text(complexityText),
                    ]),
                    Row(
                      children: [
                        Icon(Icons.attach_money_outlined),
                        SizedBox(
                          width: 6,
                        ),
                        Text(affordabilityText),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
