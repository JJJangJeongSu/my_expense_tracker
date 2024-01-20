import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:my_expense_tracker/model/expense.dart';
import 'package:my_expense_tracker/model/category.dart';

class PieChartViewer extends StatelessWidget {
  PieChartViewer({super.key, required this.curExpenseList});

  List<Expense> curExpenseList;

  Map<Category, double> calculateSum() {
    Map<Category, double> categorySum = {};
    for (var expense in curExpenseList) {
      if (categorySum.containsKey(expense.category)) {
        categorySum[expense.category] =
            categorySum[expense.category]! + expense.amount;
      } else {
        categorySum[expense.category] = expense.amount;
      }
    }

    return categorySum;
  }

  @override
  Widget build(context) {
    Map<Category, double> categorySum = calculateSum();
    List<PieChartSectionData> sections = [];

    categorySum.forEach((key, value) {
      sections.add(
          PieChartSectionData(value: value, title: key.name.toUpperCase()));
    });

    return SizedBox(
        height: 200, child: PieChart(PieChartData(sections: sections)));
  }
}
