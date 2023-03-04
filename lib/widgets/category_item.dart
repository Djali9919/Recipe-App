import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final color;
  final String title;
  static String catItemPath = '/selected_category_item';
  const CategoryItem(this.color, this.title, this.id);
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed(catItemPath, arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                color.withOpacity(0.5),
                color,
              ], begin: Alignment.topRight, end: Alignment.bottomLeft),
              borderRadius: BorderRadius.circular(5)),
          child: Text(title,
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          alignment: Alignment.topLeft),
    );
  }
}
