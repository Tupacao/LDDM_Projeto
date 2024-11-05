import 'package:flutter/material.dart';
import 'package:projeto/Components/CalendarPop.dart';
import 'package:projeto/assets/Colors.dart';

class EventEnterprise extends StatefulWidget {
  const EventEnterprise({super.key});

  @override
  State<EventEnterprise> createState() => _EventEnterpriseState();
}

class _EventEnterpriseState extends State<EventEnterprise> {
  bool varOpen = true ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Eventos Criados",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      varOpen = true;
                    });
                  },
                  child: const Text("Aprovados"),
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
                  child: const Text("Em Avaliação"),
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
                          )));
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
          ]),
          if (varOpen)
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: CalendarPop(
                      goTo: '/event_data/:enterprise',
                      past: false,
                    ),
                  );
                },
              ),
            ),
          if (!varOpen)
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: CalendarPop(
                      goTo: '/event_data/:enterprise',
                      past: true,
                    ),
                  );
                },
              ),
            ),
        ],
      ),
      backgroundColor: secondaryColor,
    );
  }
}
