import 'dart:convert'; // Para manipular JSON
import 'package:projeto/Class/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

const String apiUrl = "https://localhost:5432/user/"; // Substitua pela URL da sua API

// Função de Login
Future<void> loginUser(User user) async {
  try {
    final response = await http.post(
      Uri.parse('$apiUrl/login'),
      body: {
        'email': user.email,
        'password': user.password,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Salvar o token no SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', data['token']);

      print("Login bem-sucedido!");
    } else {
      print("Falha no login: ${response.body}");
    }
  } catch (e) {
    print("Erro de conexão: $e");
  }
}

// Função de Registro
Future<void> registerUSer(User user) async {
  try {
    final response = await http.post(
      Uri.parse('$apiUrl/register'),
      body: {
        'name': user.name,
        'email': user.email,
        'password': user.password,
      },
    );

    if (response.statusCode == 201) {
      print("Registro bem-sucedido!");
    } else {
      print("Falha no registro: ${response.body}");
    }
  } catch (e) {
    print("Erro de conexão: $e");
  }
}

// Função de Deleção
Future<void> deleteAccount() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  if (token != null) {
    final response = await http.delete(
      Uri.parse('$apiUrl/delete'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      await prefs.remove('token');
      print("Conta deletada com sucesso!");
    } else {
      print("Falha na deleção: ${response.body}");
    }
  } else {
    print("Token não encontrado!");
  }
}

// Função de Atualização
Future<void> updateProfile(User user) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  if (token != null) {
    final response = await http.put(
      Uri.parse('$apiUrl/update'),
      headers: {'Authorization': 'Bearer $token'},
      body: {
        'name': user.name,
        'email': user.email,
        'password': user.password,
      },
    );

    if (response.statusCode == 200) {
      print("Perfil atualizado com sucesso!");
    } else {
      print("Falha na atualização: ${response.body}");
    }
  } else {
    print("Token não encontrado!");
  }
}

// Função de Inserir Usuário
Future<void> insertUser(User user) async {
  try {
    final response = await http.post(
      Uri.parse('$apiUrl/insert'),
      body: {
        'name': user.name,
        'email': user.email,
        'password': user.password,
        'type': user.type,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Salvar o token no SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', data['token']);

      print("inserção bem-sucedido!");
    } else {
      print("Falha na inserção: ${response.body}");
    }
  } catch (e) {
    print("Erro de conexão: $e");
  }
}