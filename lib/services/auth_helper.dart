import 'package:check_elec/data/data_repository.dart';
import 'package:check_elec/screens/connection/connection.dart';
import 'package:check_elec/screens/root.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  static Future<void> handleUserRedirection(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString('accessToken');
    String? userId = prefs.getString('userId');

    final dataRepository = Provider.of<DataRepository>(context, listen: false);

    if (accessToken != null && accessToken.isNotEmpty) {
      await dataRepository.fetchUserCompteurs(userId!, accessToken);
      // Si l'utilisateur est déjà connecté, rediriger vers la page d'accueil
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Root()),
      );
    } else {
      // Sinon, rediriger vers la page de connexion
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ConnectionScreen()),
      );
    }
  }
}
