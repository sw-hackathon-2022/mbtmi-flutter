import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mbtmi/constants.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:mbtmi/screens/dialog/MbtmiDialog.dart';

import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'analytic/analytic_screen.dart';
import 'constant_screen.dart';
import 'contents/contents_screen.dart';
import 'feed/detail/detail_screen.dart';
import 'feed/feed_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, required this.mbti}) : super(key: key) {
    // Get.put(HomeScreenController());
  }

  final String mbti;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //get animationController => null;
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 1);

  List<Widget> _buildScreens() {
    return [
      const ContentsScreen(),
      //const FeedScreen(),
      FeedScreen(mbti: widget.mbti),
      const AnalyticScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.square_grid_2x2),
        title: (" "),
        activeColorPrimary: kPurpleColor,
        inactiveColorPrimary: CupertinoColors.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: (" "),
        activeColorPrimary: kYellowColor,
        inactiveColorPrimary: CupertinoColors.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.chart_pie),
        title: (" "),
        activeColorPrimary: kGreenColor,
        inactiveColorPrimary: CupertinoColors.black,
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),

      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}
