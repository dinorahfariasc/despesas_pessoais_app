import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/transaction_user.dart';

main() {
  runApp(ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('despesas pessoais'),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              //width: double.infinity,
              child: Card(
                color: Color.fromARGB(255, 78, 228, 85),
                child: Text('grafico'),
                elevation: 5, // sombreamento
              ),
            ),
            TransactionUser(),
          ],
        ),
      ),
    );
  }
}
