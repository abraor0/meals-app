import 'package:flutter/material.dart';

import './main_drawer.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final Widget? bottomNav;
  final bool drawer;
  final List<Widget>? actions;
  final FloatingActionButton? floatingActionButton;

  const AppScaffold({
    required this.child,
    required this.title,
    this.bottomNav,
    this.drawer = false,
    this.actions,
    this.floatingActionButton,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: actions,
      ),
      bottomNavigationBar: bottomNav,
      body: child,
      drawer: drawer ? const MainDrawer() : null,
      floatingActionButton: floatingActionButton,
    );
  }
}
