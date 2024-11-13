import 'package:flutter/material.dart';
import 'package:projeto/Aplication.dart';
import 'package:projeto/Pages/Enterprise/EventDataEnterprise.dart';
import 'package:projeto/Pages/EventData.dart';
import 'package:projeto/Pages/Login.dart';
import 'package:projeto/Pages/Register.dart';
import 'package:projeto/Pages/Student/EventDataStudent.dart';
import 'package:projeto/Pages/Teacher/EventDataTeacher.dart';

void main (){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "PUC Minas Eventos",
    initialRoute: "/",
    routes: {
      '/': (context) => const Login(),
      '/register': (context) => const Register(),
      '/home': (context) => const Aplication(),
      '/event_data/:data': (context) => const EventData(),
      '/event_data/:student': (context) => const EventDataStudent(),
      '/event_data/:enterprise': (context) => const EventDataEnterprise(),
      '/event_data/:teacher': (context) => const EventDataTeacher(),
    },
  ));
}