import 'package:flutter/material.dart';
import 'package:projeto/Components/EventCard.dart';
import 'package:projeto/assets/Colors.dart';

class EventCalendarPop extends StatelessWidget {
  
  final String goTo;
  
  const EventCalendarPop(
    {super.key,
    required this.goTo
    });


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        EventCard(goTo: goTo),
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
