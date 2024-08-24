import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:check_elec/models/compteurModel.dart';
import 'package:check_elec/models/userModel.dart';

class ApiException implements Exception {
  final String message;
  ApiException(this.message);
}

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
        throw ApiException('Failed to register user: ${response.data}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ApiException('Error: ${e.response?.data}');
      } else {
        throw ApiException('Error: $e');
      }
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
        throw ApiException('Failed to login: ${response.data}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ApiException('Error: ${e.response?.data}');
      } else {
        throw ApiException('Error: $e');
      }
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
        throw ApiException('Failed to add compteur: ${response.data}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ApiException('Error: ${e.response?.data}');
      } else {
        throw ApiException('Error: $e');
      }
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
        print(data);
        return data.map((json) => Compteur.fromJson(json)).toList();
      } else {
        throw ApiException(
            'Failed to get user compteurs: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw ApiException('Error: ${e.response?.data}');
      } else {
        throw ApiException('Error: $e');
      }
    }
  }

  Future<Compteur?> updateCompteur(
    String id,
    Compteur compteur,
    String token,
  ) async {
    try {
      print('Token: $token'); // Pour vérifier si le token est bien transmis
      print('Compteur ID: $id'); // Pour vérifier l'ID du compteur

      final response = await _dio.put(
        '/compteurs/update/$id',
        data: json.encode(compteur.toJson()),
        options: Options(
          headers: {
            'accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      print('Response: ${response.data}'); // Pour vérifier la réponse brute
      print('Status Code: ${response.statusCode}');
      print('Headers: ${response.headers}');

      if (response.statusCode == 200) {
        return Compteur.fromJson(response.data['data']);
      } else {
        throw ApiException('Failed to update compteur: ${response.data}');
      }
    } on DioException catch (e) {
      print(
          'DioException: ${e.response?.data}'); // Affichez les détails de l'erreur

      if (e.response != null) {
        throw ApiException('Error: ${e.response?.data}');
      } else {
        throw ApiException('Error: $e');
      }
    }
  }
}
