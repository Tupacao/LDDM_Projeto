import 'dart:convert'; // Para manipular JSON
import 'package:projeto/Class/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

const String apiUrl = "http://localhost:8080/api/v1/users";

// Função de Login
Future<bool> loginUser(User user) async {
  try {
    final response = await http.post(
      Uri.parse('$apiUrl/login'),
      headers: {
        'Content-Type': 'application/json', // Especifica que o corpo é JSON
      },
      body: jsonEncode({
        'email': user.email,
        'password': user.password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      // Salvar o token no SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = data['token'];
      await prefs.setString('token', token);

      // Dividir o token em partes
      List<String> aux = token.split('.');

      if (aux.length > 1) {
        // Decodificar a segunda parte (payload)
        String payload = utf8.decode(base64.decode(base64.normalize(aux[1])));
        Map<String, dynamic> decodedPayload = jsonDecode(payload);

        // Obter o valor de "type" e mapear para A, P, E
        String userType = decodedPayload['type'];
        String mappedType;

        switch (userType) {
          case "ALUNO":
            mappedType = "A";
            break;
          case "PROFESSOR":
            mappedType = "P";
            break;
          case "EMPRESA":
            mappedType = "E";
            break;
          default:
            mappedType = "U"; // Caso desconhecido (U = Unknown)
        }

        // Salvar o tipo mapeado no SharedPreferences
        await prefs.setString('type', mappedType);

        print("Tipo mapeado e salvo: $mappedType");
      } else {
        print("Token malformado.");
      }

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

// Função de Deleção
Future<bool> deleteAccount() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');

  if (token != null) {
    final response = await http.delete(
      Uri.parse('$apiUrl/delete'),
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json'
      },
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
      headers: {
        'Authorization': token,
        'Content-Type': 'application/json'
      },
      body: jsonEncode({
        'name': user.name,
        'email': user.email,
        'password': user.password,
      }),
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
      headers: {'Authorization': '', 'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': user.name,
        'email': user.email,
        'password': user.password,
        'type': user.type,
      }),
    );

    if (response.statusCode == 200) {
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
