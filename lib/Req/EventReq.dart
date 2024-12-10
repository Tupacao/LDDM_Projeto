import 'dart:convert'; // Para manipular JSON
import 'package:projeto/Class/Event.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

const String apiUrl = "https://localhost:5432/events/";

// Inserir um novo evento
Future<void> insertEvent(Event event) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      final response = await http.post(
        Uri.parse('$apiUrl/insert'),
        headers: {'Authorization': 'Bearer $token'},
        body: {
          'title': event.title,
          'date': event.date,
          'description': event.description,
        },
      );

      if (response.statusCode == 201) {
        print("Evento criado com sucesso!");
      } else {
        print("Erro ao criar evento: ${response.body}");
      }
    } else {
      print("Token não encontrado!");
    }
  } catch (e) {
    print("Erro de conexão: $e");
  }
}

// Buscar um evento específico
Future<void> getEvent(String eventId) async {
  try {
    // Obtém o token armazenado no SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token'); // Busca o token

    if (token != null) {
      // Faz a requisição GET passando o token no cabeçalho e o eventId na URL
      final response = await http.get(
        Uri.parse('$apiUrl/getEvent?eventId=$eventId'), // Passa o eventId como query parameter
        headers: {
          'Authorization': 'Bearer $token', // Passa o token como header
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body); // Decodifica a resposta JSON
        print("Evento: $data");
      } else {
        print("Erro ao buscar evento: ${response.body}");
      }
    } else {
      print("Token não encontrado!");
    }
  } catch (e) {
    print("Erro de conexão: $e");
  }
}

// Buscar todos os eventos
Future<void> getEvents() async {
  try {
    final response = await http.get(Uri.parse('$apiUrl/getEvents'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Eventos: $data");
    } else {
      print("Erro ao buscar eventos: ${response.body}");
    }
  } catch (e) {
    print("Erro de conexão: $e");
  }
}

// Atualizar um evento
Future<void> updateEvent(Event event) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      final response = await http.put(
        Uri.parse('$apiUrl/update/${event.id}'),
        headers: {'Authorization': 'Bearer $token'},
        body: {
          'title': event.title,
          'date': event.date,
          'description': event.description,
        },
      );

      if (response.statusCode == 200) {
        print("Evento atualizado com sucesso!");
      } else {
        print("Erro ao atualizar evento: ${response.body}");
      }
    } else {
      print("Token não encontrado!");
    }
  } catch (e) {
    print("Erro de conexão: $e");
  }
}

// Deletar um evento
Future<void> deleteEvent(String eventId) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      final response = await http.delete(
        Uri.parse('$apiUrl/delete/$eventId'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        print("Evento deletado com sucesso!");
      } else {
        print("Erro ao deletar evento: ${response.body}");
      }
    } else {
      print("Token não encontrado!");
    }
  } catch (e) {
    print("Erro de conexão: $e");
  }
}

// Inscrever-se em um evento
Future<void> subscribeEvent(String eventId) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      final response = await http.post(
        Uri.parse('$apiUrl/subscribe/$eventId'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        print("Inscrito no evento com sucesso!");
      } else {
        print("Erro ao se inscrever no evento: ${response.body}");
      }
    } else {
      print("Token não encontrado!");
    }
  } catch (e) {
    print("Erro de conexão: $e");
  }
}

// Cancelar inscrição em um evento
Future<void> unsubscribeEvent(String eventId) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      final response = await http.post(
        Uri.parse('$apiUrl/unsubscribe/$eventId'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        print("Inscrição cancelada com sucesso!");
      } else {
        print("Erro ao cancelar inscrição: ${response.body}");
      }
    } else {
      print("Token não encontrado!");
    }
  } catch (e) {
    print("Erro de conexão: $e");
  }
}

// Buscar eventos do usuário
Future<void> getUserEvents() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      final response = await http.get(
        Uri.parse('$apiUrl/user/events'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("Eventos do usuário: $data");
      } else {
        print("Erro ao buscar eventos do usuário: ${response.body}");
      }
    } else {
      print("Token não encontrado!");
    }
  } catch (e) {
    print("Erro de conexão: $e");
  }
}
