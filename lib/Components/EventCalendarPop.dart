import 'package:flutter/material.dart';
import 'package:projeto/Components/EventCard.dart';
import 'package:projeto/assets/Colors.dart';

class EventCalendarPop extends StatefulWidget {
  final String goTo;

  const EventCalendarPop({super.key, required this.goTo});

  @override
  State<EventCalendarPop> createState() => _EventCalendarPopState();
}

class _EventCalendarPopState extends State<EventCalendarPop> {
  bool isChecked = false; // Variável para armazenar o estado do checkbox

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        EventCard(goTo: widget.goTo),
        Transform.translate(
          offset: const Offset(400, -15),
          child: GestureDetector(
            onTap: () {
              setState(() {
                isChecked = !isChecked; // Alterna o estado do checkbox
              });
            },
            child: Transform.scale(
              scale: 1.6, // Aumenta o tamanho do checkbox
              child: Theme(
                data: Theme.of(context).copyWith(
                  checkboxTheme: CheckboxThemeData(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Deixa o checkbox redondo
                    ),
                    fillColor: WidgetStateProperty.resolveWith<Color>(
                        (Set<WidgetState> states) {
                      if (states.contains(WidgetState.selected)) {
                        return primaryColor; // Cor quando marcado
                      }
                      return Colors.white; // Fundo branco quando desmarcado
                    }),
                  ),
                ),
                child: Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!; // Atualiza o valor do checkbox
                    });
                  },
                  checkColor: secondaryColor, // Cor do ícone de check
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
