import 'package:flutter/material.dart';
import 'package:meals_app/models/IMeal.dart';

import './categories_screen.dart';
import './favorites_screen.dart';
import './widgets/app_scaffold.dart';

class TabScreen extends StatefulWidget {
  final List<IMeal> favoriteMeals;

  const TabScreen(this.favoriteMeals, {super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Widget> _pages = [];
  int _currentPageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pages = [CategoriesScreen(), FavoritesScreen(widget.favoriteMeals)];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  String get pageName {
    if (_currentPageIndex == 0) {
      return 'DeliMeals';
    } else {
      return 'Favorite Meals';
    }
  }

  Widget bottomNavBuilder() {
    return BottomNavigationBar(
      onTap: _selectPage,
      currentIndex: _currentPageIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.food_bank),
          label: 'All',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: pageName,
      bottomNav: bottomNavBuilder(),
      drawer: true,
      child: _pages[_currentPageIndex],
    );
  }
}
