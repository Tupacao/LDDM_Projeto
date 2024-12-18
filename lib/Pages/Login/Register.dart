import 'package:flutter/material.dart';
import 'package:projeto/Class/User.dart';
import 'package:projeto/Components/ErrorDialog.dart';
import 'package:projeto/Req/UserReq.dart';
import 'package:projeto/assets/Colors.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset("lib/assets/images/PucEventos.png"),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      const SizedBox(
                        width: 600,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Nome",
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
                          controller: _nameController,
                          keyboardType: TextInputType.name,
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
                      )
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
                          maxLength: 6,
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
                  Column(
                    children: [
                      const SizedBox(
                        width: 600,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Confirmar Senha",
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
                          controller: _confirmPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          maxLength: 6,
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
                  const SizedBox(height: 20),
                  FilledButton(
                    onPressed: () async {
                      User user = User(
                          name: _nameController.text,
                          email: _emailController.text,
                          type: 'A',
                          token: '',
                          password: _passwordController.text);

                      if (await insertUser(user)) {
                        Navigator.pop(context);
                      } else {
                        showErrorDialog(context, "Erro ao registrar",
                            "Algo de errado aconteceu, por favor tente novamente");
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: primaryColor,
                      minimumSize: const Size(200, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Criar conta",
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
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Já tem uma conta? Faça Login",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
      backgroundColor: secondaryColor,
    );
  }
}
