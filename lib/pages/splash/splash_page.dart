import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodo_app/controllers/cart_controller.dart';
import 'package:foodo_app/helper/routeHelper.dart';
import 'package:foodo_app/pages/login/login_page.dart';
import 'package:foodo_app/utilities/dimensions.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../data/api/api_client.dart';
import '../../utilities/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      //is the duration from init the page until go to initial
      Duration(seconds: 4),
      () async {
        SharedPreferences x = await SharedPreferences.getInstance();
        String? y = await x.getString(kToken);
        if (y != null) {
          Get.toNamed(routeHelper.getInitial("0"));
        } else {
          Get.toNamed(routeHelper.getLogin());
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/splash_screen.gif',
                width: Dimension.screenWidth / 1.5,
              ),
              Image.asset(
                'assets/images/foodo.png',
                width: Dimension.screenWidth / 2,
              )
            ],
          ),
        ));
  }
}
