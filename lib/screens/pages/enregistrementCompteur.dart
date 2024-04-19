import 'package:check_elec/screens/root.dart';
import 'package:check_elec/widgets/MainButton.dart';
import 'package:check_elec/widgets/alertDialog.dart';
import 'package:check_elec/widgets/iosAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:check_elec/constant/custumTheme.dart';
import 'dart:io' show Platform;

class EnregistrementCompteurScreen extends StatefulWidget {
  const EnregistrementCompteurScreen({
    super.key,
  });

  @override
  State<EnregistrementCompteurScreen> createState() =>
      _EnregistrementCompteurScreenState();
}

class _EnregistrementCompteurScreenState
    extends State<EnregistrementCompteurScreen> {
  TextEditingController localController = TextEditingController();
  TextEditingController comptNumberController = TextEditingController();
  TextEditingController localisationController = TextEditingController();
  TextEditingController frequencyController = TextEditingController();
  TextEditingController avarageAmoutController = TextEditingController();
  bool isObs = false;
  bool isLoading = false;

  FocusNode localFocusNode = FocusNode();
  FocusNode comptNumberFocusNode = FocusNode();
  FocusNode localisationFocusNode = FocusNode();
  FocusNode frequencyFocusNode = FocusNode();
  FocusNode avarageAmoutFocusNode = FocusNode();

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
              SizedBox(height: height / 6.5),
              Text(
                'Enregistrement\nCompteur',
                style: TextStyle(fontSize: width / 10),
              ),
              SizedBox(height: height / 25.5),
              TextField(
                showCursor: true,
                focusNode: localFocusNode,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                controller: localController,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.maps_home_work,
                    color: CustumTheme.orangeMainColor,
                  ),
                  enabled: true,
                  //errorText: "Email error",
                  label: Text(
                    'Type de local',
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
                focusNode: comptNumberFocusNode,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                controller: comptNumberController,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.computer,
                    color: CustumTheme.orangeMainColor,
                  ),
                  enabled: true,
                  //errorText: "Email error",
                  label: Text(
                    'Numéro du compteur',
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
                maxLines: 3,
                showCursor: true,
                focusNode: localisationFocusNode,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                controller: localisationController,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.location_city,
                    color: CustumTheme.orangeMainColor,
                  ),
                  enabled: true,
                  //errorText: "Email error",
                  label: Text(
                    'Localisation',
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
                focusNode: frequencyFocusNode,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                controller: frequencyController,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.network_cell,
                    color: CustumTheme.orangeMainColor,
                  ),
                  enabled: true,
                  //errorText: "Email error",
                  label: Text(
                    'Fréquence moyenne de rechargement',
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
                focusNode: avarageAmoutFocusNode,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                controller: avarageAmoutController,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.money,
                    color: CustumTheme.orangeMainColor,
                  ),
                  enabled: true,
                  //errorText: "Email error",
                  label: Text(
                    'Montant moyen de rechargement',
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
              SizedBox(height: 20.5),
              Mainbutton(
                  onTap: () {
                    if (localController.text.isNotEmpty &&
                        comptNumberController.text.isNotEmpty &&
                        localController.text.isNotEmpty &&
                        frequencyController.text.isNotEmpty &&
                        avarageAmoutController.text.isNotEmpty) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Root()));
                    } else {
                      if (Platform.isIOS) {
                        iosShowAlertDialog(context,
                            title: "Verifiez les champs",
                            content:
                                "Verifiez bien que Tous les champs ont été correctement rempli avant de valider le formulaire d'enregistrement des informations du compteur",
                            defaultActionText: "OK");
                      } else {
                        showAlertDialog(context,
                            title: "Verifiez les champs",
                            content:
                                "Verifiez bien que Tous les champs ont été correctement rempli avant de valider le formulaire d'enregistrement des informations du compteur",
                            defaultActionText: "OK");
                      }
                    }
                  },
                  text: 'Continuer',
                  btnColor: CustumTheme.orangeMainColor,
                  loading: isLoading),
              SizedBox(height: 20.5),
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
