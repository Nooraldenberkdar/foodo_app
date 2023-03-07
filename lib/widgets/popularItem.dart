import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:foodo_app/utilities/dimensions.dart';
import '../utilities/constants.dart';
import 'package:foodo_app/helper/routeHelper.dart';
import 'app_column.dart';

class PopularItem extends StatelessWidget {
  late int index;
  ImageProvider image;
  String h1;
  PopularItem({Key? key, required this.index, required this.image, required this.h1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // buildPageItem(int index, ProductModel popularProduct) {
    return Stack(
      children: [
        GestureDetector(
          child: Container(
            height: Dimension.pageViewContainer,
            margin: EdgeInsets.only(left: 1, right: 1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(Dimension.radius30),
              ),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: image,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimension.pageViewTextContainer,
            margin: EdgeInsets.only(left: Dimension.width30, right: Dimension.width30, bottom: Dimension.height30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(Dimension.radius30),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFe8e8e8),
                  blurRadius: 4.0,
                  offset: Offset(0, Dimension.height5), // (x axis, y axis) so 5 pixel down on y axis
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.only(top: Dimension.height15, left: Dimension.width15, right: Dimension.width15),
              child: AppColumn(
                text: h1,
              ),
            ),
          ),
        )
      ],
    );
  }
}
