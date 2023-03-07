import 'package:flutter/material.dart';
import 'package:foodo_app/utilities/dimensions.dart';

class SmallText extends StatelessWidget {
  final String? text;
  Color? color;
  double height;
  double size;
  SmallText({required this.text, this.color = const Color(0xFFccc7c5), this.size = 0, this.height = 2});
  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(color: color, height: height, fontSize: size == 0 ? Dimension.font12 : size, fontWeight: FontWeight.w400, fontFamily: 'Roboto'),
    );
  }
}
