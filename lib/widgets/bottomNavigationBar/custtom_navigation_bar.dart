import 'package:check_elec/constant/svg_icons/svg_icons.dart';
import 'package:flutter/material.dart';

import 'navigation_bar_item.dart';

class CustomNavigationBar extends StatefulWidget {
  final Function(int) changeIndex;
  final int currentIndex;
  const CustomNavigationBar({
    Key? key,
    required this.changeIndex,
    required this.currentIndex,
  }) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 25),
          NavigationBarItem(
            icon: SvgIcons.home,
            text: 'Home',
            changeIndex: widget.changeIndex,
            index: 0,
            currentIndex: widget.currentIndex,
          ),
          NavigationBarItem(
            icon: SvgIcons.statistics,
            text: 'Statistics',
            changeIndex: widget.changeIndex,
            index: 1,
            currentIndex: widget.currentIndex,
          ),
          NavigationBarItem(
            icon: SvgIcons.profile,
            text: 'Mon Profil',
            changeIndex: widget.changeIndex,
            index: 2,
            currentIndex: widget.currentIndex,
          ),
          const SizedBox(width: 25),
        ],
      ),
    );
  }
}
