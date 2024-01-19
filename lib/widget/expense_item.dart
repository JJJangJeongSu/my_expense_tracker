import 'package:flutter/material.dart';
import 'package:my_expense_tracker/model/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(children: [
          Icon(
            expense.getIcon,
            size: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                expense.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(expense.formattedDate),
            ]),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Text(
              "\$${expense.amount.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ]),
      ),
    );
  }
}
