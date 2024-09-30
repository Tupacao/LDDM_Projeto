import 'package:flutter/material.dart';
import 'package:projeto/assets/Colors.dart';

class EventCArd extends StatelessWidget {
  const EventCArd({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Row(
        children: [
          Column(
            children: [
              Text("Nome do Evento"),
              Text("00/00/0000"),
            ],
            
          )
        ],
      ),
    );
  }
}