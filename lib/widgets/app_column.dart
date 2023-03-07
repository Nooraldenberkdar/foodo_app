import 'package:flutter/material.dart';
import 'package:foodo_app/widgets/smallText.dart';
import 'package:foodo_app/utilities/dimensions.dart';
import '../utilities/constants.dart';
import 'bigText.dart';
import 'icon_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  AppColumn({required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimension.font26,
        ),
        SizedBox(
          height: Dimension.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: kMainColor,
                  size: Dimension.iconSize15,
                ),
              ),
            ),
            SizedBox(
              width: Dimension.width10,
            ),
            SmallText(text: '4.5'),
            SizedBox(
              width: Dimension.width10,
            ),
            SmallText(text: '1287'),
            SizedBox(
              width: Dimension.width10,
            ),
            SmallText(text: 'comments')
          ],
        ),
        SizedBox(
          height: Dimension.height15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconTextWidget(icon: Icons.circle_sharp, text: 'normal', iconColor: kMainColor),
            IconTextWidget(icon: Icons.location_on, text: '1.7km', iconColor: kIconColor1),
            IconTextWidget(icon: Icons.access_time_rounded, text: '32m', iconColor: kMainColor),
          ],
        )
      ],
    );
  }
}
