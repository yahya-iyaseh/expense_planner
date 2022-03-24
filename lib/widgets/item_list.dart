import 'dart:math';

import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemList extends StatefulWidget {
  final Function _deletTrans;
  final List<Transaction> _userTransActions;
  dynamic index;
  ItemList(this._deletTrans, this._userTransActions, index);

  @override
  State<ItemList> createState() => ItemListState();
}

class ItemListState extends State<ItemList> {
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
                "\$${widget._userTransActions[widget.index as int].amount}",
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            padding: EdgeInsets.all(8),
          ),
        ),
        title: Text(
          widget._userTransActions[widget.index].title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMd()
              .add_jm()
              .format(widget._userTransActions[widget.index].date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? FlatButton.icon(
                onPressed: () => widget
                    ._deletTrans(widget._userTransActions[widget.index].id),
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
                    ._deletTrans(widget._userTransActions[widget.index].id),
              ),
      ),
    );
  }
}
