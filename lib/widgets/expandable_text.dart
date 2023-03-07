import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:foodo_app/utilities/constants.dart';
import 'package:foodo_app/utilities/dimensions.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  ExpandableTextWidget({required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  @override
  Widget build(BuildContext context) {
    return ExpandableText(
      widget.text,
      expandText: 'show more',
      collapseText: 'show less',
      maxLines: Dimension.textHeight > 151 ? 5 : 2,
      style: TextStyle(
        fontSize: Dimension.font20,
        color: kParaColor,
      ),
    );
  }
}
