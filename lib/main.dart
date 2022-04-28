import 'package:despesas_pessoais_app/components/transaction_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:math';
import '../models/transaction.dart';
import './components/transaction_form.dart';
import './components/transaction_list.dart';

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _transactions = [
    Transaction(
      id: 't1',
      title: 'albumn idle',
      value: 230,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't1',
      title: 'albumn queendom',
      value: 200,
      date: DateTime.now(),
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  _opentransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return TransactionForm(_addTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('despesas pessoais'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle_rounded),
            onPressed: () {
              _opentransactionFormModal(context);
            },
          ),
        ],
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
            Transactionlist(transaction: _transactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _opentransactionFormModal(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
