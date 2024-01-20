import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_expense_tracker/model/category.dart';

class ExpenseAdder extends StatefulWidget {
  @override
  State<ExpenseAdder> createState() {
    return _ExpenseAdderState();
  }
}

class _ExpenseAdderState extends State<ExpenseAdder> {
  Category _selectedCategory = Category.food;

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _selectedDate;

  void _selectDate() async {
    DateTime now = DateTime.now();
    DateTime firstDate = DateTime(now.year - 1, now.month, now.day);
    DateTime lastDate = now;

    DateTime? dateInput = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: lastDate);

    if (dateInput != null) {
      setState(() {
        _selectedDate = dateInput;
      });
    }
  }

  void _onPressSave() {
    final inputFieldIsValid = _titleController.text.trim() != "" &&
        double.tryParse(_amountController.text)! > 0;
    if (_selectedDate == null && !inputFieldIsValid) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Invaild Input"),
              content: const Text("Check if your inputs are vaild"),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Okay"))
              ],
            );
          });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: "Title"),
            keyboardType: TextInputType.text,
            controller: _titleController,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  child: TextField(
                decoration: const InputDecoration(
                    labelText: "Amount", prefix: Text("\$")),
                keyboardType: TextInputType.number,
                controller: _amountController,
              )),
              const SizedBox(
                width: 70,
              ),
              Row(
                children: [
                  Text(_selectedDate == null
                      ? "No date selected"
                      : DateFormat("yyyy/MM/dd").format(_selectedDate!)),
                  IconButton(
                      onPressed: _selectDate, icon: Icon(Icons.calendar_month))
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: Category.values
                      .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name.toUpperCase()),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value!;
                    });
                  }),
              const Spacer(),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel")),
                  ElevatedButton(
                      onPressed: _onPressSave, child: const Text("Save")),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
