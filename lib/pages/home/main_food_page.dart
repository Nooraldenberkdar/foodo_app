import 'package:flutter/material.dart';
import 'package:foodo_app/controllers/popular_product_controller.dart';
import 'package:foodo_app/helper/routeHelper.dart';
import 'package:foodo_app/models/products_models.dart';
import 'package:foodo_app/pages/food/popular_food_details.dart';
import 'package:foodo_app/utilities/constants.dart';
import 'package:foodo_app/widgets/app_column.dart';
import 'package:foodo_app/widgets/bigText.dart';
import 'package:foodo_app/widgets/recommendedItem.dart';
import 'package:foodo_app/widgets/smallText.dart';
import 'package:foodo_app/widgets/icon_text_widget.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:foodo_app/utilities/dimensions.dart';
import 'package:foodo_app/widgets/popularItem.dart';
import 'package:get/get.dart';
import 'package:foodo_app/pages/food/popular_food_details.dart';

import '../../controllers/recommended_product_controller.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
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
                    //popular food
                    //horizentalSlider
                    GetBuilder<PopularProductController>(
                      builder: (popularProducts) {
                        // this line create instance popularProducts from PopularProductController and we use GetBuilder because it rebuild the builder: after each change in PopularProductController data
                        // so after this line we just make dependency injection by call Get.find<PopularProductController> and get this instance to deal with it ,this way we just create one instance of a class and use it in diff places (core of dependency injection)
                        return popularProducts.isLoaded
                            ? Container(
                                height: Dimension.pageView,
                                child: Swiper(
                                  itemCount: popularProducts.popularProductList.length > 1 ? popularProducts.popularProductList.length : 1,
                                  pagination: SwiperPagination(),
                                  autoplay: true,
                                  viewportFraction: 0.8,
                                  indicatorLayout: PageIndicatorLayout.COLOR,
                                  scale: 0.8,
                                  itemBuilder: (context, position) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                          routeHelper.getPopularFoodDetail(position, "home"),
                                        );
                                      },
                                      child: PopularItem(
                                          index: position,
                                          image: NetworkImage(kBaseUrl + kUploadsMeals + popularProducts.popularProductList[position].img!),
                                          h1: popularProducts.popularProductList[position].name),
                                    );
                                  },
                                ),
                              )
                            : CircularProgressIndicator(
                                color: kMainColor,
                              );
                      },
                    ),
                    SizedBox(
                      height: Dimension.height30,
                    ),
                    //recommended
                    Container(
                      margin: EdgeInsets.only(
                        left: Dimension.width30,
                        bottom: Dimension.height20,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          BigText(text: 'Recommended'),
                          SizedBox(
                            width: Dimension.width10,
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: Dimension.height5),
                            child: BigText(
                              text: '.',
                              color: Colors.black26,
                            ),
                          ),
                          SizedBox(
                            width: Dimension.width10,
                          ),
                          SmallText(text: 'Food Pairing')
                        ],
                      ),
                    ),
                    //recommended food
                    //list of foods and images
                    GetBuilder<RecommendedProductController>(
                      builder: (recommendedProducts) {
                        return recommendedProducts.isLoaded
                            ? ListView.builder(
                                physics: NeverScrollableScrollPhysics(), // to make all page comeback togother
                                shrinkWrap: true, //to solve (put listview inside column error)
                                itemCount: recommendedProducts.recommendedProductList.length > 1 ? recommendedProducts.recommendedProductList.length : 1,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(routeHelper.getRecommendedFoodDetail(index, "home"));
                                    },
                                    child: RecommendedItem(
                                      image: NetworkImage(kBaseUrl + kUploadsMeals + recommendedProducts.recommendedProductList[index].img!),
                                      h1: recommendedProducts.recommendedProductList[index].name,
                                      description: 'description',
                                      index: index,
                                    ),
                                  );
                                })
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
