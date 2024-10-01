import 'package:flutter/material.dart';
import 'package:projeto/Components/NavBottombarIndice.dart';
import 'package:projeto/Pages/CreateEvent.dart';
import 'package:projeto/Pages/EventCalendar.dart';
import 'package:projeto/Pages/EventData.dart';
import 'package:projeto/Pages/Home.dart';
import 'package:projeto/Pages/YourEvents.dart';
import 'Pages/User.dart';

class Aplication extends StatefulWidget {
  const Aplication({super.key});

  @override
  State<Aplication> createState() => _AplicationState();
}

class _AplicationState extends State<Aplication> {
  int index = 0;

  void _onTabSelected(int selectedIndex) {
    setState(() {
      index = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const UserIcon(showCross: false),
      body: IndexedStack(
        index: index,
        children: const [
          Home(),
          User(),
          EventCalendar(),
          EventData(),
          CreateEvent(),
          YourEvents(),
        ],
      ),
      bottomNavigationBar: NavBottomBarIndice(
        onTabSelected: _onTabSelected, // Passa o callback para o NavBottomBar
      ),
    );
  }
}
