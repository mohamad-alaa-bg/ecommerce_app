import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;

  // final String fontFamily;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final double height;

  CustomText({
    this.text = '',
    //this.fontFamily = '',
    this.fontSize = 16,
    this.color = Colors.black,
    this.alignment = Alignment.topLeft,
    this.height = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          // fontFamily: fontFamily,
          color: color,
          height: height,
        ),
      ),
    );
  }
}
