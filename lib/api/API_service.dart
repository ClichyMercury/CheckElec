import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:check_elec/models/compteurModel.dart';
import 'package:check_elec/models/userModel.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = 'https://metermanager.softskills.ci/api';
    _dio.options.connectTimeout = Duration(seconds: 5); // 5 secondes
    _dio.options.receiveTimeout = Duration(seconds: 3); // 3 secondes
  }

  Future<User?> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/register',
        queryParameters: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'password': password,
        },
      );

      print('Response data: ${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return User.fromJson(response.data['user']);
      } else {
        print('Error: ${response.data}');
        return null;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('Error: ${e.response?.data}');
      } else {
        print('Error: $e');
      }
      return null;
    }
  }

  Future<Map<String, dynamic>?> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        queryParameters: {
          'email': email,
          'password': password,
        },
      );

      // Afficher la réponse complète pour déboguer
      print('Response data: ${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Récupérer l'access token et l'utilisateur depuis la réponse
        final accessToken = response.data['access_token'];
        final user = User.fromJson(response.data['user']);

        // Retourner les deux valeurs sous forme de Map
        return {
          'accessToken': accessToken,
          'user': user,
        };
      } else {
        // Gérer les messages d'erreur
        print('Error: ${response.data}');
        return null;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('Error: ${e.response?.data}');
      } else {
        print('Error: $e');
      }
      return null;
    }
  }

  Future<Compteur?> addCompteur(Compteur compteur, String token) async {
    try {
      print('Token: $token'); // Pour vérifier si le token est bien transmis

      final response = await _dio.post(
        '/compteurs/new',
        data: json.encode(compteur.toJson()),
        options: Options(
          headers: {
            'accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print('Response: ${response.data}'); // Pour vérifier la réponse brute

      if (response.statusCode == 200 || response.statusCode == 201) {
        return Compteur.fromJson(response.data['data']);
      } else {
        print('Error: ${response.data}');
        return null;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('Error: ${e.response?.data}');
      } else {
        print('Error: $e');
      }
      return null;
    }
  }

  Future<List<Compteur>?> getUserCompteurs(String userId, String token) async {
    try {
      final response = await _dio.get(
        '/compteurs/user/$userId',
        options: Options(
          headers: {
            'accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        return data.map((json) => Compteur.fromJson(json)).toList();
      } else {
        print('Error: ${response.statusMessage}');
        return null;
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('Error: ${e.response?.data}');
      } else {
        print('Error: $e');
      }
      return null;
    }
  }
}
