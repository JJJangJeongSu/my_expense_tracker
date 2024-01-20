import 'package:flutter/material.dart';
import 'package:my_expense_tracker/model/category.dart';
import 'package:my_expense_tracker/widget/expense_adder.dart';
import 'package:my_expense_tracker/widget/expense_list.dart';
import 'package:my_expense_tracker/model/expense.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  void _showExpenseAdder() {
    showModalBottomSheet(
        context: context,
        builder: (context) => ExpenseAdder(),
        isScrollControlled: true);
  }

  void _addExpense(Expense newExpense) {
    setState(() {
      _registeredExpenses.add(newExpense);
    });
  }

  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Sample",
        amount: 19.99,
        category: Category.food,
        date: DateTime.now()),
    Expense(
        title: "Sample",
        amount: 19.99,
        category: Category.food,
        date: DateTime.now())
  ];

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: _showExpenseAdder,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(children: [ExpenseList(expenseList: _registeredExpenses)]),
    );
  }
}
