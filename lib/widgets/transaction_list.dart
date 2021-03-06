import 'dart:math';

import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> _userTransActions;
  final Function _deletTrans;
  TransactionList(this._userTransActions, this._deletTrans);

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  late Color _backColor;
  @override
  void initState() {
    final List<dynamic> _avilableColors = [
      Colors.blue,
      Colors.black,
      Colors.purple,
      Colors.red,
    ];
    _backColor = _avilableColors[Random().nextInt(4)];
    print(_backColor);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: ListView.builder(
        itemBuilder: (xtc, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 4,
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: _backColor,
                radius: 30,
                child: Container(
                  child: FittedBox(
                    child: Text(
                      "\$${widget._userTransActions[index].amount}",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  padding: EdgeInsets.all(8),
                ),
              ),
              title: Text(
                widget._userTransActions[index].title,
                style: Theme.of(context).textTheme.headline6,
              ),
              subtitle: Text(
                DateFormat.yMd()
                    .add_jm()
                    .format(widget._userTransActions[index].date),
              ),
              trailing: MediaQuery.of(context).size.width > 460
                  ? FlatButton.icon(
                      onPressed: () => widget
                          ._deletTrans(widget._userTransActions[index].id),
                      label: Text('Delete'),
                      icon: Icon(Icons.delete),
                      textColor: Theme.of(context).errorColor,
                    )
                  : IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).errorColor,
                      ),
                      onPressed: () => widget
                          ._deletTrans(widget._userTransActions[index].id),
                    ),
            ),
          );
          // Card(
          //   child: Row(
          //     children: [
          //       Container(
          //         margin: const EdgeInsets.symmetric(
          //           vertical: 15,
          //           horizontal: 10,
          //         ),
          //         padding: EdgeInsets.all(5),
          //         decoration: BoxDecoration(
          //           border: Border.all(
          //             color: Theme.of(context).primaryColor,
          //             width: 2,
          //           ),
          //         ),
          //         child: Text(
          //           '\$${_userTransActions[index].amount.toStringAsFixed(2)}',
          //           style: TextStyle(
          //             fontWeight: FontWeight.bold,
          //             fontSize: 20,
          //             color: Theme.of(context).primaryColor,
          //           ),
          //         ),
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Text(
          //             _userTransActions[index].title,
          //             style: Theme.of(context).textTheme.headline6,
          //           ),
          //           Text(
          //             DateFormat.yMd()
          //                 .add_jm()
          //                 .format(_userTransActions[index].date),
          //             style: TextStyle(
          //               fontWeight: FontWeight.w300,
          //               fontSize: 15,
          //               color: Colors.grey,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // );
        },
        itemCount: widget._userTransActions.length,
      ),
    );
  }
}
