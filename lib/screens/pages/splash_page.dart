import 'package:check_elec/constant/custumTheme.dart';
import 'package:check_elec/services/auth_helper.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    AuthHelper.handleUserRedirection(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo_whitout_bg.PNG',
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: CircularProgressIndicator(
              color: CustumTheme.orangeMainColor,
            ),
          ),
        ],
      ),
    );
  }
}
