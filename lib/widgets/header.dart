import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodo_app/utilities/dimensions.dart';
import 'package:foodo_app/widgets/smallText.dart';

import '../utilities/constants.dart';
import 'bigText.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimension.height15),
      padding: EdgeInsets.symmetric(horizontal: Dimension.width20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              BigText(
                text: 'Syria',
                color: kMainColor,
                size: Dimension.height30,
              ),
              Row(
                children: [
                  SmallText(
                    text: 'city',
                    color: Colors.black54,
                  ),
                  Icon(Icons.arrow_drop_down_rounded)
                ],
              )
            ],
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: kMainColor,
                  borderRadius: BorderRadius.circular(Dimension.radius15),
                ),
                width: Dimension.width50,
                height: Dimension.height50,
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: Dimension.iconSize25,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
