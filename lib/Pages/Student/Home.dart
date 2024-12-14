import 'package:flutter/material.dart';
import 'package:projeto/Class/Event.dart';
import 'package:projeto/Components/ErrorDialog.dart';
import 'package:projeto/Components/EventCard.dart';
import 'package:projeto/Req/EventReq.dart';
import 'package:projeto/assets/Colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();

  List<Event> _events = [];
  List<Event> _filteredEvents = []; // Lista filtrada
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadEvents();

    // Ouvir mudanças no campo de pesquisa
    _searchController.addListener(() {
      _filterEvents();
    });
  }

  // Função para carregar os eventos
  Future<void> _loadEvents() async {
    final events = await getEvents(0);
    if (events != null) {
      setState(() {
        _events = events;
        _filteredEvents = events; // Inicia com todos os eventos
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

  // Função para filtrar eventos com base no texto do campo de pesquisa
  void _filterEvents() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredEvents = _events
          .where((event) => event.title.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              children: [
                SizedBox(
                  width: 800,
                  child: TextField(
                    controller: _searchController,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      label: Text("Pesquisar evento"),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.search,
                        color: textColor,
                        size: 30,
                      ),
                    ),
                    style: const TextStyle(color: textColor),
                  ),
                ),
                const SizedBox(height: 10),
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
                )
              ],
            ),
          ),
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _filteredEvents.isEmpty
                  ? const Center(child: Text("Nenhum evento encontrado."))
                  : Expanded(
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemCount: _filteredEvents.length,
                        itemBuilder: (context, index) {
                          final event = _filteredEvents[index];
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            child: EventCard(
                              goTo: '/event_data/:data',
                              title: event.title,
                              date: event.date,
                              id: event.id,
                              past: false,
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
