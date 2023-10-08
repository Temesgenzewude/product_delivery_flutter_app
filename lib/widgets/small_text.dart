import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  double height;

  SmallText({
    Key? key,
    this.height = 1.2,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        height: height,
        color: color,
        fontFamily: "Roboto",
        fontSize: size,
      ),
    );
  }
}
