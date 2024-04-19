import 'package:check_elec/screens/root/homepage/homepage.dart';
import 'package:check_elec/screens/root/statistiques/statistcs.dart';
import 'package:check_elec/widgets/bottomNavigationBar/custtom_navigation_bar.dart';
import 'package:check_elec/screens/root/profil/profil.dart';
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  const Root({
    Key? key,
  }) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int index = 0;

  int currentIndex = 0;

  final screens = const [MyHomePage(), MyStatistics(), MyMyProlile()];

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: SafeArea(
        child: CustomNavigationBar(
          changeIndex: changeIndex,
          currentIndex: currentIndex,
        ),
      ),
    );
  }
}
