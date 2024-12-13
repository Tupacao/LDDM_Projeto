import 'package:flutter/material.dart';
import 'package:projeto/Components/ErrorDialog.dart';
import 'package:projeto/Req/EventReq.dart';
import 'package:projeto/assets/Colors.dart';

class EventDataStudent extends StatefulWidget {
  const EventDataStudent({super.key});

  @override
  State<EventDataStudent> createState() => _EventDataStudentState();
}

class _EventDataStudentState extends State<EventDataStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
      ),
      body: Center(
        child: SingleChildScrollView(
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
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: lightBlue,
                  ),
                  child: Image.asset("lib/assets/images/QrCode.png"),
                ),
              )),
          SizedBox(
              width: 800,
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: FilledButton(
                    onPressed: () async {
                      if (await unsubscribeEvent('aca145f2-57bd-4707-be40-6b9d3dc90396')) {
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
                        ErrorDialog(
                          erro: "Erro desiscrever",
                          desc: "Tente mais tarde",
                        );
                      }
                    },
                    style: FilledButton.styleFrom(
                        backgroundColor: accentColor,
                        minimumSize: const Size(100, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )),
                    child: const Text(
                      "Desinscrever",
                      style: TextStyle(
                        fontSize: 20,
                        color: textColor,
                      ),
                    ),
                  ),
                )
              ])),
        ])),
      ),
      backgroundColor: secondaryColor,
    );
  }
}
