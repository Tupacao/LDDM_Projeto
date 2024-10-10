import 'package:flutter/material.dart';
import 'package:projeto/assets/Colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  List<Map<String, String>> users = [
    {'email': 'aluno@gmail.com', 'senha': 'ps1'},
    {'email': 'professor@gmail.com', 'senha': 'ps2'},
    {'email': 'empresa@gmail.com', 'senha': 'ps3'},
    {'email': 'adm', 'senha': '123'}
  ];

  int testLogin() {
    if (_emailController.text == users[0]['email'] &&
        _passwordController.text == users[0]['senha']) {
      return 1;
    } else if (_emailController.text == users[1]['email'] &&
        _passwordController.text == users[1]['senha']) {
      return 2;
    } else if (_emailController.text == users[2]['email'] &&
        _passwordController.text == users[2]['senha']) {
      return 3;
    } else if (_emailController.text == users[3]['email'] &&
        _passwordController.text == users[3]['senha']) {
      return 3;
    } else {
      return -1;
    }
  }

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("lib/assets/images/PucEventos.png"),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                    height: 40,
                    child: Text("Faça seu Login",
                        style: TextStyle(
                            fontSize: 20,
                            color: textColor,
                            fontWeight: FontWeight.bold))),
                Column(
                  children: [
                    const SizedBox(
                      width: 600,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 20,
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 600,
                      child: TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
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
                    const SizedBox(
                      width: 600,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Senha",
                          style: TextStyle(
                            fontSize: 20,
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 600,
                      child: TextField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        style: const TextStyle(
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                FilledButton(
                  onPressed: () {
                    int value = testLogin();

                    if (value != -1) {
                      Navigator.pushNamed(
                        context,
                        '/home',
                        arguments: value,
                      );
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                                title: Text("Erro de Login"),
                                content: Text(
                                    "Email ou senha inválidos, tente novamente"),
                              ));
                    }
                  },
                  style: FilledButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: const Size(200, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: const Text(
                    "Entrar",
                    style: TextStyle(
                      fontSize: 20,
                      color: secondaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text(
                    "Não tem uma conta? Criar uma",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          )),
      backgroundColor: secondaryColor,
    );
  }
}
