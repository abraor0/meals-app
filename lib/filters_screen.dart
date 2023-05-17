import 'package:flutter/material.dart';

import './widgets/app_scaffold.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Text("hello there"),
      title: 'Filters',
      drawer: true,
    );
  }
}
