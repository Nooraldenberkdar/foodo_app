import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodo_app/controllers/cart_controller.dart';
import 'package:foodo_app/controllers/restaurants_controller.dart';
import 'package:foodo_app/helper/dependencies.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:foodo_app/utilities/dimensions.dart';
import 'package:foodo_app/helper/routeHelper.dart';
import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../utilities/constants.dart';
import '../../widgets/app_column.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/bigText.dart';
import '../../widgets/expandable_text.dart';
import '../../widgets/recommendedItem.dart';

class RestaurantPage extends StatelessWidget {
  int pageId;
  final String oldPage;
  RestaurantPage({Key? key, required this.pageId, required this.oldPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var restaurant = Get.find<RestaurantsController>().restaurantsList[pageId];
    Get.find<RestaurantsController>().getRestaurantMeals(Get.find<RestaurantsController>().restaurantsList[pageId].id);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                //color: Colors.red,
                width: double.infinity,
                height: Dimension.screenHeight / 6,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(kBaseUrl + kUploadsRestaurants + restaurant.img), // AssetImage('assets/images/food2.jpg'),
                  ),
                ),
              ),
            ),
            Positioned(
              left: Dimension.width20,
              right: Dimension.width20,
              top: Dimension.height15,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GetBuilder<PopularProductController>(builder: (popularProductController) {
                    return GestureDetector(
                      onTap: () {
                        if (Get.find<PopularProductController>().totalItems == 0) {
                          Get.toNamed(routeHelper.getInitial("1"));
                        } else {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.warning,
                            animType: AnimType.topSlide,
                            showCloseIcon: true,
                            title: "warning",
                            desc: "You have items in Cart, do you want to remove them!",
                            btnOkText: "yes",
                            btnOkOnPress: () {
                              popularProductController.clearCart();
                              Get.toNamed(routeHelper.getInitial("1"));
                            },
                            btnCancelOnPress: () {},
                          ).show();
                        }
                      },
                      child: AppIcon(
                        icon: Icons.arrow_back_ios,
                        size: Dimension.width50,
                        iconSize: Dimension.width30 - Dimension.width5,
                      ),
                    );
                  }),
                  GetBuilder<PopularProductController>(builder: (popularProductController) {
                    return GestureDetector(
                      onTap: () {
                        if (popularProductController.totalItems >= 1) Get.toNamed(routeHelper.getCartPage(pageId));
                      },
                      child: GetBuilder<CartController>(
                        builder: (cartController) {
                          return AppIcon(
                              icon: Icons.shopping_cart_outlined,
                              size: Dimension.width50,
                              iconSize: Dimension.width30 - Dimension.width5,
                              iconColor: cartController.totalItems == 0 ? const Color(0xFF756d54) : Colors.green);
                        },
                      ),
                    );
                  })
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimension.screenHeight / 6 - Dimension.height15,
              child: Container(
                padding: EdgeInsets.only(
                  left: Dimension.width20,
                  right: Dimension.width20,
                  top: Dimension.height30,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Dimension.radius20),
                    topLeft: Radius.circular(Dimension.radius20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: BigText(
                        text: restaurant.name,
                      ),
                    ),
                    SizedBox(
                      height: Dimension.height20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(child: GetBuilder<RestaurantsController>(
                        builder: (restaurantController) {
                          return restaurantController.rMealsIsLoaded
                              ? ListView.builder(
                                  physics: NeverScrollableScrollPhysics(), // to make all page comeback togother
                                  shrinkWrap: true, //to solve (put listview inside column error)
                                  itemCount: restaurantController.restaurantMeals.length > 1 ? restaurantController.restaurantMeals.length : 1,
                                  itemBuilder: (context, index) {
                                    return (index >= 0)
                                        ? GestureDetector(
                                            onTap: () {
                                              Get.toNamed(routeHelper.getMealPage(index, "restaurant"));
                                            },
                                            child: RecommendedItem(
                                              image: NetworkImage(kBaseUrl + kUploadsMeals + restaurantController.restaurantMeals[index].img!),
                                              h1: restaurantController.restaurantMeals[index].name,
                                              description: 'description',
                                              index: index,
                                            ),
                                          )
                                        : Container();
                                  })
                              : Center(
                                  child: CircularProgressIndicator(
                                    color: kMainColor,
                                  ),
                                );
                        },
                      )),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
