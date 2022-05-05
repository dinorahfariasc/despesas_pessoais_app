import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionForm extends StatefulWidget {
  TransactionForm(this.onSubmit);
  final void Function(String, double) onSubmit;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  // contructor
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    // funcao para submeter o formulario caso os campos estejam ok
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ??
        0.0; // se o valor der errado ele usa o 0 como padrao

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title,
        value); // momento que pega as informacoes do usuario e passa para a funcao
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        children: <Widget>[
          TextField(
            onSubmitted: (_) {
              _submitForm();
            },
            controller: titleController,
            decoration: InputDecoration(labelText: 'Título'),
            inputFormatters: [LengthLimitingTextInputFormatter(35)],
          ),
          TextField(
            onSubmitted: (_) {
              // oq fazer quando aperta no botao ok do teclado
              _submitForm();
            },
            controller: valueController,
            decoration: InputDecoration(labelText: 'Valor (R\$)'),
            keyboardType: TextInputType.numberWithOptions(
                decimal: true), // trocar o teclado para so digitar numeros
            inputFormatters: [
              LengthLimitingTextInputFormatter(7),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end, // final da linha
            children: <Widget>[
              TextButton(
                onPressed: _submitForm,
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
