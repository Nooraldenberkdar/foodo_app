import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodo_app/controllers/restaurants_controller.dart';
import 'package:foodo_app/data/respository/cart_repo.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:foodo_app/helper/routeHelper.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/popular_product_controller.dart';
import 'package:foodo_app/utilities/dimensions.dart';
import '../../utilities/constants.dart';
import '../../widgets/app_column.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/bigText.dart';
import '../../widgets/expandable_text.dart';

class MealPage extends StatelessWidget {
  int pageId;
  final String oldPage;
  MealPage({Key? key, required this.pageId, required this.oldPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RestaurantsController>().restaurantMeals[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());
    Get.lazyPut(() => CartController(cartRepo: Get.find<CartRepo>()));

    return Scaffold(
      body: GestureDetector(
        child: Stack(
          children: [
            //background image
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.infinity,
                height: Dimension.popularFoodImgSize,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(kBaseUrl + kUploadsMeals + product.img), // AssetImage('assets/images/food2.jpg'),
                  ),
                ),
              ),
            ),
            //icon images
            Positioned(
              left: Dimension.width20,
              right: Dimension.width20,
              top: Dimension.height50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                    ),
                  ),
                  GetBuilder<PopularProductController>(
                    builder: (popularProductController) {
                      return GestureDetector(
                        onTap: () {
                          if (popularProductController.totalItems >= 1) Get.toNamed(routeHelper.getCartPage(pageId));
                        },
                        child: Stack(
                          children: [
                            AppIcon(icon: Icons.shopping_cart_outlined),
                            popularProductController.totalItems >= 1
                                ? Positioned(
                                    right: 0,
                                    top: 0,
                                    child: AppIcon(
                                      icon: Icons.circle,
                                      size: Dimension.height20,
                                      iconColor: Colors.transparent,
                                      backgroundColor: kMainColor,
                                    ),
                                  )
                                : Container(),
                            Get.find<PopularProductController>().totalItems >= 1
                                ? Positioned(
                                    right: Dimension.height5,
                                    top: Dimension.height5,
                                    child: BigText(
                                      text: Get.find<PopularProductController>().totalItems.toString(),
                                      size: Dimension.width12,
                                      color: Colors.white,
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
            //introduction of food
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimension.popularFoodImgSize - Dimension.height20,
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
                    AppColumn(text: product.name),
                    SizedBox(
                      height: Dimension.height20,
                    ),
                    BigText(text: 'Introduce'),
                    SizedBox(
                      height: Dimension.height20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(text: product.description),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct) {
          return Container(
            height: Dimension.bottomHeightBar,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimension.radius20 * 2),
                topRight: Radius.circular(Dimension.radius20 * 2),
              ),
              color: kButtonBackgroundColor,
            ),
            padding: EdgeInsets.only(
              top: Dimension.height30,
              left: Dimension.width20,
              right: Dimension.width20,
              bottom: Dimension.height20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(Dimension.height20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(Dimension.radius20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(
                          Icons.remove,
                          color: kSignColor,
                          size: Dimension.iconSize25,
                        ),
                      ),
                      SizedBox(
                        width: Dimension.width5,
                      ),
                      BigText(text: popularProduct.inCartItems.toString()),
                      SizedBox(
                        width: Dimension.width5,
                      ),
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(
                          Icons.add,
                          color: kSignColor,
                          size: Dimension.iconSize25,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    popularProduct.addItem(product);
                  },
                  child: Container(
                    padding: EdgeInsets.all(Dimension.height20),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimension.radius20), color: kMainColor),
                    child: BigText(
                      text: ' ${product.price} SYP | Add to cart',
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
