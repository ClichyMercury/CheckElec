import 'package:check_elec/constant/custumTheme.dart';
import 'package:flutter/material.dart';

class StatHistory extends StatelessWidget {
  final String dateNumber;
  final String dateMonth;
  final String recharge;
  final String montant;
  const StatHistory({
    super.key,
    required this.dateNumber,
    required this.dateMonth,
    required this.recharge,
    required this.montant,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: 300,
      height: 95,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1.0, color: CustumTheme.orangeMainColor)),
      child: Column(
        children: [
          Row(
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '$dateNumber ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    TextSpan(
                      text: dateMonth,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    'Recharge :',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
              Text(
                '$recharge KWh',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    'Montant :',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ],
              ),
              Text(
                '$montant FCFA',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: CustumTheme.orangeMainColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w100,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
