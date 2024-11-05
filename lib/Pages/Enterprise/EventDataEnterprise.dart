import 'package:flutter/material.dart';
import 'package:projeto/assets/Colors.dart';

class EventDataEnterprise extends StatefulWidget {
  const EventDataEnterprise({super.key});

  @override
  State<EventDataEnterprise> createState() => _EventDataEnterpriseState();
}

class _EventDataEnterpriseState extends State<EventDataEnterprise> {
  int tam = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
      ),
      body: Center(
        child: SizedBox(
          width: 800,
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: lightBlue,
                  ),
                  child: Image.asset("lib/assets/images/PucEventos.png"),
                ),
              ),
              const SizedBox(height: 40),
              const ListTile(
                title: Text(
                  'Nome do Evento',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('Lorem Impsum is simply'),
              ),
              const ListTile(
                title: Text(
                  'Data do Evento',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text('00/00/0000'),
              ),
              const ListTile(
                title: Text(
                  'Descrição',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                    'Lorem Impsum is simply Lorem Impsum is simply Lorem Impsum is simply Lorem Impsum is simply'),
              ),
              const SizedBox(height: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Pessoas inscritas: ($tam)",
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              // Centraliza o ListView
              Expanded(
                child: Center(
                  child: SizedBox(
                    width: 300, // Define a largura para o ListView
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemCount: tam,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Text(
                              "Aluno ${index + 1} - Matrícula $index${index + 1}${index + 2}${index + 3}"),
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: secondaryColor,
    );
  }
}
