import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:foodo_app/controllers/popular_product_controller.dart';
import 'package:foodo_app/controllers/recommended_product_controller.dart';
import 'package:foodo_app/helper/routeHelper.dart';
import 'package:foodo_app/utilities/constants.dart';
import 'package:foodo_app/utilities/dimensions.dart';
import 'package:foodo_app/widgets/app_icon.dart';
import 'package:foodo_app/widgets/bigText.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../controllers/cart_controller.dart';
import '../../widgets/expandable_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  int pageId;
  final String oldPage;
  RecommendedFoodDetail({required this.pageId, required this.oldPage});

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>().initProduct(product, Get.find<CartController>());

    // print(pageId);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false, //try to turn it true to see way i put it here
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (Get.find<PopularProductController>().totalItems > 0) {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.topSlide,
                        showCloseIcon: true,
                        title: "warning",
                        desc: "You have add items to Cart, do you want to remove them!",
                        btnOkText: "yes",
                        btnOkOnPress: () {
                          Get.find<PopularProductController>().clearCart();
                          Get.toNamed(routeHelper.getInitial("0"));
                        },
                        btnCancelOnPress: () {},
                      ).show();
                    } else
                      Get.toNamed(routeHelper.getInitial("0"));
                  },
                  child: AppIcon(icon: Icons.clear),
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
                          Get.find<PopularProductController>().totalItems >= 1
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
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimension.height50),
              child: Container(
                padding: EdgeInsets.only(top: Dimension.height5, bottom: Dimension.height15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: BigText(text: product.name!),
                ),
                width: double.maxFinite,
              ),
            ),
            backgroundColor: kyellowColor,
            pinned: true,
            expandedHeight: Dimension.expandedImgHeight,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                kBaseUrl + kUploadsMeals + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(text: product.description!),
                  margin: EdgeInsets.symmetric(horizontal: Dimension.width20),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimension.width20 * 3,
                  vertical: Dimension.height10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                        icon: Icons.remove,
                        iconColor: Colors.white,
                        backgroundColor: kMainColor,
                        iconSize: Dimension.iconSize25,
                      ),
                    ),
                    BigText(
                      text: ' ${product.price!} SYP  X  ${controller.inCartItems}',
                      color: kMainBlackColor,
                      size: Dimension.font26,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        icon: Icons.add,
                        iconColor: Colors.white,
                        backgroundColor: kMainColor,
                        iconSize: Dimension.iconSize25,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
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
                      child: Icon(
                        Icons.favorite,
                        color: kMainColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addItem(product);
                      },
                      child: Container(
                        padding: EdgeInsets.all(Dimension.height20),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimension.radius20), color: kMainColor),
                        child: BigText(
                          text: '${product.price} SYP | Add to cart',
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
