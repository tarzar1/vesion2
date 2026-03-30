import 'dart:convert';
import 'package:http/http.dart' as http;
import 'storage_service.dart';

class ApiService {
  final String baseUrl = 'http://192.168.4.23:8000';
  final StorageService storage = StorageService();

  Future<bool> register(Map<String, dynamic> data) async {
    final res = await http.post(
      Uri.parse('$baseUrl/Create_driver/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );

    return res.statusCode == 200 || res.statusCode == 201;
  }

  Future<bool> login(String email, String password) async {
    final res = await http.post(
      Uri.parse('$baseUrl/login_jwt'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"email": email, "password": password}),
    );

    if (res.statusCode == 200) {
      final token = jsonDecode(res.body)['access_token'];
      await storage.saveToken(token);
      return true;
    }
    return false;
  }

  

  Future<List<Map<String, dynamic>>?> getOffers() async {
    final token = await storage.getToken();
    if (token == null) return null;

    final res = await http.get(
      Uri.parse('$baseUrl/offers_list'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return List<Map<String, dynamic>>.from(data);
    }
    return null;
  }

Future<bool> resetPassword(String newPassword,String email,id) async {
  final token = await storage.getToken();
  if (token == null) return false;

  final res = await http.patch(
    Uri.parse('$baseUrl/password_reset_jwt'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode({"email": email,"id":id, "new_password": newPassword}),
  );

  return res.statusCode == 200;
}

  Future<void> logout() async {
    await storage.deleteToken();
  }
}