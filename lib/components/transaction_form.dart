import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionForm extends StatelessWidget {
  TransactionForm({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Título'),
            inputFormatters: [LengthLimitingTextInputFormatter(35)],
          ),
          TextField(
            controller: valueController,
            decoration: InputDecoration(labelText: 'Valor (R\$)'),
            keyboardType: TextInputType
                .number, // trocar o teclado para so digitar numeros
            inputFormatters: [
              LengthLimitingTextInputFormatter(7),
              FilteringTextInputFormatter
                  .digitsOnly, // so aceita numeros nesse input
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end, // final da linha
            children: <Widget>[
              TextButton(
                onPressed: () {
                  print(titleController.text);
                  print(valueController.text);
                },
                child: Text(
                  'Adicionar nova transação',
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
