import 'package:check_elec/constant/custumTheme.dart';
import 'package:flutter/material.dart';

bool isSelected = false;

class TimeSelector extends StatefulWidget {
  const TimeSelector({super.key, required this.data});

  final String data;

  @override
  State<TimeSelector> createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        width: 100,
        decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: CustumTheme.orangeMainColor),
            color: isSelected
                ? CustumTheme.orangeMainColor
                : CustumTheme.orangeMainColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: Text(
          widget.data,
          style: TextStyle(
              color: isSelected ? Colors.white : CustumTheme.orangeMainColor),
        )),
      ),
    );
  }
}
