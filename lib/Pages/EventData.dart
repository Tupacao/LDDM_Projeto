import 'package:flutter/material.dart';
import 'package:projeto/Class/Event.dart';
import 'package:projeto/Components/ErrorDialog.dart';
import 'package:projeto/Req/EventReq.dart';
import 'package:projeto/assets/Colors.dart';

class EventData extends StatefulWidget {
  const EventData({super.key});

  @override
  State<EventData> createState() => _EventDataState();
}

class _EventDataState extends State<EventData> {
  Event? _event;
  String? eventId;

  @override
  void initState() {
    super.initState();
    // Recupera o ID do evento ao inicializar
    Future.microtask(() {
      final Map<String, dynamic>? args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      setState(() {
        eventId = args?['id'];
      });
      if (eventId != null) {
        _loadEvent(eventId!);
      } else {
        showErrorDialog(context, "Erro", "ID do evento não encontrado.");
      }
    });
  }

  Future<void> _loadEvent(String id) async {
    Event? event = await getEvent(id);
    if (event != null) {
      setState(() {
        _event = event;
      });
    } else {
      showErrorDialog(
          context, "Erro ao carregar evento", "Tente novamente mais tarde.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: const Text("Detalhes do Evento"),
      ),
      body: _event == null
          ? const Center(
              child: CircularProgressIndicator(
                color: accentColor,
              ),
            )
          : Center(
              child: Column(
                children: [
                  // Logo ou imagem do evento
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
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Nome do evento
                  SizedBox(
                    width: 800,
                    child: ListTile(
                      title: Text(
                        _event!.title,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(_event!.description),
                    ),
                  ),
                  // Data do evento
                  SizedBox(
                    width: 800,
                    child: ListTile(
                      title: const Text(
                        'Data do Evento',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(_event!.date),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Botão de participação
                  SizedBox(
                    width: 800,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: FilledButton(
                            onPressed: () async {
                              if (await subscribeEvent(eventId!)) {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Sucesso"),
                                    content: const Text(
                                        "Você está participando do evento."),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Ok"),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                showErrorDialog(
                                  context,
                                  "Erro ao participar do evento",
                                  "Algo de errado aconteceu, por favor tente novamente.",
                                );
                              }
                            },
                            style: FilledButton.styleFrom(
                              backgroundColor: accentColor,
                              minimumSize: const Size(100, 60),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              "Participar",
                              style: TextStyle(
                                fontSize: 20,
                                color: textColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      backgroundColor: secondaryColor,
    );
  }
}
