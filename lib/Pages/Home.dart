import 'package:flutter/material.dart';
import 'package:projeto/Components/EventCard.dart';
import 'package:projeto/assets/Colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _searchController = TextEditingController();

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
                  SizedBox(
                      width: 800,
                      child: Align(
                        alignment: Alignment
                            .centerLeft, // Alinha o Container ao início (start)
                        child: Container(
                          width: 100,
                          padding: const EdgeInsets.all(10), // Adiciona padding
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
                                width: 8, // Espaço entre o texto e o ícone
                              ),
                              Icon(Icons.add),
                            ],
                          ),
                        ),
                      )),
                ],
              )),
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
      backgroundColor: secondaryColor,
    );
  }
}
