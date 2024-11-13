import 'package:flutter/material.dart';
import 'package:projeto/Components/EventCard.dart';
import 'package:projeto/assets/Colors.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  bool varOpen = true;

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    varOpen = true;
                  });
                },
                child: const Text("Seus Eventos"),
              ),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    varOpen = false;
                  });
                },
                child: const Text("Eventos Passados"),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (varOpen)
            Flexible(
              flex: 2, // 2 partes do espaço disponível
              child: Container(
                constraints: const BoxConstraints(
                    maxHeight: 800), // Limita a altura máxima
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: EventCard(
                          goTo: "/event_data/:student", past: false),
                    );
                  },
                ),
              ),
            ),
          if (!varOpen)
            Flexible(
              flex: 1, // 1 parte do espaço disponível
              child: Container(
                constraints: const BoxConstraints(
                    maxHeight: 800), // Limita a altura máxima
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: EventCard(
                        goTo: "/event_data/:student",
                        past: true,
                      ),
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
