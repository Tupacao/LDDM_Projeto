import 'package:flutter/material.dart';
import 'package:projeto/Components/CalendarPop.dart';
import 'package:projeto/Components/EventCard.dart';
import 'package:projeto/assets/Colors.dart';

class HomeEnterprise extends StatefulWidget {
  const HomeEnterprise({super.key});

  @override
  State<HomeEnterprise> createState() => _HomeEnterpriseState();
}

class _HomeEnterpriseState extends State<HomeEnterprise> {
  bool varOpen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Seus Eventos",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
              onPressed: () {
                setState(() {
                  varOpen = true;
                });
              },
              child: const Text("Aprovados"),
            ),
            const SizedBox(
              width: 20,
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  varOpen = false;
                });
              },
              child: const Text("Em Avaliação"),
            ),
          ]),
          const SizedBox(height: 10),
          if (varOpen)
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: EventCard(
                        goTo: "/event_data/:enterprise",
                        past: false,
                      ));
                },
              ),
            ),
          if (!varOpen)
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: EventCard(
                      goTo: '/event_data/:data',
                      past: true,
                    ),
                  );
                },
              ),
            ),
        ],
      ),
      backgroundColor: secondaryColor,
    );
  }
}
