import 'package:despesas_pessoais_app/models/transaction.dart';
import 'package:flutter/material.dart';

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

  final _transactions = [
    Transaction('t1', 'albumn idle', 230, DateTime.now()),
    Transaction('t1', 'albumn queendom', 200, DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('despesas pessoais'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          Column(
            // passa as trancasoes como lista onde cada elemento da lista
            //retorna alguma coisa (aqui é um card)
            children: _transactions.map((tr) {
              return Card(
                color: Color.fromARGB(255, 219, 60, 247),
                child: Text(tr.title),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
