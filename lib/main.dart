import 'package:despesas_pessoais_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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
          Column(
            // passa as trancasoes como lista onde cada elemento da lista
            //retorna alguma coisa (aqui é um card)
            children: _transactions.map((tr) {
              return Card(
                //color: Color.fromARGB(255, 219, 60, 247),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'R\$ ${tr.value.toStringAsFixed(2)}', //fixar o numero de decimais
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tr.title,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          DateFormat('d MMM y') // formatacao de data
                              .format(tr.date),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          Card(
            elevation: 5,
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(labelText: 'Título'),
                  inputFormatters: [LengthLimitingTextInputFormatter(35)],
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Descrição'),
                  inputFormatters: [LengthLimitingTextInputFormatter(70)],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end, // final da linha
                  children: <Widget>[
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Adicionar nova transação',
                        style: TextStyle(color: Colors.purple),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
