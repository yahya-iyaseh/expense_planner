import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double totalSpendAmount;
  final double totalPercentage;
  ChartBar(this.label, this.totalSpendAmount, this.totalPercentage);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          (totalSpendAmount as double).toStringAsFixed(2),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(220, 243, 243, 150),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          label as String,
        ),
      ],
    );
  }
}
