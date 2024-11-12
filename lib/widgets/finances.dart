import 'package:finance_manager/widgets/expenses_list/expenses_list.dart';
import 'package:finance_manager/models/expense.dart';
import 'package:finance_manager/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Finances extends StatefulWidget {
  const Finances({super.key});

  @override
  State<Finances> createState() {
    return _FinancesState();
  }
}

class _FinancesState extends State<Finances> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Nodejs Course",
      amount: 30.50,
      date: DateTime.now(),
      category: Category.school,
    ),
    Expense(
      title: "DR.HOTDOG",
      amount: 15,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  void _addNewExpense () {
    showModalBottomSheet(context: context, builder: (ctx)=>  const NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Financial Traker"),
        actions: [
          IconButton(
            onPressed: _addNewExpense,
            icon:const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('the chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          ),
        ],
      ),
    );
  }
}
