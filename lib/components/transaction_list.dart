import 'package:despesas_pessoais_app/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Nenhuma transação cadastrada',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      "assets/images/waiting.png",
                      fit: BoxFit.cover,
                    ))
              ]);
            },
          )
        : ListView.builder(
            // scorll
            itemCount: transactions.length,
            itemBuilder: (BuildContext context, int index) {
              final tr = transactions[index];
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
                  trailing: MediaQuery.of(context).size.width > 480
                      ? TextButton.icon(
                          icon: Icon(
                            Icons.delete,
                            color: Color.fromARGB(255, 190, 202, 196),
                          ),
                          onPressed: () {
                            onRemove(tr.id);
                          },
                          label: Text(
                            'Excluir',
                            style: TextStyle(
                              color: Color.fromARGB(255, 190, 202,
                                  196), //Theme.of(context).errorColor),
                            ),
                          ),
                        )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => onRemove(tr.id),
                          color: Color.fromARGB(255, 190, 202, 196),
                        ),
                ),
              );
            },
          );
  }
}
