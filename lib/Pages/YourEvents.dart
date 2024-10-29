import 'package:flutter/material.dart';
import 'package:projeto/assets/Colors.dart';

import '../Components/CalendarPop.dart';

class YourEvents extends StatefulWidget {
  const YourEvents({super.key});

  @override
  State<YourEvents> createState() => _YourEventsState();
}

class _YourEventsState extends State<YourEvents> {
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
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: CalendarPop(goTo: '/:user/create_event'),
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
