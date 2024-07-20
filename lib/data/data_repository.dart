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

  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get accessToken => _accessToken;
  List<Compteur>? get compteurs => _compteurs;

  Future<void> registerUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    final registeredUser = await apiService.registerUser(
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
    );

    if (registeredUser != null) {
      _user = registeredUser;
      // Sauvegarder l'access token localement (exemple avec shared_preferences)
      await saveUserId(user!.id);
      print('Inscription réussie : ${_user?.firstName} ${_user?.lastName}');
    } else {
      // Affiche un message d'erreur seulement si l'utilisateur n'est pas enregistré
      print('Inscription échouée : un problème est survenue');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> saveUserId(String userId) async {
    // Exemple avec shared_preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    final loginData = await apiService.loginUser(
      email: email,
      password: password,
    );

    if (loginData != null) {
      _user = loginData['user'];
      _accessToken = loginData['accessToken'];

      // Sauvegarder l'access token localement (exemple avec shared_preferences)
      await saveAccessToken(_accessToken!);

      print('Login successful: ${_user?.firstName} ${_user?.lastName}');
    } else {
      // Affiche un message d'erreur seulement si le login échoue
      print('Login failed');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> saveAccessToken(String accessToken) async {
    // Exemple avec shared_preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('accessToken', accessToken);
  }

  Future<void> fetchUserCompteurs(String userId, String token) async {
    _isLoading = true;
    notifyListeners();

    _compteurs = await apiService.getUserCompteurs(userId, token);

    _isLoading = false;
    notifyListeners();
  }

  Future<void> createCompteur(Compteur compteur, String token) async {
    _isLoading = true;
    notifyListeners();

    final newCompteur = await apiService.addCompteur(compteur, token);

    if (newCompteur != null) {
      _compteurs?.add(newCompteur);
    }

    _isLoading = false;
    notifyListeners();
  }
}
