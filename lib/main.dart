import 'package:flutter/material.dart';
import 'package:projeto/Aplication.dart';
import 'package:projeto/Pages/CreateEvent.dart';
import 'package:projeto/Pages/EventData.dart';
import 'package:projeto/Pages/Login.dart';
import 'package:projeto/Pages/Register.dart';

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
      // '/:user/create_event': (context) => const CreateEvent(),
      // '/user/:data': (context) => const User(),
      // '/:user/events_calendar/:data': (context) => const EventCalendar(),
      // '/:user/events_user': (context) => const YourEvents(),

      // Fazer a parada do editar evento criado
    },
  ));
}