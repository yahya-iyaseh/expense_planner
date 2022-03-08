import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransActions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 65.00,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'New Pc',
      amount: 100.00,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txTitle, String txAmount) {
    final newTx = Transaction(
      title: txTitle,
      amount: double.tryParse(txAmount) ?? 0,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    // Future.delayed(Duration.zero, () {
      setState(() {
        _userTransActions.add(newTx);
      });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransActions),
      ],
    );
  }
}
