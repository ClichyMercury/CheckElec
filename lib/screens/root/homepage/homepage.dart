import 'package:check_elec/constant/custumTheme.dart';
import 'package:check_elec/screens/pages/notifications.dart';
import 'package:check_elec/screens/pages/previsions.dart';
import 'package:check_elec/screens/pages/rechargeScreen.dart';
import 'package:check_elec/screens/pages/releveCompteur.dart';
import 'package:check_elec/screens/root/homepage/widgets/ServicesCard.dart';
import 'package:check_elec/screens/pages/settings.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color(0xffF3F2F7),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Settings()));
            },
            splashColor: CustumTheme.orangeMainColor.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Image.asset("assets/icons/settings.png"),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Notifications()));
              },
              splashColor: Colors.orange.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Image.asset("assets/icons/notifications.png"),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: height / 18,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Compteur',
                            style: TextStyle(
                              color: Color(0xFF3D3D3D),
                              fontSize: width / 32,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Text(
                            '37154939526',
                            style: TextStyle(
                              color: Color(0xFF3D3D3D),
                              fontSize: width / 32,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  height: width / 2.2,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  child: Column(
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '23.92 KWh\n',
                              style: TextStyle(
                                color: CustumTheme.orangeMainColor,
                                fontSize: width / 7.5,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            TextSpan(
                              text: '≈',
                              style: TextStyle(
                                color: CustumTheme.orangeMainColor,
                                fontSize: width / 20,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Dernier rechargement',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: CustumTheme.textColor,
                              fontSize: width / 32,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Text(
                            'Le 01/06/2023',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: CustumTheme.textColor,
                              fontSize: width / 32,
                              fontWeight: FontWeight.w100,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: height / 10),
                const Text(
                  'Mes services',
                  style: TextStyle(
                    color: CustumTheme.textColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                const SizedBox(height: 25),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ServicesCard(
                          asset: "assets/icons/nineSquareIcon.png",
                          title: "Faire un \nrechargement",
                          widget: RechargeScreen()),
                      ServicesCard(
                          asset: "assets/icons/calendar.png",
                          title: "Voir mes \nprédictions",
                          widget: Previsions()),
                      ServicesCard(
                          asset: "assets/icons/history.png",
                          title: "Voir mon \nhistorique",
                          widget: ReleveCompteurScreen()),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
