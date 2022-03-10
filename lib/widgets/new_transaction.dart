import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function _addNewTransaction;
  NewTransaction(this._addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _addText() {
    final _title = titleController.text;
    final _amount = double.parse(amountController.text);
    if (_title.isEmpty || _amount <= 0) {
      return;
    }
    widget._addNewTransaction(
        titleController.text, double.parse(amountController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // onChanged: (val) => titleInput = val,
              controller: titleController,
              onSubmitted: (_) => _addText(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val) => amountInput = val,
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _addText(),
            ),
            FlatButton(
              child: const Text(
                'Add Transaction',
                style: TextStyle(color: Colors.purple),
              ),
              onPressed: _addText,
            ),
          ],
        ),
      ),
    );
  }
}
