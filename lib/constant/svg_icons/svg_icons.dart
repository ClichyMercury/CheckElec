import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum SvgIcons {
  calendar,
  history,
  home,
  nineSquareicon,
  profile,
  settings,
  statistics
}

Map<SvgIcons, String> svgLink = {
  SvgIcons.calendar: 'assets/svg/calendar.svg',
  SvgIcons.history: 'assets/svg/history.svg',
  SvgIcons.home: 'assets/svg/home.svg',
  SvgIcons.nineSquareicon: 'assets/svg/nineSquareicon.svg',
  SvgIcons.profile: 'assets/svg/profile.svg',
  SvgIcons.settings: 'assets/svg/settings.svg',
  SvgIcons.statistics: 'assets/svg/statistics.svg',
};

class SvgIcon extends StatelessWidget {
  final Color? color;
  final double size;
  final SvgIcons? icon;
  const SvgIcon({
    Key? key,
    this.color = Colors.black,
    this.size = 20,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return icon != null
        ? SizedBox(
            child: SvgPicture.asset(svgLink[icon]!, width: size, color: color),
          )
        : Container();
  }
}
