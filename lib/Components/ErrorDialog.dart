import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String erro;
  final String desc;

  // Construtor
  ErrorDialog({super.key, required this.erro, required this.desc});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(erro), // Usando o título dinamicamente
      content: Text(desc), // Usando a descrição dinamicamente
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Fecha o diálogo
          },
          child: const Text("Fechar"),
        ),
      ],
    );
  }
}

// Função para exibir o diálogo de erro
void showErrorDialog(BuildContext context, String erro, String desc) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ErrorDialog(erro: erro, desc: desc); // Passa os valores do erro e descrição
    },
  );
}