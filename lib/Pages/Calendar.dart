import 'package:flutter/material.dart';
import 'package:projeto/Class/Event.dart';
import 'package:projeto/Components/ErrorDialog.dart';
import 'package:projeto/Components/EventCard.dart';
import 'package:projeto/Req/EventReq.dart';
import 'package:projeto/assets/Colors.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  bool varOpen = true;

  List<Event> _events = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    final events = await getUserEvents();
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
      backgroundColor: secondaryColor,
      body: Column(
        children: [
          const SizedBox(
            child: Text(
              "Agenda de Eventos",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    varOpen = true;
                  });
                },
                child: const Text("Seus Eventos"),
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
                child: const Text("Eventos Passados"),
              ),
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
          const SizedBox(height: 10),
          if (_isLoading) const Center(child: CircularProgressIndicator()),
          if (!varOpen && !_isLoading && _events.isEmpty)
            const Center(child: Text("Nenhum evento passado encontrado.")),
          if (varOpen && !_isLoading && _events.isNotEmpty)
            Flexible(
              flex: 2,
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
                        goTo: '/event_data/:student',
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
          if (!varOpen && !_isLoading)
            Flexible(
              flex: 1,
              child: Container(
                constraints: const BoxConstraints(maxHeight: 800),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  itemCount: 0,
                  itemBuilder: (context, index) {
                    final event = _events[index];
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      child: EventCard(
                        goTo: '/event_data/:student',
                        title: event.title,
                        date: event.date,
                        id: event.id,
                        past: false,
                      ), // Exibe evento passado
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
