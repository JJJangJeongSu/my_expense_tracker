import 'package:flutter/material.dart';
import 'package:my_expense_tracker/model/expense.dart';
import 'expense_item.dart';

class ExpenseList extends StatefulWidget {
  ExpenseList({super.key, required this.expenseList});
  List<Expense> expenseList;

  @override
  State<ExpenseList> createState() {
    return _ExpenseListState();
  }
}

class _ExpenseListState extends State<ExpenseList> {
  @override
  Widget build(context) {
    return Column(children: [
      ...widget.expenseList.map((exp) => ExpenseItem(expense: exp))
    ]);
  }
}
