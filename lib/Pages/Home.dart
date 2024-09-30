import 'package:flutter/material.dart';
import 'package:projeto/Components/NavBottombar.dart';
import 'package:projeto/Components/UserIcon.dart';
import 'package:projeto/assets/Colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserIcon(),
      body: Column(
        
      ),
      backgroundColor: secondaryColor,
      bottomNavigationBar: NavBottomBar(),
    );
  }
}
