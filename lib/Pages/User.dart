import 'package:flutter/material.dart';
import 'package:projeto/Class/User.dart';
import 'package:projeto/Components/ErrorDialog.dart';
import 'package:projeto/Components/SuccesDialog.dart';
import 'package:projeto/Req/UserReq.dart';
import 'package:projeto/assets/Colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> _logout(BuildContext context) async {
    // Remove o token e o tipo do SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('type');

    // Retorna para a tela anterior
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Deseja sair?"),
                      content:
                          const Text("Você será desconectado da sua conta."),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Fecha o diálogo
                          },
                          child: const Text("Cancelar"),
                        ),
                        TextButton(
                          onPressed: () async {
                            await _logout(context); // Executa o logout
                            Navigator.of(context)
                                .popUntil((route) => route.isFirst);
                          },
                          child: const Text("Sair"),
                        ),
                      ],
                    ),
                  );
                },
                child: const SizedBox(
                  width: 100,
                  height: 100,
                  child: Icon(
                    Icons.exit_to_app,
                    color: primaryColor,
                    size: 80,
                  ),
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
                // const Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       "Nome do Usuário",
                //       style: TextStyle(
                //         fontSize: 25,
                //         fontWeight: FontWeight.normal,
                //       ),
                //     ),
                //     Text(
                //       "eumesmo@gmail.com",
                //       style: TextStyle(
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        "Editar informações do Perfil:",
                        style: TextStyle(
                          fontSize: 20,
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 800,
                  child: TextField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text("Nome de Usuário"),
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                SizedBox(
                  width: 800,
                  child: TextField(
                    controller: _emailController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text("Email"),
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                SizedBox(
                  width: 800,
                  child: TextField(
                    controller: _passwordController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text("Nova Senha"),
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                SizedBox(
                  width: 800,
                  child: TextField(
                    controller: _confirmPasswordController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text("Confirmar nova senha"),
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(
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
                  onPressed: () async {
                    User user = User(
                        name: _nameController.text,
                        email: _emailController.text,
                        type: '',
                        token: '',
                        password: _passwordController.text);

                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Deseja Salvar?"),
                        content: const Text(
                            "Tem certeza de que deseja alterar os dados de sua conta? Essa ação não pode ser desfeita."),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Cancelar"),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.of(context).pop();
                              if (await updateProfile(user)) {
                                showSuccessDialog(context, "Sucesso",
                                    "Os seus dados foram atualizados");
                              } else {
                                showErrorDialog(context, "Problema ao salvar os dados",
                          "Tente novamente");
                              }
                            },
                            child: const Text("Salvar"),
                          ),
                        ],
                      ),
                    );
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
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Confirmar exclusão"),
                        content: const Text(
                            "Tem certeza de que deseja excluir sua conta? Essa ação não pode ser desfeita."),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Cancelar"),
                          ),
                          TextButton(
                            onPressed: () async {
                              Navigator.of(context).pop();
                              if (await deleteAccount()) {
                                showSuccessDialog(context, "Sucesso",
                                    "Sua conta foi apagada");
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);
                              } else {
                                showErrorDialog(context, "Erro ao apagar conta",
                                    "Tente novamente mais tarde");
                              }
                            },
                            child: const Text("Excluir"),
                          ),
                        ],
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
            )
          ],
        ),
      ),
    );
  }
}
