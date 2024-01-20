import "category.dart";
import "package:intl/intl.dart";
import "package:flutter/material.dart";

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.category,
      required this.date});
  String title;
  double amount;
  Category category;
  DateTime date;

  IconData get getIcon {
    return categoryIcons[category]!;
  }

  String get formattedDate {
    return DateFormat("y/MM/DD").format(date);
  }
}
