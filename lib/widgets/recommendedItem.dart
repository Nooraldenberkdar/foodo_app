import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodo_app/utilities/dimensions.dart';
import 'package:foodo_app/widgets/smallText.dart';

import '../utilities/constants.dart';
import 'bigText.dart';
import 'icon_text_widget.dart';

class RecommendedItem extends StatelessWidget {
  final ImageProvider image;
  final String h1;
  final String description;
  late int index;
  RecommendedItem({Key? key, required this.image, required this.h1, required this.description, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimension.width20,
        right: Dimension.width20,
        bottom: Dimension.height20,
      ),
      child: Row(
        children: [
          Container(
            width: Dimension.listViewImgSize,
            height: Dimension.listViewImgSize,
            decoration: BoxDecoration(
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              borderRadius: BorderRadius.circular(Dimension.radius20),
              // color: Colors.white38,
              image: DecorationImage(fit: BoxFit.cover, image: image),
            ),
          ),
          Expanded(
            child: Container(
              height: Dimension.listViewTextCon + Dimension.height5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimension.radius20),
                  bottomRight: Radius.circular(Dimension.radius20),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: Dimension.width10,
                  right: Dimension.width10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: h1),
                    SizedBox(
                      height: Dimension.height10,
                    ),
                    SmallText(text: description),
                    SizedBox(
                      height: Dimension.height10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconTextWidget(icon: Icons.circle_sharp, text: 'normal', iconColor: kIconColor1),
                        IconTextWidget(icon: Icons.location_on, text: '1.7km', iconColor: kMainColor),
                        IconTextWidget(icon: Icons.access_time_rounded, text: '32m', iconColor: kIconColor2),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
