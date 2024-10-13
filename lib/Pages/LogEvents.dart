
import 'package:flutter/material.dart';
import 'package:projeto/Components/EventCard.dart';

class LogEvents extends StatefulWidget {
  const LogEvents({super.key});

  @override
  State<LogEvents> createState() => _LogEventsState();
}

class _LogEventsState extends State<LogEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          const Text(
            "Seus Eventos passados",
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  child: EventCard(goTo: '/event_data/:data'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}