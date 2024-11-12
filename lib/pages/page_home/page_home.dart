import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:sfss/pages/page_home/screens/screen_community/screen_community.dart';
import 'package:sfss/__deprecated/edit_record/screen_edit_record.dart';
import 'package:sfss/pages/page_home/screens/screen_home/screen_home.dart';
import 'package:sfss/pages/page_home/screens/screen_home/widgets/diet_progress.dart';
import 'package:sfss/pages/page_home/screens/screen_history/screen_history.dart';
import 'package:sfss/pages/page_home/screens/screen_solar_term/screen_solar_term.dart';
import 'package:sfss/pages/page_record_edit/page_record_edit.dart';
import 'package:sfss/plugins/adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/sfss_widget.dart';
import 'package:sfss/widgets/tab_bar.dart';

class PageHome extends StatefulWidget {
  const PageHome({ Key? key }) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> with TickerProviderStateMixin {
  int subPageIndex = 0;
  int lastSubPageIndex = 0;
  bool clickedBack = false;
  final controller = CupertinoTabController(initialIndex: 0);
  static BottomNavigationBarItem emptyTabBarItem() {
    return BottomNavigationBarItem(
      icon: SizedBox(),
      activeIcon: SizedBox());
  }
  @override
  Widget build(BuildContext context) {
    Adapter(context: context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onVerticalDragUpdate: (details) {
        print('object');
        if(details.delta.distance > 10) {
          SystemChannels.textInput.invokeMethod('TextInput.hide');
        }
      },
      child: Stack(
        children: [
          NotificationListener<ScrollUpdateNotification>(
            onNotification: (ScrollUpdateNotification notification){
              if(notification.dragDetails != null && notification.dragDetails!.delta.distance > 0)
                SystemChannels.textInput.invokeMethod('TextInput.hide');
              return false;
            },
            child: CupertinoTabScaffold(
              backgroundColor: Colors.white,
              controller: controller,
              tabBar: SfssTabBar(
                onTapRecord: (index){
                  lastSubPageIndex = index;
                  final subTitle = ['冬时韵悠长，烹茶品暗香。', '节气引食韵，五谷丰登香。', '秋风摇黄叶，炉火煮新茶。', '冬时韵悠长，烹茶品暗香。'];
                  ['立冬', '时令', '坊间', '立冬'].asMap().forEach((i, e) {
                    if (index == i) {
                       Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const PageRecordEdit();
                        },
                        settings: RouteSettings(
                          arguments: {'title': e, 'subTitle': subTitle[i]}
                        )
                      ));
                      // Navigator.pushNamed(context, '/recordEdit', arguments: {'title': e, 'subTitle': subTitle[i]});
                    }
                  });
                  // Navigator.pushNamed(context, '/recordEdit', arguments: {'title': 'value'});
                },
                border: Border(
                  top: BorderSide(
                    color: const Color(0xFFC4C6CB),
                    width: px(1),
                  ),
                ),
                onTap: (index) {
                  setState(() {
                    lastSubPageIndex = index;
                  });
                },
                backgroundColor: Colors.transparent,
                currentIndex: subPageIndex,
                items: <BottomNavigationBarItem>[
                  SfssWidget.tabBarItem('首页'),
                  SfssWidget.tabBarItem('时令'),
                  SfssWidget.tabBarItem('坊间'),
                  SfssWidget.tabBarItem('往迹'),
                  emptyTabBarItem()
                ],
              ), 
              tabBuilder: (context, index) {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  if (clickedBack == true) {
                    setState(() {
                      controller.index = lastSubPageIndex;
                    });
                    clickedBack = false;
                  }
                });
                return [
                  const ScreenHome(),
                  const ScreenSolarTerm(),
                  const ScreenCommunity(),
                  const ScreenHistory(),
                  ScreenEditRecord(onClickBack: (){
                    clickedBack = true;
                    
                  }),
                ][index];
              }
            ),
          ),
        ],
      ),
    );
  }
}