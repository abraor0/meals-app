import 'package:flutter/material.dart';

class ICategory {
  final String id;
  final String title;
  final Color color;

  const ICategory(
      {required this.id, required this.title, this.color = Colors.orange});
}
