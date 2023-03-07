import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:foodo_app/controllers/cart_controller.dart';
import 'package:foodo_app/controllers/popular_product_controller.dart';
import 'package:foodo_app/helper/routeHelper.dart';
import 'package:foodo_app/utilities/constants.dart';
import 'package:foodo_app/utilities/dimensions.dart';
import 'package:foodo_app/widgets/app_icon.dart';
import 'package:foodo_app/widgets/bigText.dart';
import 'package:get/get.dart';
import '../../controllers/history_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../widgets/smallText.dart';

class CartPage extends StatelessWidget {
  var pageId;
  CartPage({this.pageId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: Dimension.width20,
            right: Dimension.width20,
            top: Dimension.height20 * 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (Get.find<PopularProductController>().totalItems == 0) {
                      // Get.toNamed(routeHelper.getInitial("0"));
                      Get.find<PopularProductController>().clearCart();
                      Navigator.pop(context);
                    } else {
                      Get.snackbar(
                        "warnning! 🙅",
                        "you cant leave , check out or cancel your order",
                        backgroundColor: kMainColor,
                        colorText: Colors.white,
                      );
                    }
                  },
                  child: GetBuilder<CartController>(
                    builder: (cartController) {
                      return AppIcon(
                        icon: Icons.arrow_back,
                        iconColor: Colors.white,
                        backgroundColor: kMainColor,
                        iconSize: Dimension.iconSize25,
                      );
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (Get.find<PopularProductController>().totalItems == 0) {
                      Get.toNamed(routeHelper.getInitial("0"));
                    } else {
                      Get.snackbar(
                        "warnning! 🙅",
                        "you cant leave , check out or cancel your order",
                        backgroundColor: kMainColor,
                        colorText: Colors.white,
                      );
                    }
                  },
                  child: GetBuilder<CartController>(
                    builder: (cartController) {
                      return AppIcon(
                        icon: Icons.home_outlined,
                        iconColor: Colors.white,
                        backgroundColor: kMainColor,
                        iconSize: Dimension.iconSize25,
                      );
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.find<CartController>().clearCart();
                  },
                  child: AppIcon(
                    icon: Icons.delete_forever_rounded,
                    iconColor: Colors.white,
                    backgroundColor: kMainColor,
                    iconSize: Dimension.iconSize25,
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: Dimension.height20 * 5,
            left: Dimension.width30,
            right: Dimension.width30,
            bottom: 0,
            child: Container(
              //color: Colors.red,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(
                  builder: (cartController) {
                    return ListView.builder(
                      itemCount: cartController.getItems.length,
                      itemBuilder: (_, index) {
                        return Container(
                          width: double.infinity,
                          height: 130,
                          child: GestureDetector(
                            onTap: () {
                              // var popularIndex = Get.find<PopularProductController>().popularProductList.indexOf(cartController.getItems[index].product);
                              // if (popularIndex >= 0) {
                              //   Get.toNamed(routeHelper.getPopularFoodDetail(popularIndex, "cartPage"));
                              // } else {
                              //   var recommendedIndex = Get.find<RecommendedProductController>().recommendedProductList.indexOf(cartController.getItems[index].product);
                              //   Get.toNamed(routeHelper.getRecommendedFoodDetail(recommendedIndex, "cartPage"));
                              // }
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 130,
                                  height: 130,
                                  margin: EdgeInsets.only(bottom: Dimension.height10),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(kBaseUrl + kUploadsMeals + cartController.getItems[index].img!),
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      Dimension.radius20,
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: Dimension.width5,
                                ),
                                Expanded(
                                  child: Container(
                                    height: Dimension.height20 * 5,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(
                                          text: cartController.getItems[index].name!,
                                          color: Colors.black54,
                                        ),
                                        SmallText(
                                          text: "spicy",
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(
                                              text: "\$ ${cartController.getItems[index].price!}",
                                              color: Colors.red,
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(Dimension.height10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(Dimension.radius20),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      cartController.addItem(cartController.getItems[index].product!, -1);

                                                      // popularProduct.setQuantity(false);
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
                                                  BigText(text: cartController.getItems[index].quantity.toString()), //popularProduct.inCartItems.toString()),
                                                  SizedBox(
                                                    width: Dimension.width5,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      cartController.addItem(cartController.getItems[index].product!, 1);
                                                      //popularProduct.setQuantity(true);
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
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(builder: (cartController) {
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
                    SizedBox(
                      width: Dimension.width5,
                    ),
                    BigText(text: "\$ ${cartController.totalAmount.toString()} "),
                    SizedBox(
                      width: Dimension.width5,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // post the cartModel item to backend
                  // clear the Cart page
                  // go to history page to see if the order is accept or reject
                  if (cartController.items.isEmpty) {
                  } else {
                    cartController.checkOut();
                    Get.find<HistoryController>().getHistoryList();
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      animType: AnimType.topSlide,
                      showCloseIcon: false,
                      title: "Done",
                      desc: "Your order was submitted and you can see it in history!",
                      btnOkText: "Ok",
                      btnOkOnPress: () {
                        cartController.clearCart();
                        Get.toNamed(routeHelper.getInitial("0"));
                      },
                      // btnCancelOnPress: () {},
                    ).show();
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(Dimension.height20),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimension.radius20), color: kMainColor),
                  child: BigText(
                    text: 'Check out',
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
