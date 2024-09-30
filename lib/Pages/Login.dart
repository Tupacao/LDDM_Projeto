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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(""),
          const SizedBox(height: 100),
          Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Emai",
                  style: TextStyle(
                    fontSize: 25,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: primaryColor,
                ),
                style: const TextStyle(
                  color: secondaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Senha",
                  style: TextStyle(
                    fontSize: 25,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextField(
                controller: _passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                maxLength: 6,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: primaryColor,
                ),
                style: const TextStyle(
                  color: secondaryColor,
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
                backgroundColor: accentColor,
                minimumSize: const Size(200, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                )),
            child: const Text(
              "Fazer Login",
              style: TextStyle(
                fontSize: 20,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 40),
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
    ));
  }
}
