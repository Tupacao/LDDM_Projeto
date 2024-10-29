import 'package:flutter/material.dart';
import 'package:projeto/Components/CalendarPop.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                      child: CalendarPop(goTo: "/event_data/:data"),
                    );
                  },
                ),
              ),
            ),
          // const Text(
          //   "Seus Eventos passados",
          //   style: TextStyle(
          //     fontSize: 30,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          // Limitando o tamanho da segunda lista
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
                      child: CalendarPop(goTo: "/event_data/:data"),
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
