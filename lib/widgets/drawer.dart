import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 5,
      child: ListView(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.all(10),
            height: 100,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            child: Text(
              'Menu',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
            leading: Icon(
              Icons.restaurant,
              size: 24,
              color: Colors.black,
            ),
            title: Text(
              'Categories',
              style: TextStyle(fontSize: 24, color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushNamed(Filters.filtersPath);
            },
            leading: Icon(
              Icons.filter,
              size: 24,
              color: Colors.black,
            ),
            title: Text('Filters',
                style: TextStyle(fontSize: 24, color: Colors.black)),
          )
        ],
      ),
    );
  }
}
