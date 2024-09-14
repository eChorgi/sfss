import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfss/data/foods_data.dart';
import 'package:sfss/widgets.dart';
import 'package:sfss/navigationBar.dart';
import 'package:sfss/collection_header.dart';
import 'package:sfss/data/foods_data.dart';
import 'package:flutter_star/flutter_star.dart';

class PageDetail extends StatefulWidget {
  final int foodId;
  const PageDetail({
    super.key,
    required this.foodId
  });

  @override
  _PageDetailState createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> {
  int subPageIndex = 2;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CustomCupertinoNavigationBar(
        title: '食物详情',
        subTitle: '应时知节寻美味，传统源流心底藏。',
        showBackButton: true,
        onPressBack: (){
          Navigator.pop(context);
        },
      ),
      child: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 42.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 70.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 22,
                                      width: 11,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFF882F2F),
                                        borderRadius: BorderRadius.all(Radius.circular(2)),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      foodDatas[widget.foodId].name,
                                      style: const TextStyle(
                                        color: Color(0xFF882F2F),
                                        fontSize: 26,
                                        fontFamily: "WYMingChao",
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 22),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Text.rich(
                                    strutStyle: const StrutStyle(
                                      height: 2,
                                    ),
                                    TextSpan(
                                      children: [
                                        const TextSpan(
                                          text: '您共品鉴',
                                          style: TextStyle(
                                            color: Color(0xFF4A5568),
                                            fontSize: 14,
                                            fontFamily: "WYMingChao",
                                            letterSpacing: 1.5,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '${foodDatas[widget.foodId].tasteCount}',
                                          style: const TextStyle(
                                            color: Color(0xFF882F2F), // 设置不同颜色
                                            fontSize: 16,
                                            fontFamily: "WYMingChao",
                                            letterSpacing: 1.5,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '次${foodDatas[widget.foodId].name}\n',
                                          style: const TextStyle(
                                            color: Color(0xFF4A5568),
                                            fontSize: 14,
                                            fontFamily: "WYMingChao",
                                            letterSpacing: 1.5,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: '上次于',
                                          style: TextStyle(
                                            color: Color(0xFF4A5568),
                                            fontSize: 14,
                                            fontFamily: "WYMingChao",
                                            letterSpacing: 1.4,
                                          ),
                                        ),
                                        TextSpan(
                                          text: '${foodDatas[widget.foodId].lastTasted.month}月${foodDatas[widget.foodId].lastTasted.day}日',
                                          style: const TextStyle(
                                            color: Color(0xFF882F2F), // 设置不同颜色
                                            fontSize: 16,
                                            fontFamily: "WYMingChao",
                                            letterSpacing: 1.5,
                                          ),
                                        ),
                                        const TextSpan(
                                          text: '品尝',
                                          style: TextStyle(
                                            color: Color(0xFF4A5568),
                                            fontSize: 14,
                                            fontFamily: "WYMingChao",
                                            letterSpacing: 1.4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Text(
                                    '您对${foodDatas[widget.foodId].name}的评价:',
                                    strutStyle: const StrutStyle(
                                      height: 2,
                                    ),
                                    style: const TextStyle(
                                      color: Color(0xFF4A5568),
                                      fontSize: 14,
                                      fontFamily: "WYMingChao",
                                      letterSpacing: 1.4,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0, top: 11, bottom: 8),
                                  child: StarScore(
                                    star: const Star(
                                      fillColor: Color(0xFF882F2F),
                                      emptyColor: Color(0x584A5568),
                                      size: 14
                                    ),
                                    tail: Text(
                                      '${foodDatas[widget.foodId].myRank}',
                                      style: const TextStyle(
                                        color: Color(0xFF4A5568),
                                        fontSize: 14,
                                        fontFamily: "WYMingChao",
                                        letterSpacing: 1.4,
                                      ),
                                    ),
                                    score: foodDatas[widget.foodId].myRank
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 4.0),
                                  child: Text(
                                    '大家对${foodDatas[widget.foodId].name}的评价:',
                                    strutStyle: const StrutStyle(
                                      height: 2,
                                    ),
                                    style: const TextStyle(
                                      color: Color(0xFF4A5568),
                                      fontSize: 14,
                                      fontFamily: "WYMingChao",
                                      letterSpacing: 1.4,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 6.0, top: 6),
                                  child: StarScore(
                                    star: const Star(
                                      fillColor: Color(0xFF882F2F),
                                      emptyColor: Color(0x584A5568),
                                      size: 14
                                    ),
                                    score: foodDatas[widget.foodId].globalRank,
                                    tail: Text(
                                      '${foodDatas[widget.foodId].globalRank}',
                                      style: const TextStyle(
                                        color: Color(0xFF4A5568),
                                        fontSize: 14,
                                        fontFamily: "WYMingChao",
                                        letterSpacing: 1.4,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                        
                            if(foodDatas[widget.foodId].assetPath != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: Image.asset(
                                foodDatas[widget.foodId].assetPath!,
                                height: 160,
                                width: 160,
                                fit: BoxFit.scaleDown,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(26),
                        width: 380,
                        decoration: BoxDecoration (
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.15),
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Text(
                          foodDatas[widget.foodId].describe,
                          strutStyle: const StrutStyle(
                            height: 1.65,
                          ),
                          style: const TextStyle(
                            color: Color(0xFF4A5568),
                            fontSize: 14,
                            fontFamily: "WYMingChao",
                            letterSpacing: 1.4,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        
                        width: 380,
                        decoration: BoxDecoration (
                          color: Color(0xFF882F2F),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.15),
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 24.0, top: 17),
                              child: Text(
                                '历史起源',
                                style: TextStyle(
                                  color: Color(0xFFC9A1A1),
                                  fontSize: 34,
                                  fontFamily: "WYMingChao",
                                  letterSpacing: 1.4,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(36)+const EdgeInsets.only(top: 4),
                              child: Text(
                                foodDatas[widget.foodId].history,
                                strutStyle: const StrutStyle(
                                  height: 1.65,
                                ),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: "WYMingChao",
                                  letterSpacing: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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