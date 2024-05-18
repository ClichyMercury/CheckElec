import 'package:flutter/material.dart';

class FloatingActionMainButton extends StatelessWidget {
  const FloatingActionMainButton({
    super.key,
    required this.color,
    required this.title, required this.ontap,
  });

  final Color color;
  final String title;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
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
