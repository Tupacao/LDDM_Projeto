import 'package:flutter/material.dart';
import 'package:projeto/assets/Colors.dart';

class EventCard extends StatelessWidget {
  final String goTo;

  const EventCard({super.key, required this.goTo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, goTo);
      },
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nome do Evento"),
                Text("00/00/0000"),
              ],
            ),
            Container(
              width: 80,
              height: 80,
              decoration: const BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: Image.asset("lib/assets/images/PucEventos.png"),
            ),
          ],
        ),
      ),
    );
  }
}
