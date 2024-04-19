import 'package:check_elec/screens/connection/inscription.dart';
import 'package:check_elec/screens/root.dart';
import 'package:check_elec/widgets/MainButton.dart';
import 'package:check_elec/widgets/alertDialog.dart';
import 'package:check_elec/widgets/iosAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:check_elec/constant/custumTheme.dart';
import 'dart:io' show Platform;

class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({
    super.key,
  });

  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passxordController = TextEditingController();
  bool isObs = false;
  bool isLoading = false;

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CustumTheme.bgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: height / 4.0),
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
                controller: passxordController,
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
                        passxordController.text.isNotEmpty) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Root()));
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
                  loading: isLoading),
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
