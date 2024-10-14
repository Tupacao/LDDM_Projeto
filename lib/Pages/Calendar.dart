import 'package:flutter/material.dart';
import 'package:projeto/Components/EventCalendarPop.dart';
import 'package:projeto/assets/Colors.dart';

class EventCalendar extends StatefulWidget {
  const EventCalendar({super.key});

  @override
  State<EventCalendar> createState() => _EventCalendarState();
}

class _EventCalendarState extends State<EventCalendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: Column(
        children: [
          const SizedBox(
            child: Text(
              "Agenda de Eventos",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: FilledButton(
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
                      minimumSize: const Size(150, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: const Text(
                    "Apagar Evento",
                    style: TextStyle(
                      fontSize: 20,
                      color: secondaryColor,
                    ),
                  ),
                ),
              )
            ],
          ),
          // Limitando o tamanho da primeira lista
          Flexible(
            flex: 2, // 2 partes do espaço disponível
            child: Container(
              constraints: const BoxConstraints(maxHeight: 300), // Limita a altura máxima
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: EventCalendarPop(goTo: "/event_data/:data"),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Seus Eventos passados",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          // Limitando o tamanho da segunda lista
          Flexible(
            flex: 1, // 1 parte do espaço disponível
            child: Container(
              constraints: const BoxConstraints(maxHeight: 300), // Limita a altura máxima
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: EventCalendarPop(goTo: "/event_data/:data"),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}