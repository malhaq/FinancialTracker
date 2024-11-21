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

  void _addNewExpense() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: const Text('Expense Deleted'),
        action: SnackBarAction(
            label: 'undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some:)'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Financial Traker"),
        actions: [
          IconButton(
            onPressed: _addNewExpense,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('the chart'),
          Expanded(
            child: mainContent,
          ),
        ],
      ),
    );
  }
}
