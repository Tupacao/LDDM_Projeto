import 'package:flutter/material.dart';
import 'package:projeto/Components/EventCard.dart';
import 'package:projeto/assets/Colors.dart';

class HomeTeacher extends StatefulWidget {
  const HomeTeacher({super.key});

  @override
  State<HomeTeacher> createState() => _HomeTeacherState();
}

class _HomeTeacherState extends State<HomeTeacher> {
  final TextEditingController _searchController = TextEditingController();
  bool _varOpen = true;

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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 200,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Selecione os seus filtros"),
                                content: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text("Filtro 1 "),
                                    const Text("Filtro 1"),
                                    const Text("Filtro 1"),
                                    const Text("Filtro 1"),
                                    const Text("Filtro 1"),
                                    FilledButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Aplicar Filtros"),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 100,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: accentColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Filtro",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(Icons.add),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _varOpen = true;
                          });
                        },
                        child: const Text("Eventos"),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _varOpen = false;
                          });
                        },
                        child: const Text("Para Avaliar"),
                      ),
                    ]),
                  ],
                ),
              ],
            ),
          ),
          if (_varOpen)
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: EventCard(goTo: '/event_data/:enterprise', past: false),
                  );
                },
              ),
            ),
          if(!_varOpen)
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: EventCard(goTo: '/event_data/:teacher', past: true),
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
