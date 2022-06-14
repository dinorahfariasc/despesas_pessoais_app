import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  TransactionForm(this.onSubmit);
  final void Function(String, double, DateTime) onSubmit;

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  // contructor
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  _submitForm() {
    // funcao para submeter o formulario caso os campos estejam ok
    final title = _titleController.text;
    final value = double.tryParse(_valueController.text) ??
        0.0; // se o valor der errado ele usa o 0 como padrao

    if (title.isEmpty || value <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, value,
        _selectedDate); // momento que pega as informacoes do usuario e passa para a funcao
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Título'),
            inputFormatters: [LengthLimitingTextInputFormatter(35)],
          ),
          TextField(
            onSubmitted: (_) {
              // oq fazer quando aperta no botao ok do teclado
              _submitForm();
            },
            controller: _valueController,
            decoration: InputDecoration(labelText: 'Valor (R\$)'),
            keyboardType: TextInputType.numberWithOptions(
                decimal: true), // trocar o teclado para so digitar numeros
            inputFormatters: [
              LengthLimitingTextInputFormatter(7),
            ],
          ),
          Container(
            height: 70,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'Nenhuma data selecionada!'
                        : 'Data Selecionada: ${DateFormat('dd/MM/y').format(_selectedDate!)}',
                  ),
                ),
                TextButton(
                  child: Text(
                    'Selecionar data',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: _showDatePicker,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end, // final da linha
            children: <Widget>[
              ElevatedButton(
                onPressed: _submitForm,
                child: Text(
                  'Adicionar nova transação',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.button?.color,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
