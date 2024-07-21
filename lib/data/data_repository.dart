import 'package:check_elec/api/API_service.dart';
import 'package:check_elec/models/compteurModel.dart';
import 'package:check_elec/models/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class DataRepository with ChangeNotifier {
  final ApiService apiService = ApiService();
  User? _user;
  List<Compteur>? _compteurs;
  bool _isLoading = false;
  String? _accessToken;
  String? _errorMessage;

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get accessToken => _accessToken;
  String? get errorMessage => _errorMessage;
  List<Compteur>? get compteurs => _compteurs;

  Future<void> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final registeredUser = await apiService.registerUser(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );

      if (registeredUser != null) {
        _user = registeredUser;
        await saveUserId(user!.id);
      } else {
        _errorMessage = 'Registration failed';
      }
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> saveUserId(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final loginData = await apiService.loginUser(
        email: email,
        password: password,
      );

      if (loginData != null) {
        _user = loginData['user'];
        _accessToken = loginData['accessToken'];
        await saveAccessToken(_accessToken!);
      } else {
        _errorMessage = 'Login failed';
      }
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> saveAccessToken(String accessToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', accessToken);
  }

  Future<void> fetchUserCompteurs(String userId, String token) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _compteurs = await apiService.getUserCompteurs(userId, token);
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> createCompteur(Compteur compteur, String token) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final newCompteur = await apiService.addCompteur(compteur, token);

      if (newCompteur != null) {
        _compteurs?.add(newCompteur);
      } else {
        _errorMessage = 'Failed to add compteur';
      }
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
