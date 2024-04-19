import 'package:flutter/material.dart';

class FloatingActionMainButton extends StatelessWidget {
  const FloatingActionMainButton({
    super.key,
    required this.color,
    required this.title,
  });

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 61,
        decoration: ShapeDecoration(
          color: color,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w100,
              height: 0,
            ),
          ),
        ),
      ),
    );
  }
}
