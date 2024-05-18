import 'dart:io' show Platform;
import 'package:check_elec/screens/connection/connection.dart';
import 'package:check_elec/screens/pages/enregistrementCompteur.dart';
import 'package:check_elec/widgets/MainButton.dart';
import 'package:check_elec/widgets/alertDialog.dart';
import 'package:check_elec/widgets/iosAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:check_elec/constant/custumTheme.dart';

class InscriptionScreen extends StatefulWidget {
  const InscriptionScreen({
    super.key,
  });

  @override
  State<InscriptionScreen> createState() => _InscriptionScreenState();
}

class _InscriptionScreenState extends State<InscriptionScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObs = false;
  bool isLoading = false;
  bool isPolicyAccepted = false;

  FocusNode nameFocusNode = FocusNode();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
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
              SizedBox(height: height / 11),
              Image.asset(
                'assets/images/logo_whitout_bg.PNG',
              ),
              Text(
                'Inscription',
                style: TextStyle(fontSize: width / 10),
              ),
              SizedBox(height: height / 25.5),
              TextField(
                showCursor: true,
                focusNode: nameFocusNode,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                controller: nameController,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.person,
                    color: CustumTheme.orangeMainColor,
                  ),
                  enabled: true,
                  //errorText: "Email error",
                  label: Text(
                    'Nom',
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
                focusNode: firstNameFocusNode,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                controller: firstNameController,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.person,
                    color: CustumTheme.orangeMainColor,
                  ),
                  enabled: true,
                  //errorText: "Email error",
                  label: Text(
                    'Prenom',
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
                focusNode: phoneFocusNode,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                controller: phoneController,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: CustumTheme.orangeMainColor,
                  ),
                  enabled: true,
                  //errorText: "Email error",
                  label: Text(
                    'contact',
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
                  prefixIcon: const Icon(
                    Icons.password,
                    color: CustumTheme.orangeMainColor,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        isObs = !isObs;
                      });
                    },
                    child: isObs
                        ? const Icon(
                            Icons.visibility,
                            color: CustumTheme.orangeMainColor,
                          )
                        : const Icon(
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
              SizedBox(height: 10),
              Row(
                children: [
                  Checkbox(
                    activeColor: CustumTheme.orangeMainColor,
                    value: isPolicyAccepted,
                    onChanged: (value) {
                      setState(() {
                        isPolicyAccepted = value!;
                      });
                    },
                  ),
                  const Text(
                    "Accepter les conditions d'utilisations",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Mainbutton(
                  onTap: () {
                    if (emailController.text.isNotEmpty &&
                        passwordController.text.isNotEmpty &&
                        nameController.text.isNotEmpty &&
                        firstNameController.text.isNotEmpty &&
                        phoneController.text.isNotEmpty) {
                      if (isPolicyAccepted) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) =>
                                    const EnregistrementCompteurScreen()));
                      }
                    } else {
                      if (Platform.isIOS) {
                        iosShowAlertDialog(context,
                            title: "Verifiez les champs",
                            content:
                                "Verifiez bien que Tous les champs ont été correctement rempli avant de valider le formulaire d'inscription",
                            defaultActionText: "OK");
                      } else {
                        showAlertDialog(context,
                            title: "Verifiez les champs",
                            content:
                                "Verifiez bien que Tous les champs ont été correctement rempli avant de valider le formulaire d'inscription",
                            defaultActionText: "OK");
                      }
                    }
                  },
                  text: 'Inscription',
                  btnColor: isPolicyAccepted
                      ? CustumTheme.orangeMainColor
                      : CustumTheme.orangeMainColor.withOpacity(0.3),
                  loading: isLoading),
              SizedBox(height: 20.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Déjà un compte ?  ",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => const ConnectionScreen()));
                    },
                    child: const Text(
                      "Connectez-vous ici",
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
