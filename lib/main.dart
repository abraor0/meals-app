import 'package:flutter/material.dart';
import 'package:meals_app/categories_screen.dart';
import 'package:meals_app/category_meals_screen.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/favorites_screen.dart';
import 'package:meals_app/filters_screen.dart';
import 'package:meals_app/meal_detail_screen.dart';
import 'package:meals_app/models/IMeal.dart';
import 'package:meals_app/tab_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<IMeal> _availableMeals = DUMMY_MEALS;
  List<IMeal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
    });

    _availableMeals = DUMMY_MEALS.where((meal) {
      if (_filters['gluten']! && !meal.isGlutenFree) {
        return false;
      }
      if (_filters['lactose']! && !meal.isLactoseFree) {
        return false;
      }
      if (_filters['vegan']! && !meal.isVegan) {
        return false;
      }
      if (_filters['vegetarian']! && !meal.isVegetarian) {
        return false;
      }

      return true;
    }).toList();
  }

  void _toggleFavoriteMeal(String id) {
    final doesExist = _favoriteMeals.indexWhere((element) => element.id == id);
    if (doesExist >= 0) {
      setState(() {
        _favoriteMeals.removeAt(doesExist);
      });
    } else {
      _favoriteMeals.add(DUMMY_MEALS.firstWhere((element) => element.id == id));
    }
  }

  bool _isMealFavorited(String id) {
    return _favoriteMeals.indexWhere((element) => element.id == id) >= 0
        ? true
        : false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        fontFamily: 'Raleway',
        colorSchemeSeed: Colors.orange,
        primaryTextTheme: ThemeData.light().textTheme.copyWith(
            titleMedium: const TextStyle(
              color: Colors.white,
              fontFamily: 'RobotoCondensed',
            ),
            titleSmall: const TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 22,
            )),
      ),
      routes: {
        '/': (context) => TabScreen(_favoriteMeals),
        '/categories': (context) => const CategoriesScreen(),
        '/category': (context) => CategoryMealsScreen(_availableMeals),
        '/favorites': (context) => FavoritesScreen(_favoriteMeals),
        '/meal-detail': (context) =>
            MealDetailScreen(_toggleFavoriteMeal, _isMealFavorited),
        '/filters': (context) => FiltersScreen(_filters, _setFilters)
      },
    );
  }
}
