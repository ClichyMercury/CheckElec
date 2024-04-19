import 'package:check_elec/widgets/loader.dart';
import 'package:flutter/material.dart';

class Mainbutton extends StatelessWidget {
  final Function() onTap;
  final String text;
  final String? image;
  final Color? txtColor;
  final Color btnColor;
  final bool loading;
  const Mainbutton({
    Key? key,
    required this.onTap,
    required this.text,
    this.image,
    this.txtColor,
    required this.btnColor,
    required this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: loading ? null : onTap,
      behavior: HitTestBehavior
          .translucent, // Permet de détecter le geste même sur la zone de l'effet visuel
      child: Container(
        height: 61,
        decoration: ShapeDecoration(
          color: btnColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (image != null)
              Image.asset(
                'assets/images/$image',
                height: 25.0,
                width: 60.0,
              ),
            loading
                ? const Loader()
                : Text(text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Isophan',
                      fontWeight: FontWeight.w100,
                      height: 0,
                    ))
          ],
        ),
      ),
    );
  }
}
