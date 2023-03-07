import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodo_app/controllers/history_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:foodo_app/utilities/dimensions.dart';
import 'package:foodo_app/helper/routeHelper.dart';
import '../../controllers/restaurants_controller.dart';
import '../../utilities/constants.dart';
import '../../widgets/bigText.dart';
import '../../widgets/restaurantItem.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String status(index) {
    int is_aproved = Get.find<HistoryController>().historyList[index].is_aproved;
    int is_canceled = Get.find<HistoryController>().historyList[index].is_canceled;
    if (is_aproved == 0 && is_canceled == 0) {
      return 'waiting';
    } else if (is_aproved == 1)
      return 'approved';
    else
      return 'canceled';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () {
                  return Get.find<HistoryController>().getHistoryList();
                },
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
                              text: 'History',
                              size: Dimension.width30,
                            ),
                          ],
                        ),
                      ),
                      GetBuilder<HistoryController>(
                        builder: (historyController) {
                          return historyController.isLoaded
                              ? ListView.builder(
                                  reverse: true,
                                  physics: NeverScrollableScrollPhysics(), // to make all page comeback togother
                                  shrinkWrap: true, //to solve (put listview inside column error)
                                  itemCount: historyController.historyList.length > 1 ? historyController.historyList.length : 1,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(Dimension.width10), color: Colors.amber),
                                        width: double.infinity,
                                        height: Dimension.height30 * 5,
                                        margin: EdgeInsets.all(Dimension.height20),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: Dimension.width20),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              BigText(text: "Order id:   " + historyController.historyList[index].id.toString()),
                                              BigText(text: "ordered_at:  " + historyController.historyList[index].created_at),
                                              BigText(text: "total price:  " + historyController.historyList[index].total.toString()),
                                              // BigText(text: historyController.historyList[index].is_aproved == 1 ? "status:Accepted" : "status:Canceled"),
                                              BigText(text: 'status of order : ' + status(index)),
                                              historyController.historyList[index].accepted_at != null
                                                  ? BigText(text: "Accepted at: " + historyController.historyList[index].accepted_at.toString())
                                                  : BigText(text: "Accepted at: not accepted"),

                                              // BigText(text: Get.find<RestaurantsController>().restaurantsList[index].name),
                                              // BigText(text: historyController.historyList[index].id.toString()),
                                              // BigText(text: historyController.historyList[index].id.toString()),
                                            ],
                                          ),
                                        ),
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
            ),
          ],
        ),
      ),
    );
  }
}
