import 'package:flutter/material.dart';
import 'package:projeto/Pages/CreateEvent.dart';
import 'package:projeto/Pages/EventCalendar.dart';
import 'package:projeto/Pages/EventData.dart';
import 'package:projeto/Pages/Home.dart';
import 'package:projeto/Pages/Login.dart';
import 'package:projeto/Pages/Register.dart';
import 'package:projeto/Pages/User.dart';
import 'package:projeto/Pages/YourEvents.dart';

void main (){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Projeto LDDM",
    initialRoute: "/",
    routes: {
      '/': (context) => const Login(),
      '/register': (context) => const Register(),
      '/home': (context) => const Home(),
      '/user/:data': (context) => const User(),
      '/:user/events_calendar/:data': (context) => const EventCalendar(),
      '/event_data/:data': (context) => const EventData(),
      '/:user/create_event': (context) => const CreateEvent(),
      '/:user/events_user': (context) => const YourEvents(),
    },
  ));
}