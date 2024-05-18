import 'package:check_elec/widgets/FloatingMainButton.dart';
import 'package:check_elec/widgets/datePicker.dart';
import 'package:check_elec/widgets/timePicker.dart';
import 'package:flutter/material.dart';
import 'package:check_elec/constant/custumTheme.dart';

class ReleveCompteurScreen extends StatefulWidget {
  const ReleveCompteurScreen({
    super.key,
  });

  @override
  State<ReleveCompteurScreen> createState() => _ReleveCompteurScreenState();
}

class _ReleveCompteurScreenState extends State<ReleveCompteurScreen> {
  TextEditingController energyValue = TextEditingController();
  TextEditingController rechargeValue = TextEditingController();
  TextEditingController newRechargeValue = TextEditingController();

  FocusNode energyValueFocus = FocusNode();
  FocusNode rechargeValueFocus = FocusNode();
  FocusNode newRechargeValueFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustumTheme.bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          splashColor: CustumTheme.orangeMainColor.withOpacity(0.2),
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset("assets/icons/back.png")),
          ),
        ),
        actions: [
          InkWell(
            splashColor: CustumTheme.orangeMainColor.withOpacity(0.2),
            child: const Padding(
                padding: EdgeInsets.only(right: 25),
                child: Text(
                  "Releve du compteur",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 55),
              TextField(
                showCursor: true,
                focusNode: energyValueFocus,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                controller: energyValue,
                decoration: InputDecoration(
                  label: Text(
                    'Valeur energétique disponible au compteur',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.50)),
                      //recuperation en string à gerer
                      child: DatePickerWidget()),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors.black),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.50)),
                      //recuperation en string à gerer.

                      child: TimePickerWidget()),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionMainButton(
        ontap: () {},
        title: "Enregistrer",
        color: CustumTheme.orangeMainColor,
      ),
    );
  }

  TextStyle textFieldTextStyle() {
    return const TextStyle(
      color: CustumTheme.textColor,
      fontSize: 12,
      fontWeight: FontWeight.w100,
      height: 0,
    );
  }
}
