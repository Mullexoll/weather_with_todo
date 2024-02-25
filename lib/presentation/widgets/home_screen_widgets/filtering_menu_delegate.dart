import 'package:flutter/material.dart';

import '../../helpers/text_style_helper.dart';
import 'filtering_menu.dart';

class FilteringMenuDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      margin: const EdgeInsets.all(8),
      color: Colors.white, // Background color of the filtering menu
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Filter by: ',
            style: defaultBlack16(),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black, // You can set the color of the border here
                width: 1, // You can set the width of the border here
              ),
            ),
            child: const FilteringMenu(),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 60.0; // Maximum height of the filtering menu

  @override
  double get minExtent => 60.0; // Minimum height of the filtering menu

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false; // Only rebuild when the delegate's properties change
  }
}
