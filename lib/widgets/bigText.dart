import 'package:flutter/material.dart';
import 'package:foodo_app/utilities/dimensions.dart';

class BigText extends StatelessWidget {
  final String? text;
  Color? color;
  TextOverflow overFlow;
  double size;
  BigText({required this.text, this.color = const Color(0xFF332d2b), this.overFlow = TextOverflow.ellipsis, this.size = 0});
  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? Dimension.font20 : size,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      ),
      overflow: overFlow,
      maxLines: 1, //if the text overlow show me ...
    );
  }
}
