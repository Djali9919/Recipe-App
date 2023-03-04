import 'package:flutter/material.dart';
import '../widgets/drawer.dart';

class Filters extends StatefulWidget {
  final Function setFilters;
  final Map<String, bool> currentFilters;
  static String filtersPath = '/Filters';
  Filters(this.setFilters, this.currentFilters);

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _isGlutenFree = false;
  var _isVegan = false;
  var _isLactoseFree = false;
  var _isVegetarian = false;
  @override
  void initState() {
    // TODO: implement initState
    if (widget.currentFilters['gluten'] != null) {
      _isGlutenFree = widget.currentFilters['gluten']!;
    } else {
      _isGlutenFree = false;
    }
    if (widget.currentFilters['lactose'] != null) {
      _isLactoseFree = widget.currentFilters['lactose']!;
    } else {
      _isLactoseFree = false;
    }
    if (widget.currentFilters['vegan'] != null) {
      _isVegan = widget.currentFilters['vegan']!;
    } else {
      _isVegan = false;
    }
    if (widget.currentFilters['veg'] != null) {
      _isVegetarian = widget.currentFilters['veg']!;
    } else {
      _isVegetarian = false;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectFilters = {
                  'gluten': _isGlutenFree,
                  'vegan': _isVegan,
                  'lactose': _isLactoseFree,
                  'veg': _isVegetarian
                };
                widget.setFilters(selectFilters);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Filter Out Your Meals!',
              style: TextStyle(fontSize: 22, fontFamily: 'RobotoCondensed'),
            ),
            alignment: Alignment.center,
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                  title: Text('Gluten Free'),
                  subtitle: Text('Only show meals that are Gluten Free'),
                  value: _isGlutenFree,
                  onChanged: (newValue) {
                    setState(() {
                      _isGlutenFree = newValue;
                    });
                  }),
              SwitchListTile(
                  title: Text('Vegan'),
                  subtitle: Text('Only show meals that are Vegan'),
                  value: _isVegan,
                  onChanged: (newValue) {
                    setState(() {
                      _isVegan = newValue;
                    });
                  }),
              SwitchListTile(
                  title: Text('Lactose Free'),
                  subtitle: Text('Only show meals that are Lactose Free'),
                  value: _isLactoseFree,
                  onChanged: (newValue) {
                    setState(() {
                      _isLactoseFree = newValue;
                    });
                  }),
              SwitchListTile(
                  title: Text('Vegatarian'),
                  subtitle: Text('Only show meals that are Vegetarian'),
                  value: _isVegetarian,
                  onChanged: (newValue) {
                    setState(() {
                      _isVegetarian = newValue;
                    });
                  })
            ],
          ))
        ],
      ),
    );
  }
}
