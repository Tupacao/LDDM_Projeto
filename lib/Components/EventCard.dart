import 'package:flutter/material.dart';
import 'package:projeto/assets/Colors.dart';

class EventCard extends StatelessWidget {
  final String goTo;
  final bool past;

  const EventCard({super.key, required this.goTo, required this.past});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, goTo);
        },
        child: Center(
          child: Container(
            height: 100,
            width: 800,
            decoration: BoxDecoration(
              color: lightBlue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nome do Evento",
                      style: TextStyle(
                        fontSize: 30,
                        color: past ? Colors.red : Colors.black,
                      ),
                    ),
                    Text(
                      "00/00/0000",
                      style: TextStyle(
                        fontSize: 17,
                        color: past ? Colors.red : Colors.black,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 90,
                  height: 90,
                  child: Image.asset("lib/assets/images/PucEventos.png"),
                ),
              ],
            ),
          ),
        ));
  }
}