import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleHandller = TextEditingController();
  final _amountHandller = TextEditingController();

  @override
  void dispose() {
    _amountHandller.dispose();
    _titleHandller.dispose();
    super.dispose();
  }

  // String _enteredTitle = '';

  // void _saveTitle(String title) {
  //   _enteredTitle = title;
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleHandller,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          const SizedBox(height: 4),
          TextField(
            controller: _amountHandller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixText: '\$ ',
              label: Text('Amount'),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print('${_titleHandller.text}  ${_amountHandller.text}');
                },
                child: const Text('Save Expense'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
