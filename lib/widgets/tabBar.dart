import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SfssTabBar extends CupertinoTabBar {
  final double itemSpacing;

  SfssTabBar({
    Key? key,
    required List<BottomNavigationBarItem> items,
    required int currentIndex,
    this.itemSpacing = 30,
    ValueChanged<int>? onTap,
    Border ?border,
    Color backgroundColor = Colors.white,
  }) : super(
    key: key,
    items: items,
    currentIndex: currentIndex,
    onTap: onTap,
    backgroundColor: backgroundColor,
    border: border,
  );
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 82,
      child: Container(
        color: backgroundColor,
        child: Column(
          children: [
            Container(
              height: 1,
              width: 350,
              decoration: const BoxDecoration(
                color: Color(0xFFC4C6CB),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: items.map((item) {
                int index = items.indexOf(item);
                bool isSelected = index == currentIndex;
                return GestureDetector(
                  onTap: () {
                    if (onTap != null) {
                      onTap!(index);
                    }
                  },
                  child: Padding(
                    padding: EdgeInsets.only(left: itemSpacing / 2, right: itemSpacing / 2),
                      child: isSelected?item.activeIcon:item.icon
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CupertinoTabBar copyWith({
    Key? key,
    List<BottomNavigationBarItem>? items,
    int? currentIndex,
    ValueChanged<int>? onTap,
    Color? activeColor,
    Color? backgroundColor,
    Border? border,
    double? height,
    double? iconSize,
    Color? inactiveColor,
  }) {
    return SfssTabBar(
      key: key ?? this.key,
      items: items ?? this.items,
      currentIndex: currentIndex ?? this.currentIndex,
      onTap: onTap ?? this.onTap,
      backgroundColor: backgroundColor ?? Colors.white,
      border: border ?? this.border,
    );
  }
}