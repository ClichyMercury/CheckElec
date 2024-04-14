import 'package:check_elec/widgets/datePicker.dart';
import 'package:check_elec/widgets/timePicker.dart';
import 'package:flutter/material.dart';
import 'package:check_elec/constant/custumTheme.dart';

class RechargeScreen extends StatefulWidget {
  const RechargeScreen({
    super.key,
  });

  @override
  State<RechargeScreen> createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {
  TextEditingController energyValue = TextEditingController();
  TextEditingController rechargeValue = TextEditingController();
  TextEditingController newRechargeValue = TextEditingController();

  FocusNode energyValueFocus = FocusNode();
  FocusNode rechargeValueFocus = FocusNode();
  FocusNode newRechargeValueFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F2F7),
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
            splashColor: Colors.orange.withOpacity(0.2),
            child: const Padding(
                padding: EdgeInsets.only(right: 25),
                child: Text(
                  "Bulletin de rechargement",
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
                  label: const Text(
                    'Valeur energétique disponible au compteur',
                    style: TextStyle(
                      color: Color(0xFF6C6C6C),
                      fontSize: 12,
                      fontFamily: 'Isophan',
                      fontWeight: FontWeight.w100,
                      height: 0,
                    ),
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
                focusNode: rechargeValueFocus,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                controller: rechargeValue,
                decoration: InputDecoration(
                  label: const Text(
                    'Montant de la nouvelle recharge',
                    style: TextStyle(
                      color: Color(0xFF6C6C6C),
                      fontSize: 12,
                      fontFamily: 'Isophan',
                      fontWeight: FontWeight.w100,
                      height: 0,
                    ),
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
                focusNode: newRechargeValueFocus,
                textInputAction: TextInputAction.next,
                autocorrect: false,
                textAlignVertical: TextAlignVertical.center,
                keyboardType: TextInputType.number,
                controller: newRechargeValue,
                decoration: InputDecoration(
                  label: const Text(
                    'Valeur energetique de la nouvelle recharge',
                    style: TextStyle(
                      color: Color(0xFF6C6C6C),
                      fontSize: 12,
                      fontFamily: 'Isophan',
                      fontWeight: FontWeight.w100,
                      height: 0,
                    ),
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
      floatingActionButton: GestureDetector(
        onTap: () {},
        child: Container(
          height: 61,
          decoration: ShapeDecoration(
            color: Color(0xFFF28D20),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
          ),
          child: Center(
            child: Text(
              'Enregistrer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Isophan',
                fontWeight: FontWeight.w100,
                height: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}