import 'package:despesas_pessoais_app/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class Transactionlist extends StatelessWidget {
  const Transactionlist({
    Key? key,
    required this.transaction,
  }) : super(key: key);

  final List<Transaction> transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transaction.isEmpty
          ? Column(children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                'nenhuma transacao cadastrada',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 200,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ))
            ])
          : ListView.builder(
              // scorll
              itemCount: transaction.length,
              itemBuilder: (BuildContext context, int index) {
                final tr = transaction[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.purple,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text(
                            'R\$${tr.value}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(tr.title,
                        style: Theme.of(context).textTheme.headline6),
                    subtitle: Text(
                      DateFormat('d MMM y').format(tr.date),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
