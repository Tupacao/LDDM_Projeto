import 'dart:convert'; // Para manipular JSON
import 'package:projeto/Class/Event.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

const String apiUrl = "https://localhost:5432/events/";

// Inserir um novo evento
Future<bool> insertEvent(Event event) async {
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
        return true;
      } else {
        print("Erro ao criar evento: ${response.body}");
      }
    } else {
      print("Token não encontrado!");
    }
  } catch (e) {
    print("Erro de conexão: $e");
  }
  return false;
}

// Buscar um evento específico
Future<Map<String, dynamic>?> getEvent(String eventId) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      final response = await http.get(
        Uri.parse('$apiUrl/getEvent?eventId=$eventId'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("Evento: $data");
        return data;
      } else {
        print("Erro ao buscar evento: ${response.body}");
      }
    } else {
      print("Token não encontrado!");
    }
  } catch (e) {
    print("Erro de conexão: $e");
  }
  return null;
}

// Buscar todos os eventos
Future<List<dynamic>?> getEvents() async {
  try {
    final response = await http.get(Uri.parse('$apiUrl/getEvents'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print("Eventos: $data");
      return data;
    } else {
      print("Erro ao buscar eventos: ${response.body}");
    }
  } catch (e) {
    print("Erro de conexão: $e");
  }
  return null;
}

// Atualizar um evento
Future<bool> updateEvent(Event event) async {
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
        return true;
      } else {
        print("Erro ao atualizar evento: ${response.body}");
      }
    } else {
      print("Token não encontrado!");
    }
  } catch (e) {
    print("Erro de conexão: $e");
  }
  return false;
}

// Deletar um evento
Future<bool> deleteEvent(String eventId) async {
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
        return true;
      } else {
        print("Erro ao deletar evento: ${response.body}");
      }
    } else {
      print("Token não encontrado!");
    }
  } catch (e) {
    print("Erro de conexão: $e");
  }
  return false;
}

// Inscrever-se em um evento
Future<bool> subscribeEvent(String eventId) async {
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
        return true;
      } else {
        print("Erro ao se inscrever no evento: ${response.body}");
      }
    } else {
      print("Token não encontrado!");
    }
  } catch (e) {
    print("Erro de conexão: $e");
  }
  return false;
}

// Cancelar inscrição em um evento
Future<bool> unsubscribeEvent(String eventId) async {
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
        return true;
      } else {
        print("Erro ao cancelar inscrição: ${response.body}");
      }
    } else {
      print("Token não encontrado!");
    }
  } catch (e) {
    print("Erro de conexão: $e");
  }
  return false;
}

// Buscar eventos do usuário
Future<List<dynamic>?> getUserEvents() async {
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
        return data;
      } else {
        print("Erro ao buscar eventos do usuário: ${response.body}");
      }
    } else {
      print("Token não encontrado!");
    }
  } catch (e) {
    print("Erro de conexão: $e");
  }
  return null;
}
