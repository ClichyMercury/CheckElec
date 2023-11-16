import 'package:flutter/material.dart';
import 'package:check_elec/constant/custumTheme.dart';

class Settings extends StatefulWidget {
  const Settings({
    super.key,
  });

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
                padding: const EdgeInsets.only(right: 25),
                child: Text(
                  "Mes paramètres",
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
              Row(
                children: [
                  const Text(
                    'Partage',
                    style: TextStyle(
                      color: Color(0xFF9B9B9B),
                      fontSize: 15,
                      fontFamily: 'Isophan',
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  Container()
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 75,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/icons/share.png'),
                      Text(
                        'Inviter un ami à utiliser Metter Manager',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: CustumTheme.textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    'Assistance',
                    style: TextStyle(
                      color: Color(0xFF9B9B9B),
                      fontSize: 15,
                      fontFamily: 'Isophan',
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  Container()
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 150,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/icons/support.png'),
                          Text(
                            'Contacter le service support',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: CustumTheme.textColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset('assets/icons/reset password.png'),
                          Text(
                            'Réinitialiser mon mot de passe',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: CustumTheme.textColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 100),
              Container(
                height: 75,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/icons/logout.png'),
                          Text(
                            'Se deconnecter',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: CustumTheme.textColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '(Compteur 37154939526)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF9B9B9B),
                          fontSize: 12,
                          fontWeight: FontWeight.w100,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
