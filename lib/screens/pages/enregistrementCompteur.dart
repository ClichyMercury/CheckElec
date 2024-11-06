import 'dart:ffi';

import 'package:check_elec/data/data_repository.dart';
import 'package:check_elec/models/compteurModel.dart';
import 'package:check_elec/screens/root.dart';
import 'package:check_elec/widgets/MainButton.dart';
import 'package:check_elec/widgets/alertDialog.dart';
import 'package:check_elec/widgets/iosAlertDialog.dart';
import 'package:flutter/material.dart';
import 'package:check_elec/constant/custumTheme.dart';
import 'package:provider/provider.dart';
import 'dart:io' show Platform;

import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class EnregistrementCompteurScreen extends StatefulWidget {
  EnregistrementCompteurScreen(
      {super.key,
      required this.createOrUpdate,
      required this.enableBack,
      this.compteur});

  final bool createOrUpdate;
  final bool enableBack;
  Compteur? compteur;

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
  void initState() {
    if (widget.createOrUpdate) {
      localController.text = widget.compteur!.typeLocal;
      comptNumberController.text = widget.compteur!.numeroCompteur;
      localisationController.text = widget.compteur!.localisation;
      frequencyController.text =
          widget.compteur!.frequenceMoyRechargement.toString();
      avarageAmoutController.text =
          widget.compteur!.montantMoyRechargement.toString();
    }
    super.initState();
  }

  Future<String?> _getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  Future<String?> _getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('accessToken');
  }

  Future<void> _createCompteur() async {
    setState(() {
      isLoading = true;
    });

    String? userId = await _getUserId();
    String? accessToken = await _getAccessToken();

    if (userId != null && accessToken != null) {
      Compteur newCompteur = Compteur(
        numeroCompteur: comptNumberController.text,
        localisation: localisationController.text,
        typeLocal: localController.text,
        frequenceMoyRechargement: int.parse(frequencyController.text),
        montantMoyRechargement: double.parse(avarageAmoutController.text),
        userId: userId,
      );

      DataRepository dataRepository =
          Provider.of<DataRepository>(context, listen: false);
      await dataRepository.createCompteur(newCompteur, accessToken);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Root()),
      );
    } else {
      if (Platform.isIOS) {
        iosShowAlertDialog(context,
            title: "Erreur",
            content:
                "Impossible de récupérer l'ID de l'utilisateur ou le token.",
            defaultActionText: "OK");
      } else {
        showAlertDialog(context,
            title: "Erreur",
            content:
                "Impossible de récupérer l'ID de l'utilisateur ou le token.",
            defaultActionText: "OK");
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> _updateCompteur(String compteurId) async {
    setState(() {
      isLoading = true;
    });

    String? userId = await _getUserId();
    String? accessToken = await _getAccessToken();

    if (userId != null && accessToken != null) {
      // Crée un objet Compteur avec les nouvelles données
      Compteur updatedCompteur = Compteur(
        numeroCompteur: comptNumberController.text,
        localisation: localisationController.text,
        typeLocal: localController.text,
        frequenceMoyRechargement: int.parse(frequencyController.text),
        montantMoyRechargement: double.parse(avarageAmoutController.text),
        userId: userId,
      );

      // Appelle la méthode updateCompteur dans le DataRepository
      DataRepository dataRepository =
          Provider.of<DataRepository>(context, listen: false);
      await dataRepository.updateCompteur(
          compteurId, updatedCompteur, accessToken);

      // Redirige vers la page principale après la mise à jour
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Root()),
      );
      await dataRepository.fetchUserCompteurs(userId, accessToken);
    } else {
      // Affiche une alerte si l'ID utilisateur ou le token est introuvable
      if (Platform.isIOS) {
        iosShowAlertDialog(context,
            title: "Erreur",
            content:
                "Impossible de récupérer l'ID de l'utilisateur ou le token.",
            defaultActionText: "OK");
      } else {
        showAlertDialog(context,
            title: "Erreur",
            content:
                "Impossible de récupérer l'ID de l'utilisateur ou le token.",
            defaultActionText: "OK");
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: CustumTheme.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if (widget.enableBack)
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back_ios_new)),
                      SizedBox(width: 10),
                      Text(
                        "Retour",
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                SizedBox(
                    height: widget.enableBack ? height / 25 : height / 5.5),
                Text(
                  widget.createOrUpdate
                      ? 'Modification du compteur'
                      : 'Enregistrement du compteur',
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
                    onTap: () async {
                      if (localController.text.isNotEmpty &&
                          comptNumberController.text.isNotEmpty &&
                          localController.text.isNotEmpty &&
                          frequencyController.text.isNotEmpty &&
                          avarageAmoutController.text.isNotEmpty) {
                        await widget.createOrUpdate
                            ? _updateCompteur(widget.compteur!.compteurId!)
                            : _createCompteur();
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
