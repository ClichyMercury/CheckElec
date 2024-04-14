import 'package:flutter/material.dart';
import 'package:check_elec/constant/custumTheme.dart';

class Notifications extends StatefulWidget {
  const Notifications({
    super.key,
  });

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
                  "Notifications",
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
              Center(
                child: Image.asset(
                  "assets/icons/remider.png",
                  height: MediaQuery.of(context).size.height / 2.5,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Vous n’avez aucune notification',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF9B9B9B),
                  fontSize: 15,
                  fontWeight: FontWeight.w100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
