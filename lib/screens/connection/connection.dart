import 'package:check_elec/data/data_repository.dart';
import 'package:check_elec/screens/connection/inscription.dart';
import 'package:check_elec/screens/root.dart';
import 'package:check_elec/widgets/MainButton.dart';
import 'package:check_elec/widgets/alertDialog.dart';
import 'package:check_elec/widgets/iosAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:check_elec/constant/custumTheme.dart';
import 'dart:io' show Platform;

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({
    super.key,
  });

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  TextEditingController emailController =
      TextEditingController(text: 'angie@martiale.ci');
  TextEditingController passwordController =
      TextEditingController(text: '12345678');
  bool isObs = false;
  bool isLoading = false;

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  Future<String?> _getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  Future<String?> _getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }

  void _registerUser(DataRepository dataRepository) async {
    await dataRepository.loginUser(
      email: emailController.text,
      password: passwordController.text,
    );

    String? userId = await _getUserId();
    String? accessToken = await _getAccessToken();

    final user = dataRepository.user;
    if (user != null) {
      print('Connexion réussie : ${user.firstName} ${user.lastName}');
      print('Utilisateur ID : ${user.id}');

      emailController.clear();
      passwordController.clear();
      await dataRepository.fetchUserCompteurs(userId!, accessToken!);
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => const Root()));
    } else {
      print('Connexion échouée');
      if (dataRepository.errorMessage != null) {
        _showErrorDialog(context, dataRepository.errorMessage!);
      }
    }
  }

  void _showErrorDialog(BuildContext context, String errorMessage) {
    if (Platform.isIOS) {
      iosShowAlertDialog(context,
          title: 'Erreur', content: errorMessage, defaultActionText: 'okay');
    } else {
      showAlertDialog(context,
          title: 'Erreur', content: errorMessage, defaultActionText: 'okay');
    }
  }

  @override
  Widget build(BuildContext context) {
    final dataRepository = Provider.of<DataRepository>(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CustumTheme.bgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: height / 6.5),
              Image.asset(
                'assets/images/logo_whitout_bg.PNG',
              ),
              Text(
                'Connexion',
                style: TextStyle(fontSize: width / 10),
              ),
              SizedBox(height: height / 25.5),
              TextField(
                showCursor: true,
                focusNode: emailFocusNode,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                controller: emailController,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email,
                    color: CustumTheme.orangeMainColor,
                  ),
                  enabled: true,
                  //errorText: "Email error",
                  label: Text(
                    'Email',
                    style: textFieldTextStyle(),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.50),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                showCursor: true,
                focusNode: passwordFocusNode,
                textInputAction: TextInputAction.done,
                autocorrect: false,
                controller: passwordController,
                textAlignVertical: TextAlignVertical.center,
                obscureText: isObs,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.key,
                    color: CustumTheme.orangeMainColor,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObs = !isObs;
                      });
                    },
                    child: isObs
                        ? Icon(
                            Icons.visibility,
                            color: CustumTheme.orangeMainColor,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: CustumTheme.orangeMainColor,
                          ),
                  ),
                  enabled: true,
                  //errorText: 'password error',
                  label: Text(
                    'Password',
                    style: textFieldTextStyle(),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.50),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 13.5),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  splashColor: CustumTheme.orangeMainColor.withOpacity(0.2),
                  child: TextButton(
                      onPressed: () {
                        /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => const ResetPassword())); */
                      },
                      child: const Text(
                        "Mot de passe oublié ?",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      )),
                ),
              ),
              SizedBox(height: 13.5),
              Mainbutton(
                  onTap: () {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty) {
                      _registerUser(dataRepository);
                    } else {
                      if (Platform.isIOS) {
                        iosShowAlertDialog(context,
                            title: "Verifiez les champs",
                            content:
                                "Verifiez bien que les champs email et password ont été correctement rempli avant de valider le formulaire de connexion",
                            defaultActionText: "OK");
                      } else {
                        showAlertDialog(context,
                            title: "Verifiez les champs",
                            content:
                                "Verifiez bien que les champs email et password ont été correctement rempli avant de valider le formulaire de connexion",
                            defaultActionText: "OK");
                      }
                    }
                  },
                  text: 'Connection',
                  btnColor: CustumTheme.orangeMainColor,
                  loading: dataRepository.isLoading),
              SizedBox(height: 20.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Pas encore de compte ?  ",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => const InscriptionScreen()));
                    },
                    child: const Text(
                      "Créer ici",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: CustumTheme.orangeMainColor),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle textFieldTextStyle() {
    return const TextStyle(
      color: CustumTheme.textColor,
      fontSize: 12,
      fontFamily: 'Isophan',
      fontWeight: FontWeight.w100,
      height: 0,
    );
  }
}
