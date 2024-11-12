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
              Text(
                "Pessoas inscritas: ($tam)",
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  itemCount: tam,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        "Aluno ${index + 1} - Matrícula $index${index + 1}${index + 2}${index + 3}",
                        textAlign: TextAlign.center,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(width: 60),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FilledButton(
                      onPressed: () {
                        // funcao para editar
                      },
                      style: FilledButton.styleFrom(
                          backgroundColor: primaryColor,
                          minimumSize: const Size(100, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      child: const Text(
                        "Editar",
                        style: TextStyle(
                          fontSize: 20,
                          color: secondaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    FilledButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Deseja mesmo apagar?"),
                            content: Row(
                              children: [
                                FilledButton(
                                  onPressed: () {},
                                  style: FilledButton.styleFrom(
                                      backgroundColor: accentColor,
                                      minimumSize: const Size(150, 60),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      )),
                                  child: const Text(
                                    "Sim",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: secondaryColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                FilledButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: FilledButton.styleFrom(
                                      backgroundColor: accentColor,
                                      minimumSize: const Size(150, 60),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      )),
                                  child: const Text(
                                    "Não",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: secondaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      style: FilledButton.styleFrom(
                          backgroundColor: accentColor,
                          minimumSize: const Size(100, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      child: const Text(
                        "Deletar",
                        style: TextStyle(
                          fontSize: 20,
                          color: secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: secondaryColor,
    );
  }
}
