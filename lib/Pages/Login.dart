import 'package:flutter/material.dart';
import 'package:projeto/assets/Colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  const SizedBox(height: 20,),
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
                      Navigator.pushNamed(context, '/home');
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
            )));
  }
}
