import 'package:check_elec/constant/custumTheme.dart';
import 'package:check_elec/settings.dart';
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Settings()));
                  },
                  child: Image.asset("assets/icons/settings.png")),
            ),
          ),
          actions: [
            InkWell(
              splashColor: Colors.orange.withOpacity(0.2),
              child: Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Image.asset("assets/icons/notifications.png"),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9)),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Compteur',
                            style: TextStyle(
                              color: Color(0xFF3D3D3D),
                              fontSize: 11,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Text(
                            '37154939526',
                            style: TextStyle(
                              color: Color(0xFF3D3D3D),
                              fontSize: 11,
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
                  height: 200,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                  child: const Column(
                    children: [
                      SizedBox(height: 15),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '23.92 KWh\n',
                              style: TextStyle(
                                color: CustumTheme.orangeMainColor,
                                fontSize: 45,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                            TextSpan(
                              text: '≈',
                              style: TextStyle(
                                color: CustumTheme.orangeMainColor,
                                fontSize: 24,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dernier rechargement',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: CustumTheme.textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Text(
                            'Le 01/06/2023',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: CustumTheme.textColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w100,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                const Text(
                  'Mes services',
                  style: TextStyle(
                    color: CustumTheme.textColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w100,
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    servicesCard("assets/icons/nineSquareIcon.png",
                        "Faire un \nrechargement"),
                    servicesCard(
                        "assets/icons/calendar.png", "Voir mes \nprédictions"),
                    servicesCard(
                        "assets/icons/history.png", "Voir mon \nhistorique"),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  Column servicesCard(String asset, title) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: 100,
          height: 122,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
          ),
          child: Image.asset(asset),
        ),
        const SizedBox(height: 2.5),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w100,
          ),
        )
      ],
    );
  }
}
