import 'package:flutter/material.dart';
import 'package:projeto/assets/Colors.dart';

class NavBottomBarIndice extends StatefulWidget {
  final Function(int) onTabSelected; // Adiciona o callback para mudar o índice
  final String value;
  const NavBottomBarIndice(
      {required this.onTabSelected, required this.value, super.key});

  @override
  State<NavBottomBarIndice> createState() => _NavBottomBarIndiceState();
}

class _NavBottomBarIndiceState extends State<NavBottomBarIndice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              if (widget.value == 'P' || widget.value == 'A')
                GestureDetector(
                  onTap: () {
                    widget.onTabSelected(
                        2); // Atualiza o índice para "EventCalendar"
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.layers,
                      color: textColor,
                      size: 40,
                    ),
                  ),
                ),
              if (widget.value == "P" || widget.value == 'E')
                GestureDetector(
                  onTap: () {
                    widget.onTabSelected(
                        3); // Atualiza o índice para "CreateEvent"
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.add,
                      color: textColor,
                      size: 40,
                    ),
                  ),
                ),
              if (widget.value == "P")
                GestureDetector(
                  onTap: () {
                    widget.onTabSelected(
                        4); // Atualiza o índice para "YourEvents"
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: secondaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.edit,
                      color: textColor,
                      size: 40,
                    ),
                  ),
                ),
              GestureDetector(
                onTap: () {
                  widget.onTabSelected(1); // Atualiza o índice para "User"
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    color: secondaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.account_circle,
                    color: textColor,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
          Transform.translate(
            offset: const Offset(0, -50),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    color: secondaryColor,
                    shape: BoxShape.circle,
                  ),
                ),
                GestureDetector(
                  onTap: () async{
                    widget.onTabSelected(0);
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.home,
                      color: secondaryColor,
                      size: 40,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
