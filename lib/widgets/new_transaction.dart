import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _addNewTransaction;
  NewTransaction(this._addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _addText() {
    final _title = _titleController.text;
    final _amount = _amountController.text;
    if (_title.isEmpty || _amount.isEmpty || _selectedDate == null) {
      return;
    }
    widget._addNewTransaction(
      _titleController.text,
      double.parse(_amountController.text),
      _selectedDate,
    );
  }

  void _showDatePacker() {
    showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(
        Duration(days: 365),
      ),
      lastDate: DateTime.now(),
    ).then((selectD) {
      if (selectD == null) {
        return;
      }
      setState(() {
        _selectedDate = selectD;
      });
    });
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
              controller: _titleController,
              onSubmitted: (_) => _addText(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (val) => amountInput = val,
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _addText(),
            ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _selectedDate == null
                        ? "No Date Chosen!"
                        : 'Picked Time: ${DateFormat.yMEd().add_jm().format(_selectedDate!)}',
                  ),
                  FlatButton(
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _showDatePacker,
                    textColor: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            FlatButton(
              child: const Text(
                'Add Transaction',
              ),
              onPressed: _addText,
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).buttonColor,
            ),
          ],
        ),
      ),
    );
  }
}
