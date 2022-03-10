import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  var total = 0.0;
  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTrnasactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;
      for (var tx in recentTransactions) {
        if (tx.date.day == weekDay.day &&
            tx.date.month == weekDay.month &&
            tx.date.year == weekDay.year) {
          totalSum += tx.amount;
        }
      }
      total += totalSum;
      print(DateFormat.E().format(weekDay));
      print(totalSum);
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTrnasactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...groupedTrnasactionValues.map((e) {
              return ChartBar(
                e['day'] as String,
                e['amount'] as double,
                (e['amount'] as double) / total,
              );
            })
          ],
        ),
      ),
    );
  }
}
