import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sfss/pages/home/screens/community/screen_community.dart';
import 'package:sfss/pages/home/screens/home/screen_home.dart';
import 'package:sfss/pages/home/screens/home/diet_progress.dart';
import 'package:sfss/plugins/adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/sfss_widget.dart';
import 'package:sfss/widgets/tabBar.dart';

class PageHome extends StatefulWidget {
  const PageHome({ Key? key }) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> with TickerProviderStateMixin {
  int subPageIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    Adapter(context: context);
    return CupertinoTabScaffold(
      tabBar: SfssTabBar(
        border: Border(
          top: BorderSide(
            color: const Color(0xFFC4C6CB),
            width: px(1),
          ),
        ),
        backgroundColor: Colors.white,
        currentIndex: subPageIndex,
        items: <BottomNavigationBarItem>[
          SfssWidget.tabBarItem('首页'),
          SfssWidget.tabBarItem('时令'),
          SfssWidget.tabBarItem('坊间'),
          SfssWidget.tabBarItem('往迹'),
        ],
      ), 
      tabBuilder: (context, index) {
        return const [
          ScreenHome(),
          ScreenHome(),
          ScreenCommunity(),
          ScreenHome(),
        ][index];
      }
    );
  }
}