import 'package:flutter/material.dart';
import 'package:projeto/assets/Colors.dart';

class EventDataTeacher extends StatefulWidget {
  const EventDataTeacher({super.key});

  @override
  State<EventDataTeacher> createState() => _EventDataTeacherState();
}

class _EventDataTeacherState extends State<EventDataTeacher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  width: 800,
                  child: Align(
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
                  )),
              const SizedBox(height: 40),
              const SizedBox(
                width: 800,
                child: ListTile(
                  title: Text(
                    'Nome do Evento',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('Lorem Impsum is simply'),
                ),
              ),
              const SizedBox(
                width: 800,
                child: ListTile(
                  title: Text(
                    'Data do Evento',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('00/00/0000'),
                ),
              ),
              const SizedBox(
                width: 800,
                child: ListTile(
                  title: Text(
                    'Descrição',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                      'Lorem Impsum is simply Lorem Impsum is simply  Lorem Impsum is simply v Lorem Impsum is simplyLorem Impsum is simplyLorem Impsum is simplyLorem Impsum is simplyLorem Impsum is simplyLorem Impsum is simply '),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FilledButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Deseja mesmo recusar?"),
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
                        "Recusar",
                        style: TextStyle(
                          fontSize: 20,
                          color: textColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    FilledButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("Deseja mesmo aceitar?"),
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
                        backgroundColor: primaryColor,
                        minimumSize: const Size(100, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        "Aceitar",
                        style: TextStyle(
                          fontSize: 20,
                          color: textColor,
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
