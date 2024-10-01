import 'package:flutter/material.dart';
import 'package:projeto/Components/UserIcon.dart';
import 'package:projeto/assets/Colors.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UserIcon(showCross: false),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Row(
            //   children: [
            //     Container(
            //       width: 120,
            //       height: 120,
            //       decoration: const BoxDecoration(
            //         color: primaryColor,
            //         shape: BoxShape.circle,
            //       ),
            //       child: const Icon(
            //         Icons.no_accounts_outlined,
            //         color: secondaryColor,
            //         size: 100,
            //       ),
            //     ),
            //     const SizedBox(width: 20),
            //     const Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           "Nome do Evento",
            //           style: TextStyle(
            //             fontSize: 25,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         Text(
            //           "Descrição...",
            //           style: TextStyle(
            //             fontSize: 15,
            //             fontWeight: FontWeight.normal,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 20),
            const Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Criar novo evento:",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  width: 800,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Nome do Evento",
                      style: TextStyle(
                        fontSize: 20,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 800,
                  child: TextField(
                    controller: null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: secondaryColor,
                    ),
                    style: TextStyle(
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Column(
              children: [
                SizedBox(
                  width: 800,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Data",
                      style: TextStyle(
                        fontSize: 20,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 800,
                  child: TextField(
                    controller: null,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: secondaryColor,
                    ),
                    style: TextStyle(
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              children: [
                const SizedBox(
                  width: 800,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Descrição",
                      style: TextStyle(
                        fontSize: 20,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    width: 800,
                    child: TextFormField(
                      maxLines: 5,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Escreva um pouco sobre o evento...',
                      ),
                      style: const TextStyle(
                        color: primaryColor,
                      ),
                    )),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                  onPressed: () {
                    // funcao para salvar
                  },
                  style: FilledButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: const Size(100, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: const Text(
                    "Salvar",
                    style: TextStyle(
                      fontSize: 20,
                      color: secondaryColor,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                FilledButton(
                  onPressed: () {
                    // funcao para deletar
                  },
                  style: FilledButton.styleFrom(
                      backgroundColor: accentColor,
                      minimumSize: const Size(100, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: const Text(
                    "Cancelar",
                    style: TextStyle(
                      fontSize: 20,
                      color: secondaryColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      backgroundColor: secondaryColor,
    );
  }
}
