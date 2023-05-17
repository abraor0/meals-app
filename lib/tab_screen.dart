import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';
import './widgets/app_scaffold.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> _pages = [CategoriesScreen(), FavoritesScreen()];
  int _currentPageIndex = 0;

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
      child: _pages[_currentPageIndex],
      title: pageName,
      bottomNav: bottomNavBuilder(),
      drawer: true,
    );
  }
}
