import 'package:flutter/material.dart';

class ServicesCard extends StatelessWidget {
  const ServicesCard(
      {super.key,
      required this.asset,
      required this.title,
      required this.widget});

  final String asset, title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => widget));
          },
          splashColor: Colors.orange.withOpacity(0.2),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            width: width / 3.5,
            height: height / 7,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9)),
            ),
            child: Image.asset(asset),
          ),
        ),
        const SizedBox(height: 2.5),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: width / 30,
            fontWeight: FontWeight.w100,
          ),
        )
      ],
    );
  }
}
