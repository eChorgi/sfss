import 'package:extra_hittest_area/extra_hittest_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfss/plugins/adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/sfss_widget.dart';

class SfssTabBar extends CupertinoTabBar {
  final double itemSpacing;
  final double height = 55;
  final Function onTapRecord;
  
  SfssTabBar({
    Key? key,
    required List<BottomNavigationBarItem> items,
    required int currentIndex,
    this.itemSpacing = 0,
    ValueChanged<int>? onTap,
    Border ?border,
    Color backgroundColor = Colors.white,
    required this.onTapRecord
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
    return Stack(
      children: [
          Hero(
          tag: "tabBar",
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).padding.bottom + 55,
            color: Colors.white,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: double.infinity,
                height: 55,
                color: Colors.white,
                child: Column(
                  children: [
                    // Container(
                    //   height: 1,
                    //   width: px(312),
                    //   color: const Color(0xFFC4C6CB),
                    // ),
                    const SizedBox(height: 13),
                    SizedBox(
                      width: px(287),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: items.map((item) {
                          int index = items.indexOf(item);
                          bool isSelected = index == currentIndex;
                          return GestureDetectorHitTestWithoutSizeLimit(
                            extraHitTestArea: EdgeInsets.all(px(10)),
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
                          //在中间插入
                        }).toList()..insert(items.length~/2,
                          GestureDetectorHitTestWithoutSizeLimit(
                          extraHitTestArea: EdgeInsets.all(px(10)),
                          onTap: () {
                            if (onTap != null) {
                              // onTap!(items.length-1);
                              onTapRecord!(currentIndex);
                            }
                          },
                          child: Transform(
                            transform: Matrix4.translationValues(3.6, 0, 0),
                            child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration (
                              color: SfssStyle.mainRed,
                              borderRadius: BorderRadius.circular(40)
                            ),
                            child: 
                              Center(
                                child: SfssWidget.text(
                                  '记',
                                  fontSize: 15,
                                  color: Colors.white
                                ),
                              )
                            ),
                          ),
                         )
                        )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
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
      onTapRecord: this.onTapRecord,
    );
  }
}