import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodo_app/controllers/restaurants_controller.dart';
import 'package:foodo_app/helper/routeHelper.dart';
import 'package:foodo_app/widgets/header.dart';
import 'package:foodo_app/utilities/dimensions.dart';
import 'package:foodo_app/widgets/recommendedItem.dart';
import 'package:foodo_app/widgets/restaurantItem.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../utilities/constants.dart';
import '../../widgets/bigText.dart';
import '../../widgets/icon_text_widget.dart';
import '../../widgets/smallText.dart';
import '../../widgets/popularItem.dart';

class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({Key? key}) : super(key: key);

  @override
  State<RestaurantsPage> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: Dimension.width30,
                        bottom: Dimension.height20,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BigText(
                            text: 'Restaurants',
                            size: Dimension.width30,
                          ),
                        ],
                      ),
                    ),
                    GetBuilder<RestaurantsController>(
                      builder: (restaurantsController) {
                        return restaurantsController.rListIsLoaded
                            ? ListView.builder(
                                physics: NeverScrollableScrollPhysics(), // to make all page comeback togother
                                shrinkWrap: true, //to solve (put listview inside column error)
                                itemCount: restaurantsController.restaurantsList.length > 1 ? restaurantsController.restaurantsList.length : 1,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      //Get.find<RestaurantsController>().getRestaurantMeals(restaurantsController.restaurantsList[index].id);
                                      Get.toNamed(routeHelper.getRestaurantPage(index, "restaurants"));
                                    },
                                    child: RestaurantItem(
                                      image: NetworkImage(kBaseUrl + kUploadsRestaurants + restaurantsController.restaurantsList[index].img),
                                      h1: restaurantsController.restaurantsList[index].name,
                                      index: index,
                                      // description: "Description",
                                    ),
                                  );
                                },
                              )
                            : CircularProgressIndicator(
                                color: kMainColor,
                              );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
