import 'package:flutter/material.dart';
import 'package:projeto/Class/Event.dart';
import 'package:projeto/Components/ErrorDialog.dart';
import 'package:projeto/Components/EventCard.dart';
import 'package:projeto/Req/EventReq.dart';
import 'package:projeto/assets/Colors.dart';

class HomeEnterprise extends StatefulWidget {
  const HomeEnterprise({super.key});

  @override
  State<HomeEnterprise> createState() => _HomeEnterpriseState();
}

class _HomeEnterpriseState extends State<HomeEnterprise> {
  List<Event> _events = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    final events = await getUserCreatedEvents();
    if (events != null) {
      setState(() {
        _events = events;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      showErrorDialog(
          context, "Erro ao carregar eventos", "Tente novamente mais tarde.");
    }
  }

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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  // Chama a função _loadEvents para recarregar os eventos
                  setState(() {
                    _isLoading = true; // Inicia o carregamento
                  });
                  _loadEvents();
                },
                child: const Icon(
                  Icons.refresh, // Ícone de reload
                  size: 30,
                  color: Colors.blue, // Cor do ícone, você pode mudar
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (!_isLoading)
            if (_events.length > 0)
              Flexible(
                flex: 1,
                child: Container(
                  constraints: const BoxConstraints(maxHeight: 800),
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemCount: _events.length,
                    itemBuilder: (context, index) {
                      final event = _events[index];
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                        child: EventCard(
                          goTo: '/event_data/:enterprise',
                          title: event.title,
                          date: event.date,
                          id: event.id,
                          past: false,
                        ),
                      );
                    },
                  ),
                ),
              ),
          if (_events.length == 0) Text("Não tem eventos")
        ],
      ),
      backgroundColor: secondaryColor,
    );
  }
}
