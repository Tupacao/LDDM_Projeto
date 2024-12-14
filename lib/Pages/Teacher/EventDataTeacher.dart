import 'package:flutter/material.dart';
import 'package:projeto/Class/Event.dart';
import 'package:projeto/Components/ErrorDialog.dart';
import 'package:projeto/Components/SuccesDialog.dart';
import 'package:projeto/Req/EventReq.dart';
import 'package:projeto/assets/Colors.dart';

class EventDataTeacher extends StatefulWidget {
  const EventDataTeacher({super.key});

  @override
  State<EventDataTeacher> createState() => _EventDataTeacherState();
}

class _EventDataTeacherState extends State<EventDataTeacher> {
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
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
              SizedBox(
                width: 800,
                child: ListTile(
                  title: const Text(
                    'Nome do Evento',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(_event!.title),
                ),
              ),
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
              SizedBox(
                width: 800,
                child: ListTile(
                  title: const Text(
                    'Descrição',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(_event!.description),
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FilledButton(
                      onPressed: () async {
                        if (await deleteEvent(eventId!)) {
                          showSuccessDialog(context, "Sucesso em Apagar",
                              "Os outros usários não verão mais este evento");
                        } else {
                          showErrorDialog(context, "Erro em apagar",
                              "Algo deu errado, tente novamente");
                        }
                      },
                      style: FilledButton.styleFrom(
                          backgroundColor: primaryColor,
                          minimumSize: const Size(100, 60),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          )),
                      child: const Text(
                        "Deletar",
                        style: TextStyle(
                          fontSize: 20,
                          color: secondaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    FilledButton(
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: secondaryColor,
    );
  }
}
