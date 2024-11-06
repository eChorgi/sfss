import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sfss/pages/home/subPages/collection.dart';
import 'package:sfss/pages/home/subPages/history.dart';
import 'package:sfss/pages/home/subPages/recommend.dart';
import 'package:sfss/pages/home/subPages/today.dart';
import 'package:sfss/plugins/adapt.dart';
import 'package:sfss/styles/mainStyle.dart';
import 'package:sfss/widgets/tabBar.dart';


class PageHome extends StatefulWidget {
  const PageHome({super.key});

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  
  int subPageIndex = 2;

  BottomNavigationBarItem tabBarItem(String text) {
    return BottomNavigationBarItem(
      icon: Row(
        children: [
          const SizedBox(
            height: 16,
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(
              color: const Color(0xFF4A5568),
              fontSize: 16,
              fontFamily: SfssStyle.mainFont,
            ),
          ),
        ],
      ),
      activeIcon: Row(
        children: [
          Container(
            height: 16,
            width: 8,
            decoration: const BoxDecoration(
              color: Color(0xFF791414),
              borderRadius: BorderRadius.all(Radius.circular(2))
            ),
          ),
          const SizedBox(
            height: 18,
            width: 2,
          ),
          Text(
            text,
            style: TextStyle(
              color: const Color(0xFF4A5568),
              fontSize: 16,
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
        border: Border(
          top: BorderSide(
            color: const Color(0xFF000000),
            width: px(1),
          ),
        ),
        backgroundColor: Colors.white,
        currentIndex: subPageIndex,
        items: <BottomNavigationBarItem>[
          tabBarItem('推荐'),
          tabBarItem('图鉴'),
          tabBarItem('今日'),
          tabBarItem('历史'),
        ],
      ), 
      tabBuilder: (context, index) {
        late final CupertinoTabView returnValue;
        switch (index) {
          case 0:
            returnValue = CupertinoTabView(
              builder: (context) {
              return const SubPageRecommend();
            });
            break;
          case 1:
            returnValue = CupertinoTabView(
              builder: (context) {
                return const SubPageCollection();
              },
            );
            break;
          case 2:
            returnValue = CupertinoTabView(
              builder: (context) {
                return const SubPageToday();
              },
            );
            break;
          case 3:
            returnValue = CupertinoTabView(
              builder: (context) {
                return const SubPageHistory();
              },
            );
            break;
        }
        return returnValue;
      },
    );
  }
}