import 'package:check_elec/screens/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:check_elec/constant/custumTheme.dart';

class MyMyProlile extends StatefulWidget {
  const MyMyProlile({
    super.key,
  });

  @override
  State<MyMyProlile> createState() => _MyMyProlileState();
}

class _MyMyProlileState extends State<MyMyProlile> {
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
            splashColor: Colors.orange.withOpacity(0.2),
            child: const Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Text(
                  "Mon Profil",
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
                  CircleAvatar(
                    radius: height / 13,
                    backgroundColor: CustumTheme.orangeMainColor,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    height: height / 4.7,
                    width: width / 1.8,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'GAEL SASSAN',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: width / 18,
                              fontFamily: 'Isophan',
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Text(
                            '+225 07 68 70 73 74',
                            style: TextStyle(
                              color: CustumTheme.textColor,
                              fontSize: width / 30,
                              fontFamily: 'Isophan',
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Text(
                            'gaelelscientifico@gmail.com',
                            style: TextStyle(
                              color: CustumTheme.textColor,
                              fontSize: width / 30,
                              fontFamily: 'Isophan',
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Text(
                            'II Plateaux',
                            style: TextStyle(
                              color: CustumTheme.textColor,
                              fontSize: width / 30,
                              fontFamily: 'Isophan',
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                          Container(
                            width: 146,
                            height: 25,
                            decoration: ShapeDecoration(
                              color: Color(0xFF373736),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                            child: Center(
                                child: Text(
                              'inscrit depuis le 23/06/2023',
                              style: TextStyle(
                                color: Color(0xFFF3F2F7),
                                fontSize: 9,
                                fontFamily: 'Isophan',
                                fontWeight: FontWeight.w100,
                              ),
                            )),
                          )
                        ]),
                  )
                ],
              ),
              SizedBox(
                height: 35,
              ),
              Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                height: 350,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '  Informations sur l’habitat',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Isophan',
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8.0),
                        color: CustumTheme.orangeMainColor,
                        height: 1,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Studio',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Isophan',
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Studio',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Isophan',
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Studio',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Isophan',
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Studio',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Isophan',
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Studio',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Isophan',
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Studio',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Isophan',
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Studio',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Isophan',
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                'Studio',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Isophan',
                                  fontWeight: FontWeight.w100,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
