import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/Class/Event.dart';
import 'package:projeto/Components/DateTextInputFormatter.dart';
import 'package:projeto/Components/ErrorDialog.dart';
import 'package:projeto/Components/SuccesDialog.dart';
import 'package:projeto/Req/EventReq.dart';
import 'package:projeto/assets/Colors.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Criar novo evento:",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  width: 800,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nome do Evento",
                      style: TextStyle(
                        fontSize: 20,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 800,
                  child: TextField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: secondaryColor,
                    ),
                    style: const TextStyle(
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                const SizedBox(
                  width: 800,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Data",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black, // Ajuste para a cor desejada
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 800,
                  child: TextField(
                    controller: _dataController,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: secondaryColor, // Ajuste para a cor desejada
                    ),
                    style: const TextStyle(
                      color: Colors.black, // Ajuste para a cor desejada
                    ),
                    inputFormatters: [
                      // Formatação personalizada para o campo de data
                      FilteringTextInputFormatter.digitsOnly,
                      DateTextInputFormatter(),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                const SizedBox(
                  width: 800,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Descrição",
                      style: TextStyle(
                        fontSize: 20,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    width: 800,
                    child: TextFormField(
                      controller: _descController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Escreva um pouco sobre o evento...',
                      ),
                      style: const TextStyle(
                        color: primaryColor,
                      ),
                    )),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                  onPressed: () async {
                    Event event = Event(
                        title: _nameController.text,
                        description: _descController.text,
                        date: _dataController.text);
                    if (await insertEvent(event)) {
                      showSuccessDialog(context, "Criado com sucesso",
                          "Seu evento parecerá para as outras pessoas");
                    } else {
                      showErrorDialog(context, "Erro ao criar evento",
                          "Tente novamente mais tarde");
                    }
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: primaryColor,
                    minimumSize: const Size(100, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Criar",
                    style: TextStyle(
                      fontSize: 20,
                      color: secondaryColor,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                FilledButton(
                  onPressed: () async {
                    _nameController.clear();
                    _dataController.clear();
                    _descController.clear();
                  },
                  style: FilledButton.styleFrom(
                      backgroundColor: accentColor,
                      minimumSize: const Size(100, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(
                      fontSize: 20,
                      color: secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
      backgroundColor: secondaryColor,
    );
  }
}