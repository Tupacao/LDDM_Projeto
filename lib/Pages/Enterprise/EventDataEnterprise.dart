import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/Class/Event.dart';
import 'package:projeto/Components/DateTextInputFormatter.dart';
import 'package:projeto/Components/ErrorDialog.dart';
import 'package:projeto/Components/Functoions.dart';
import 'package:projeto/Components/SuccesDialog.dart';
import 'package:projeto/Req/EventReq.dart';
import 'package:projeto/assets/Colors.dart';

class EventDataEnterprise extends StatefulWidget {
  const EventDataEnterprise({super.key});

  @override
  State<EventDataEnterprise> createState() => _EventDataEnterpriseState();
}

class _EventDataEnterpriseState extends State<EventDataEnterprise> {
  Event? _event;
  String? eventId;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

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
        _nameController.text = event.title;
        _dataController.text = event.date;
        _descController.text = event.description;
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
      body: SingleChildScrollView( // Adicionando rolagem
        child: Center(
          child: SizedBox(
            width: 800,
            child: Column(
              children: [
                Align(
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
                const SizedBox(height: 40),
                ListTile(
                  title: const Text(
                    'Nome do Evento',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(_event?.title ?? "Carregando..."),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 800,
                  child: TextField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: secondaryColor,
                    ),
                    style: const TextStyle(
                      color: primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  title: const Text(
                    'Data do Evento',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(convertToDateFormat(_event!.date) ?? "Carregando..."),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 800,
                  child: TextField(
                    controller: _dataController,
                    keyboardType: TextInputType.datetime,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: secondaryColor,
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      DateTextInputFormatter(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  title: const Text(
                    'Descrição',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(_event?.description ?? "Carregando..."),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 800,
                  child: TextFormField(
                    controller: _descController,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Escreva um pouco sobre o evento...',
                    ),
                    style: const TextStyle(
                      color: primaryColor,
                    ),
                  ),
                ),
                const SizedBox(width: 60),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FilledButton(
                        onPressed: () async {
                          Event aux = Event(
                            title: _nameController.text,
                            description: _descController.text,
                            date: _dataController.text,
                            id: _event!.id,
                          );
                          if (await updateEvent(aux)) {
                            showSuccessDialog(
                              context,
                              "Sucesso em alterar",
                              "As alterações serão aplicadas em instantes",
                            );
                          } else {
                            showErrorDialog(context, "Erro ao salvar informações",
                                "Tente novamente");
                          }
                        },
                        style: FilledButton.styleFrom(
                            backgroundColor: primaryColor,
                            minimumSize: const Size(100, 60),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                        child: const Text(
                          "Salvar alterações",
                          style: TextStyle(
                            fontSize: 20,
                            color: secondaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      FilledButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Deseja mesmo apagar?"),
                              content: Row(
                                children: [
                                  FilledButton(
                                    onPressed: () async {
                                      if (await deleteEvent(_event!.id)) {
                                        showDialog(
                                          context: context,
                                          builder: (builder) => Column(
                                            children: [
                                              const Text("Criado com sucesso"),
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
                                        showErrorDialog(context, "Erro deletar",
                                            "Tente novamente mais tarde");
                                      }
                                    },
                                    style: FilledButton.styleFrom(
                                        backgroundColor: accentColor,
                                        minimumSize: const Size(150, 60),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        )),
                                    child: const Text(
                                      "Sim",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: secondaryColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  FilledButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: FilledButton.styleFrom(
                                        backgroundColor: accentColor,
                                        minimumSize: const Size(150, 60),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        )),
                                    child: const Text(
                                      "Não",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: secondaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        style: FilledButton.styleFrom(
                            backgroundColor: accentColor,
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: secondaryColor,
    );
  }
}