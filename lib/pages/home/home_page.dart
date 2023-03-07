import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodo_app/pages/cart/cart_page.dart';
import 'package:foodo_app/pages/history/history_page.dart';
import 'package:foodo_app/pages/home/main_food_page.dart';
import 'package:foodo_app/pages/resturnats/restaurants_page.dart';
import 'package:foodo_app/utilities/constants.dart';
import 'package:foodo_app/widgets/header.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomePage extends StatefulWidget {
  final String? oldPage;
  const HomePage({Key? key, required this.oldPage}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //int selectedIndex = 0;
  late PersistentTabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PersistentTabController(initialIndex: int.parse(widget.oldPage!));
  }

  List<Widget> _buildScreens() {
    return [
      FoodPageBody(),
      RestaurantsPage(),
      HistoryPage(),
      Container(child: Center(child: Text("Next next page"))),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.restaurant_outlined),
        title: ("restaurants"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.archivebox),
        title: ("History"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("profile"),
        activeColorPrimary: CupertinoColors.activeBlue,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            Expanded(
              child: PersistentTabView(
                context,
                controller: _controller,
                screens: _buildScreens(),
                items: _navBarsItems(),
                confineInSafeArea: true,
                backgroundColor: Colors.white, // Default is Colors.white.
                handleAndroidBackButtonPress: true, // Default is true.
                resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
                stateManagement: true, // Default is true.
                hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
                decoration: NavBarDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  colorBehindNavBar: Colors.white,
                ),
                popAllScreensOnTapOfSelectedTab: true,
                popActionScreens: PopActionScreensType.all,
                itemAnimationProperties: ItemAnimationProperties(
                  // Navigation Bar's items animation properties.
                  duration: Duration(milliseconds: 200),
                  curve: Curves.ease,
                ),
                screenTransitionAnimation: ScreenTransitionAnimation(
                  // Screen transition animation on change of selected tab.
                  animateTabTransition: true,
                  curve: Curves.ease,
                  duration: Duration(milliseconds: 200),
                ),
                navBarStyle: NavBarStyle.style9, // Choose the nav bar style with this property.
              ),
            )
          ],
        ),
      ),
    );
  }
}
