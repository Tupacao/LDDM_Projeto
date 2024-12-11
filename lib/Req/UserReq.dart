import 'dart:convert'; // Para manipular JSON
import 'package:projeto/Class/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

const String apiUrl = "https://localhost:5432/user/"; // Substitua pela URL da sua API

// Função de Login
Future<bool> loginUser(User user) async {
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
      await prefs.setString('type', data['type']);

      print("Login bem-sucedido!");
      return true; // Retorna true em caso de sucesso
    } else {
      print("Falha no login: ${response.body}");
      return false; // Retorna false em caso de falha
    }
  } catch (e) {
    print("Erro de conexão: $e");
    return false; // Retorna false em caso de erro
  }
}

// Função de Registro
Future<bool> registerUser(User user) async {
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
      return true; // Retorna true em caso de sucesso
    } else {
      print("Falha no registro: ${response.body}");
      return false; // Retorna false em caso de falha
    }
  } catch (e) {
    print("Erro de conexão: $e");
    return false; // Retorna false em caso de erro
  }
}

// Função de Deleção
Future<bool> deleteAccount() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  if (token != null) {
    final response = await http.delete(
      Uri.parse('$apiUrl/delete'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      await prefs.remove('token');
      await prefs.remove('type');
      print("Conta deletada com sucesso!");
      return true; // Retorna true em caso de sucesso
    } else {
      print("Falha na deleção: ${response.body}");
      return false; // Retorna false em caso de falha
    }
  } else {
    print("Token não encontrado!");
    return false; // Retorna false se o token não for encontrado
  }
}

// Função de Atualização
Future<bool> updateProfile(User user) async {
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
      return true; // Retorna true em caso de sucesso
    } else {
      print("Falha na atualização: ${response.body}");
      return false; // Retorna false em caso de falha
    }
  } else {
    print("Token não encontrado!");
    return false; // Retorna false se o token não for encontrado
  }
}

// Função de Inserir Usuário
Future<bool> insertUser(User user) async {
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
      await prefs.setString('type', data['type']);

      print("Inserção bem-sucedida!");
      return true; // Retorna true em caso de sucesso
    } else {
      print("Falha na inserção: ${response.body}");
      return false; // Retorna false em caso de falha
    }
  } catch (e) {
    print("Erro de conexão: $e");
    return false; // Retorna false em caso de erro
  }
}
