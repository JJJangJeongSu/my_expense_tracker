import 'package:flutter/material.dart';
import 'package:my_expense_tracker/model/category.dart';
import 'package:my_expense_tracker/widget/expense_list.dart';
import 'package:my_expense_tracker/model/expense.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
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
    return MaterialApp(
      theme: ThemeData(
          cardTheme: CardTheme().copyWith(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10)),
          textTheme: TextTheme().copyWith(
              titleLarge: TextStyle(fontSize: 24),
              titleMedium: TextStyle(fontSize: 20),
              titleSmall: TextStyle(fontSize: 16))),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Expense Tracker"),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
        ),
        body: Column(children: [ExpenseList(expenseList: _registeredExpenses)]),
      ),
    );
  }
}
