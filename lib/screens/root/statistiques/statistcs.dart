import 'package:check_elec/constant/custumTheme.dart';
import 'package:check_elec/screens/settings.dart';
import 'package:check_elec/widgets/statHistory.dart';
import 'package:check_elec/widgets/timeSelection.dart';
import 'package:flutter/material.dart';

class MyStatistics extends StatefulWidget {
  const MyStatistics({
    super.key,
  });

  @override
  State<MyStatistics> createState() => _MyStatisticsState();
}

class _MyStatisticsState extends State<MyStatistics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF3F2F7),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Settings()));
                },
            splashColor: CustumTheme.orangeMainColor.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Image.asset("assets/icons/settings.png"),
            ),
          ),
          actions: [
            InkWell(
              splashColor: Colors.orange.withOpacity(0.2),
              child: Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Text(
                    "Statistiques",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                  child: Stack(
                    children: [
                      ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: const [
                          TimeSelector(data: "Janvier"),
                          TimeSelector(data: "Fevrier"),
                          TimeSelector(data: "Mars"),
                          TimeSelector(data: "Avril"),
                          TimeSelector(data: "Mai"),
                          TimeSelector(data: "Juin"),
                          TimeSelector(data: "Juillet"),
                          TimeSelector(data: "Aout"),
                          TimeSelector(data: "Septembre"),
                          TimeSelector(data: "Octobre"),
                          TimeSelector(data: "Novembre"),
                          TimeSelector(data: "Decembre"),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 45),
                Container(
                  width: double.infinity,
                  height: 150,
                  padding: const EdgeInsets.all(25),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        'Total des dépenses',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '7.502 F CFA',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Container(
                            width: 1,
                            color: CustumTheme.orangeMainColor,
                            height: 30,
                          ),
                          Text(
                            '62.16 KWh',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w100,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 45),
                Container(
                  width: double.infinity,
                  height: 300,
                  padding: const EdgeInsets.all(15),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        StatHistory(
                          dateNumber: '30',
                          dateMonth: 'JANVIER',
                          montant: '2000',
                          recharge: '25.65',
                        ),
                        StatHistory(
                          dateNumber: '30',
                          dateMonth: 'JANVIER',
                          montant: '2000',
                          recharge: '25.65',
                        ),
                        StatHistory(
                          dateNumber: '30',
                          dateMonth: 'JANVIER',
                          montant: '2000',
                          recharge: '25.65',
                        ),
                        StatHistory(
                          dateNumber: '30',
                          dateMonth: 'JANVIER',
                          montant: '2000',
                          recharge: '25.65',
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
