import 'package:flutter/material.dart';

class Item {
  final String id;
  final String title;
  final Color color;
  bool mark;

  Item({
    required this.id,
    required this.title,
    required this.color,
    required this.mark,
  });
}
