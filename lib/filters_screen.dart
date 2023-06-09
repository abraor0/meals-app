import 'package:flutter/material.dart';

import './widgets/app_scaffold.dart';

class FiltersScreen extends StatefulWidget {
  final Function setFilters;
  final Map<String, bool> currentFilters;

  const FiltersScreen(this.currentFilters, this.setFilters, {super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegetarian = false;
  var _isVegan = false;

  @override
  void initState() {
    // TODO: implement initState

    _isGlutenFree = widget.currentFilters['gluten']!;
    _isLactoseFree = widget.currentFilters['lactose']!;
    _isVegan = widget.currentFilters['vegan']!;
    _isVegetarian = widget.currentFilters['vegetarian']!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Filters',
      drawer: true,
      actions: [
        IconButton(
          onPressed: () {
            final currentFilters = {
              'gluten': _isGlutenFree,
              'lactose': _isLactoseFree,
              'vegetarian': _isVegetarian,
              'vegan': _isVegan,
            };

            widget.setFilters(currentFilters);
          },
          icon: const Icon(Icons.save_alt),
        ),
      ],
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(26),
            width: double.infinity,
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ),
          SwitchListTile(
              title: const Text('Gluten-free'),
              subtitle: const Text('Only include gluten-free meals'),
              value: _isGlutenFree,
              onChanged: (value) {
                setState(() {
                  _isGlutenFree = value;
                });
              }),
          SwitchListTile(
              title: const Text('Lactose-free'),
              subtitle: const Text('Only include lactose-free meals'),
              value: _isLactoseFree,
              onChanged: (value) {
                setState(() {
                  _isLactoseFree = value;
                });
              }),
          SwitchListTile(
              title: const Text('Vegetarian'),
              subtitle: const Text('Only include vegetarian meals'),
              value: _isVegetarian,
              onChanged: (value) {
                setState(() {
                  _isVegetarian = value;
                });
              }),
          SwitchListTile(
              title: const Text('Vegan'),
              subtitle: const Text('Only include vegan meals'),
              value: _isVegan,
              onChanged: (value) {
                setState(() {
                  _isVegan = value;
                });
              })
        ],
      ),
    );
  }
}
