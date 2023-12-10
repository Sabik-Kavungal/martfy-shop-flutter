import 'package:http/http.dart' as http;
import 'package:martfy/constants/commen_variable.dart';
import 'dart:convert';

import 'package:martfy/helper/localDB.dart';

class ApiProvider {
  static const baseUrl = 'https://sample-node-mongo-api.onrender.com';

  Future<Map<String, dynamic>> post(
      String endpoint, Map<String, dynamic> body) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/api/$endpoint'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(body),
      );

      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Successful response
        return jsonDecode(response.body);
      } else if (response.statusCode == 400) {
        // Handle Bad Request (400)
        throw Exception('Bad Request: ${response.body}');
      } else if (response.statusCode == 401) {
        // Handle Unauthorized y6ji6tf (401)
        throw Exception('Unauthorized: ${response.body}');
      } else if (response.statusCode == 404) {
        // Handle Not Found (404)
        throw Exception('Not Found: ${response.body}');
      } else if (response.statusCode == 500) {
        // Handle Internal Server Error (500)
        throw Exception('Internal Server Error: ${response.body}');
      } else {
        // Handle other HTTP errors here.
        throw Exception('Failed to make API call: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or other errors
      throw Exception('Failed to make API call: $error');
    }
  }

  LocalDatabaseService db = LocalDatabaseService();

  Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final boxOpen = await db.openBox("token");
      final a = db.fromDb(boxOpen, 'key');
      final response = await http.get(
        Uri.parse('$baseUrl/api/$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': a,
        },
      );
      print('saikkkkkkkkk: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to make GET API call: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to make GET API call: $error');
    }
  }

  Future<List<dynamic>> getList(String endpoint) async {
    try {
      final boxOpen = await db.openBox("token");
      final a = db.fromDb(boxOpen, 'key');
      final response = await http.get(
        Uri.parse('$baseUrl/api/$endpoint'),
        headers: {'Content-Type': 'application/json',   'x-auth-token': a,},
      );
      print('saikkkkkkkkk: ${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body) as List<dynamic>;
      } else {
        throw Exception('Failed to make GET API call: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to make GET API call: $error');
    }
  }

  Future<Map<String, dynamic>> put(
      String endpoint, Map<String, dynamic> body) async {
    try {
      final boxOpen = await db.openBox("token");
      final a = db.fromDb(boxOpen, 'key');
      final response = await http.put(
        Uri.parse('$baseUrl/api/$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          'x-auth-token': a,
        },
        body: jsonEncode(body),
      );
      printx("body", response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to make PUT API call: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to make PUT API call: $error');
    }
  }

  delete(String endpoint) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/api/$endpoint'),
        headers: {'Content-Type': 'application/json'},
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode != 200) {
        throw Exception(
            'Failed to make DELETE API call: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to make DELETE API call: $error');
    }
  }
}
