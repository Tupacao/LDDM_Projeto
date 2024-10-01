import 'package:flutter/material.dart';
import 'package:projeto/Components/EventCalendarPop.dart';
import 'package:projeto/Components/NavBottombar.dart';
import 'package:projeto/Components/UserIcon.dart';
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
      appBar: const UserIcon(showCross: false),
      body: Column(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Agenda de Eventos",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
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
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: FilledButton(
                onPressed: () {
                  // funcao para deletar
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
          ])
        ],
      ),
      bottomNavigationBar: const NavBottomBar(),
    );
  }
}
