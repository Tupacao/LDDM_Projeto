import 'package:flutter/material.dart';
import 'package:projeto/Components/NavBottombarIndice.dart';
import 'package:projeto/Pages/CreateEvent.dart';
import 'package:projeto/Pages/Calendar.dart';
import 'package:projeto/Pages/Enterprise/HomeEnterprise.dart';
import 'package:projeto/Pages/Student/Home.dart';
import 'package:projeto/Pages/Teacher/HomeTeacher.dart';
import 'package:projeto/Pages/YourEvents.dart';
import 'package:projeto/assets/Colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/User.dart';

class Aplication extends StatefulWidget {
  const Aplication({super.key});

  @override
  State<Aplication> createState() => _AplicationState();
}

class _AplicationState extends State<Aplication> {
  String type = 'P'; // Inicializa sem valor até obter o argumento
  int index = 0;

  @override
  void initState() {
    super.initState();
    _getUserType();
  }

  // Função para buscar o tipo de usuário no SharedPreferences
  Future<void> _getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedType = prefs.getString('type');
    
    if (storedType != null) {
      setState(() {
        type = storedType; // Atualiza o estado com o tipo de usuário
      });
    }
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
          if (type == 'E') const HomeEnterprise()
          else if (type == 'A') const Home()
          else if (type == 'P') const HomeTeacher() // Verifique se o tipo é 'T' para Teacher
          else const SizedBox.shrink(), // Caso nenhum tipo seja encontrado, não exibe nada
          const UserProfile(),
          if (type == 'P' || type == 'A') const Calendar() else const SizedBox.shrink(),
          if (type == 'P' || type == 'E') const CreateEvent() else const SizedBox.shrink(),
          if (type == 'P' || type == 'E') const YourEvents() else const SizedBox.shrink(),
        ],
      ),
      bottomNavigationBar: NavBottomBarIndice(
        onTabSelected: _onTabSelected,
        value: type,
      ),
    );
  }
}
