import 'package:flutter/material.dart';
import './widgets/user_transactions.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // String titleInput = "";
  // String amountInput = "";
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter app'),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(10),
              child: Card(
                elevation: 5,
                color: Color.fromARGB(255, 148, 207, 255),
                child: Container(
                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Text('Chart!'),
                ),
              ),
            ),
          UserTransactions(),
          ],
        ),
      ),
    );
  }
}
