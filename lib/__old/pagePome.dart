import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sfss/pages/home/screens/collection.dart';
import 'package:sfss/pages/home/screens/history.dart';
import 'package:sfss/pages/home/screens/recommend.dart';
import 'package:sfss/pages/home/screens/today.dart';
import 'package:sfss/plugins/adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/tab_bar.dart';


class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  int subPageIndex = 0;
  BottomNavigationBarItem tabBarItem(String text) {
    return BottomNavigationBarItem(
      icon: Row(
        children: [
          const SizedBox(
            height: 14,
            width: 9.5,
          ),
          Text(
            text,
            style: TextStyle(
              color: const Color(0xFF4A5568),
              fontSize: 14.5,
              fontFamily: SfssStyle.mainFont,
            ),
          ),
        ],
      ),
      activeIcon: Row(
        children: [
          Container(
            height: 14,
            width: 7.5,
            decoration: BoxDecoration(
              color: SfssStyle.mainRed,
              borderRadius: const BorderRadius.all(Radius.circular(2))
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            text,
            style: TextStyle(
              color: SfssStyle.mainRed,
              fontSize: 14.5,
              fontFamily: SfssStyle.mainFont,
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: SfssTabBar(
        onTapRecord: (){},
        border: Border(
          top: BorderSide(
            color: const Color(0xFFC4C6CB),
            width: px(1),
          ),
        ),
        backgroundColor: Colors.white,
        currentIndex: subPageIndex,
        items: <BottomNavigationBarItem>[
          tabBarItem('首页'),
          tabBarItem('荐赏'),
          tabBarItem('坊间'),
          tabBarItem('往迹'),
        ],
      ), 
      tabBuilder: (context, index) {
        return const [
          SubPageToday(),
          SubPageRecommend(),
          SubPageCollection(),
          SubPageHistory(),
        ][index];
      },
    );
  }
}