import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CollectionHeaderDelegate extends SliverPersistentHeaderDelegate{
  final double maxExtent;
  final double minExtent;
  int selectIndex;
  Function(int) onPressTag = (int index){};
  
  CollectionHeaderDelegate({
    this.maxExtent = 124,
    this.minExtent = 56,
    required this.onPressTag,
    required this.selectIndex,
  });
  
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Container(color: Colors.white),
        Positioned(
          bottom: 60,
          left: 0,
          right: 0,
          child: Text(
            '食物收集图鉴',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28, 
              color: Color.fromARGB(
                max(((80-shrinkOffset)/14*40).toInt(),0),
                74, 85, 104
              ),
              fontFamily: "WYMingChao",
            )
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: minExtent,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      selectIndex = 0;
                      onPressTag(0);
                    },
                    child: Text(
                      '类型',
                      style: TextStyle(
                        fontSize: 20, 
                        color: selectIndex==0?const Color(0xFF882F2F):const Color(0xFF4A5568),
                        fontFamily: "WYMingChao",
                      )
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    '/',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF4A5568),
                      fontFamily: "WYMingChao",
                    ),
                  ),
                  const SizedBox(width: 20),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      selectIndex = 1;
                      onPressTag(1);
                    },
                    child: Text(
                      '节气',
                      style: TextStyle(
                        fontSize: 20, 
                        color: selectIndex==1?const Color(0xFF882F2F):const Color(0xFF4A5568),
                        fontFamily: "WYMingChao",
                      )
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    '/',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF4A5568),
                      fontFamily: "WYMingChao",
                    ),
                  ),
                  const SizedBox(width: 20),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      selectIndex = 2;
                      onPressTag(2);
                    },
                    child: Text(
                      '食材',
                      style: TextStyle(
                        fontSize: 20, 
                        color: selectIndex==2?const Color(0xFF882F2F):const Color(0xFF4A5568),
                        fontFamily: "WYMingChao",
                      )
                    ),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    '/',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF4A5568),
                      fontFamily: "WYMingChao",
                    ),
                  ),
                  const SizedBox(width: 20),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      selectIndex = 3;
                      onPressTag(3);
                    },
                    child: Text(
                      '所有',
                      style: TextStyle(
                        fontSize: 20, 
                        color: selectIndex==3 ? const Color(0xFF882F2F) : const Color(0xFF4A5568),
                        fontFamily: "WYMingChao",
                      )
                    ),
                  ),
                ],
                                  ),
                const SizedBox(height: 3),
                Container(
                  height: 1,
                  width: 320,
                  color: const Color(0xFFC4C6CB),
                ),
              ],
            ),
          )
        )
      ],
    );
  }

  @override
  bool shouldRebuild(covariant CollectionHeaderDelegate old) {
    return true;
    // return old.maxExtent != maxExtent || old.minExtent != minExtent || old.selectIndex != selectIndex;
  }
}