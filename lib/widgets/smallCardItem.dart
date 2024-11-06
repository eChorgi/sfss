import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfss/pages/detail/pageDetail.dart';
import 'package:sfss/styles/mainStyle.dart';

Widget smallCardItem({
  required String name, 
  required String describe, 
  EdgeInsetsGeometry ?padding,
  Widget ?describeWidget,
  bool showDescribe = true,
  bool showDetailButton = true,
  double describeOffset = 0,
  TextStyle ?nameStyle,
  required BuildContext context,
}) {
  return Padding(
    padding: padding ?? const EdgeInsets.only(left: 6.0, right: 6.0, top: 12.0, bottom: 12.0),
    child: Container(
      decoration: BoxDecoration(
        // image: Image.asset(name),
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 3,
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (context) => const PageDetail(foodId: 1,)),
          );
        },
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 20.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 6.0),
                    child: Container(
                      height: 14,
                      width: 6,
                      decoration: BoxDecoration(
                        color: const Color(0xFF791414),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  Text(
                    name,
                    style: nameStyle??TextStyle(
                      color: const Color(0xFF791414),
                      fontSize: (name.length<=6?21:33-name.length*2),
                      fontFamily: SfssStyle.mainFont,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 28.0, right: describeOffset),
                child: Text(
                  describe,
                  style: TextStyle(
                    color: const Color(0xFF687281),
                    fontSize: 13,
                    fontFamily: SfssStyle.mainFont,
                  ),
                ),
              ),
            ),
            if(showDetailButton)Padding(
              padding: const EdgeInsets.only(left: 90.0, top: 19.0),
              child: Row(
                children: [
                  Text(
                    '查看详情',
                    style: TextStyle(
                      color: const Color(0xFFB7BBC3),
                      fontSize: 11,
                      fontFamily: SfssStyle.mainFont,
                    ),
                  ),
                  Image.asset(
                    'assets/images/icon_detail.png',
                    height: 14,
                    width: 14,
                  )
                ],
              ),
            ),
          ],
        ),
      )
    ),
  );
}