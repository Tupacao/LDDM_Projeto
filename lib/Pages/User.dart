import 'package:flutter/material.dart';
import 'package:projeto/assets/Colors.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  bool varOpen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                width: 100,
                height: 100,
                child: Icon(
                  Icons.exit_to_app,
                  color: primaryColor,
                  size: 80,
                ),
              ),
            ),
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
                    Icons.account_circle,
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
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      "eumesmo@gmail.com",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Descrição...",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      child: Text(
                        "Editar informações do Perfil:",
                        style: TextStyle(
                          fontSize: 20,
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          varOpen = !varOpen;
                        });
                      },
                      child: const Icon(
                        Icons.edit,
                        size: 40,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const SizedBox(
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
                    "Salvar Informações",
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
                  child: Text(
                    varOpen ? "Deletar" : "Cancelar",
                    style: const TextStyle(
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
    );
  }
}
