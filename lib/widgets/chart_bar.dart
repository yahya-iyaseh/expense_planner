import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double totalSpendAmount;
  final double totalPercentage;
  ChartBar(this.label, this.totalSpendAmount, this.totalPercentage);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraint) {
      return Column(
        children: [
          Container(
            height: constraint.maxHeight * .15,
            child: FittedBox(
              child: Text(
                ' \$' + (totalSpendAmount as double).toStringAsFixed(1),
              ),
            ),
          ),
          SizedBox(
            height: constraint.maxHeight * .05,
          ),
          Container(
            height: constraint.maxHeight * .6,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    border: Border.all(
                      color: Theme.of(context).accentColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: 1 - totalPercentage,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 1,
                        color: Theme.of(context).accentColor,
                      ),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: constraint.maxHeight * .05,
          ),
          Container(
            height: constraint.maxHeight * .1,
            child: Text(
              label as String,
            ),
          ),
        ],
      );
    });
  }
}
