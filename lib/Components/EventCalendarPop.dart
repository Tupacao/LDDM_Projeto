import 'package:flutter/material.dart';
import 'package:projeto/Components/EventCard.dart';
import 'package:projeto/assets/Colors.dart';

class EventCalendarPop extends StatelessWidget {
  const EventCalendarPop({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const EventCard(),
        Transform.translate(
          offset: const Offset(400, -15),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: secondaryColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: textColor, 
                width: 2, 
              ),
            ),
          ),
        ),
      ],
    );
  }
}
