import 'dart:ffi';

import 'package:flutter/material.dart';

import './main_drawer.dart';

class AppScaffold extends StatelessWidget {
  final Widget child;
  final String title;
  final Widget? bottomNav;
  final bool drawer;

  AppScaffold({
    required this.child,
    required this.title,
    this.bottomNav,
    this.drawer = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      bottomNavigationBar: bottomNav,
      body: child,
      drawer: drawer ? MainDrawer() : null,
    );
  }
}
