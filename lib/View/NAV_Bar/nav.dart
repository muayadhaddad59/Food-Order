import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_order/View/Home/home_screen.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class NavBar extends StatelessWidget {
  NavBar({Key? key}) : super(key: key);

  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
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
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.home),
      textStyle: TextStyle(color: Colors.transparent),
      title: ("   "),
      activeColorPrimary: CupertinoColors.systemRed,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.suit_heart),
      textStyle: TextStyle(color: Colors.transparent),
      title: ("   "),
      activeColorPrimary: CupertinoColors.systemRed,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.search , color: Colors.white,),
      textStyle: TextStyle(color: Colors.transparent),
      title: ("  "),
      activeColorPrimary: CupertinoColors.systemRed,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.bell),
      textStyle: TextStyle(color: Colors.transparent),
      title: ("   "),
      activeColorPrimary: CupertinoColors.systemRed,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
     PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.cart),
      title: ("   "),
      textStyle: TextStyle(color: Colors.transparent),
      activeColorPrimary: CupertinoColors.systemRed,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}

List<Widget> _buildScreens() {
  return [
    HomeScreen(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];
}
