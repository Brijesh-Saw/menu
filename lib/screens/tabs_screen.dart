import 'package:flutter/material.dart';
import 'package:menu/models/meal.dart';
import '../screens/favorites_screen.dart';
import '../widgets/main_drawer.dart';

import './categories_Screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {"page": CategoriesScreen(), "title": "Categories"},
      {
        "page": FavoritesScreen(widget.favoriteMeals),
        "title": "Your Favorites"
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            // ignore: deprecated_member_use
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            // ignore: deprecated_member_use
            title: Text("Favorites"),
          )
        ],
      ),
    );

    // return DefaultTabController(
    //   initialIndex: 0,
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text("Meals"),
    //       bottom: TabBar(
    //         tabs: <Widget>[
    //           Tab(
    //             icon: Icon(Icons.category),
    //             text: "Categories",
    //           ),
    //           Tab(
    //             icon: Icon(Icons.star),
    //             text: "Favorites",
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(children: <Widget>[
    //       CategoriesScreen(),
    //       FavoritesScreen(),
    //     ]),
    //   ),
    // );
  }
}
