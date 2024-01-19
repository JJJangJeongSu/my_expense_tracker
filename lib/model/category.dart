import 'package:flutter/material.dart';

enum Category { leisure, work, food, travel }

final Map<Category, IconData> categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.leisure: Icons.sailing_rounded,
  Category.travel: Icons.card_travel,
  Category.work: Icons.work
};
