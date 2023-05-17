import 'package:flutter/material.dart';
import '../tab_screen.dart';
import '../filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget navTileBuilder(BuildContext context, String title, IconData icon,
      VoidCallback tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          fontFamily: 'RobotoCondensed',
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    var topInset = MediaQuery.of(context).viewPadding.top;
    return Drawer(
      child: Column(children: [
        Container(
          alignment: Alignment.centerLeft,
          height: 120 + topInset,
          width: double.infinity,
          color: Theme.of(context).colorScheme.onSecondary,
          padding: const EdgeInsets.all(10),
          child: Text(
            'What is he cookin\'?',
            style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 26,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor),
          ),
        ),
        navTileBuilder(
            context,
            'Meals',
            Icons.restaurant,
            () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => TabScreen()))),
        navTileBuilder(
            context,
            'Filters',
            Icons.settings,
            () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => FiltersScreen())))
      ]),
    );
  }
}
