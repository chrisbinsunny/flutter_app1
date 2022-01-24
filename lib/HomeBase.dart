
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app1/fragments/Sample.dart';
import 'package:flutter_app1/fragments/Search.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter_app1/Resources/AppColors.dart';
import 'package:flutter_app1/fragments/CartPage.dart';
import 'package:flutter_app1/fragments/HomePage.dart';
import 'package:flutter_app1/fragments/Profile.dart';
import 'package:flutter_app1/fragments/SearchPage.dart';

class HomeBase extends StatefulWidget{
  @override
  _HomeBaseState createState() => _HomeBaseState();
}


List<Widget> _buildScreens() {
  return [
    HomePage(),
    SearchPage(),
    CartPage(),
    Profile()
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.home),
      title: ("Home"),
      activeColorPrimary: Color(AppColors.commonOrange),
      activeColorSecondary:Color(AppColors.commonOrange),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.search),
      title: ("Search"),
      activeColorPrimary: Color(AppColors.commonOrange),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.bag),
      title: ("Cart"),
      activeColorPrimary: Color(AppColors.commonOrange),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.person),
      title: ("Profile"),
      activeColorPrimary: Color(AppColors.commonOrange),
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}

class _HomeBaseState extends State<HomeBase> {
  @override
  Widget build(BuildContext context) {

    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);

    return PersistentTabView(
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
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}