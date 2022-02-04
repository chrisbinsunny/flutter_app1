
import 'package:flutter/material.dart';


class MyCustomHeader extends SliverPersistentHeaderDelegate {
  MyCustomHeader({
    required this.expandedHeight,
    required this.tabs,
    // required this.context,
  });

  final Widget tabs;
  final double expandedHeight;
  //final BuildContext context;

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: tabs,
    );
  }
}
