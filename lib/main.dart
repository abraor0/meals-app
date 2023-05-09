import 'package:flutter/material.dart';

import './widgets/app_scaffold.dart';
import './categories_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      home: Home(),
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.orange,
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
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: CategoriesScreen(),
      title: 'DeliMeals',
    );
  }
}
