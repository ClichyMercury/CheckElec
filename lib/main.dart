import 'dart:io';
import 'package:check_elec/constant/palette.dart';
import 'package:check_elec/data/data_repository.dart';
import 'package:check_elec/screens/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) => DataRepository(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Meter Manager',
        theme: ThemeData(
          fontFamily: "Isophan",
          primaryColor: Palette.orangeToWhite,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange.shade500),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}

// Désactiver la vérification SSL pour le développement
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
