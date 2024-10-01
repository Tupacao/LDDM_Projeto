import 'package:flutter/material.dart';
import 'package:projeto/Components/NavBottombar.dart';
import 'package:projeto/Components/UserIcon.dart';
import 'package:projeto/assets/Colors.dart';

class EventData extends StatefulWidget {
  const EventData({super.key});

  @override
  State<EventData> createState() => _EventDataState();
}

class _EventDataState extends State<EventData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UserIcon(showCross: true),
      body: Center(
          child: Column(children: [
        SizedBox(
            width: 800,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: lightBlue,
                ),
                child: Image.asset("lib/assets/images/PucEventos.png"),
              ),
            )),
        const SizedBox(height: 40),
        const SizedBox(
            width: 800,
            child: ListTile(
              title: Text(
                'Nome do Evento',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text('Lorem Impsum is simply'),
            )),
        const SizedBox(
          width: 800,
          child: ListTile(
            title: Text(
              'Data do Evento',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('00/00/0000'),
          ),
        ),
        const SizedBox(
          width: 800,
          child: ListTile(
            title: Text(
              'Descrição',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
                'Lorem Impsum is simply Lorem Impsum is simply  Lorem Impsum is simply v Lorem Impsum is simplyLorem Impsum is simplyLorem Impsum is simplyLorem Impsum is simplyLorem Impsum is simplyLorem Impsum is simply '),
          ),
        ),
        const SizedBox(height: 40),
        SizedBox(
            width: 800,
            child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: FilledButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, "/:user/events_calendar/:data");
                  },
                  style: FilledButton.styleFrom(
                      backgroundColor: accentColor,
                      minimumSize: const Size(100, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: const Text(
                    "Participar",
                    style: TextStyle(
                      fontSize: 20,
                      color: textColor,
                    ),
                  ),
                ),
              )
            ])),
      ])),
      backgroundColor: secondaryColor,
      bottomNavigationBar: const NavBottomBar(),
    );
  }
}
