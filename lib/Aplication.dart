import 'package:flutter/material.dart';
import 'package:projeto/Components/NavBottombarIndice.dart';
import 'package:projeto/Pages/CreateEvent.dart';
import 'package:projeto/Pages/Calendar.dart';
import 'package:projeto/Pages/Enterprise/HomeEnterprise.dart';
import 'package:projeto/Pages/Home.dart';
import 'package:projeto/Pages/YourEvents.dart';
import 'package:projeto/assets/Colors.dart';
import 'Pages/User.dart';

class Aplication extends StatefulWidget {
  const Aplication({super.key});

  @override
  State<Aplication> createState() => _AplicationState();
}

class _AplicationState extends State<Aplication> {
  int value = 0; // Inicializa sem valor até obter o argumento
  int index = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Recupera o valor passado pela rota e armazena
    value = (ModalRoute.of(context)?.settings.arguments as int?)!;
  }

  void _onTabSelected(int selectedIndex) {
    setState(() {
      index = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: IndexedStack(
        index: index,
        children: [
          if (value == 3) const HomeEnterprise() else const Home(),
          const User(),
          if (value == 2 || value == 1) const Calendar() else const SizedBox.shrink(),
          if (value == 2 || value == 3) const CreateEvent() else const SizedBox.shrink(),
          if (value == 2) const YourEvents() else const SizedBox.shrink(),
        ],
      ),
      bottomNavigationBar: NavBottomBarIndice(
        onTabSelected: _onTabSelected,
        value: value,
      ),
    );
  }
}
