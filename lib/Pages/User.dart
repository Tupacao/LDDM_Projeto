import 'package:flutter/material.dart';
import 'package:projeto/Components/NavBottombar.dart';
import 'package:projeto/assets/Colors.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.no_accounts_outlined,
                    color: secondaryColor,
                    size: 100,
                  ),
                ),
                const SizedBox(width: 20),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Nome do Usuário",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Descrição...",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 60),
            const Column(
              children: [
                SizedBox(
                  width: 800,
                  child: Text("Editar informações do Perfil:",
                      style: TextStyle(
                        fontSize: 20,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(
                  width: 800,
                  child: TextField(
                    controller: null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Text("Nome de Usuário"),
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Column(
              children: [
                SizedBox(
                  width: 800,
                  child: TextField(
                    controller: null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Text("Email"),
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Column(
              children: [
                SizedBox(
                  width: 800,
                  child: TextField(
                    controller: null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Text("Nova Senha"),
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Column(
              children: [
                SizedBox(
                  width: 800,
                  child: TextField(
                    controller: null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Text("Confirmar nova senha"),
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Column(
              children: [
                SizedBox(
                  width: 800,
                  child: TextField(
                    controller: null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: Text("Descrição do perfil"),
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            Row(
              children: [
                FilledButton(
                  onPressed: () {
                    // funcao para salvar
                  },
                  style: FilledButton.styleFrom(
                      backgroundColor: accentColor,
                      minimumSize: const Size(100, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: const Text(
                    "Salvar",
                    style: TextStyle(
                      fontSize: 20,
                      color: textColor,
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
                    "Deletar",
                    style: TextStyle(
                      fontSize: 20,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: const NavBottomBar(),
    );
  }
}
