import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sfss/pages/home/screens/community/user_post_card.dart';
import 'package:sfss/pages/home/screens/home/record_overview.dart';
import 'package:sfss/plugins/adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/heatmap_calendar.dart';
import 'package:sfss/widgets/sfss_widget.dart';

class ScreenSolarTerm extends StatefulWidget {
  const ScreenSolarTerm({ Key? key }) : super(key: key);

  @override
  State<ScreenSolarTerm> createState() => _ScreenSolarTermState();
}

class _ScreenSolarTermState extends State<ScreenSolarTerm> with TickerProviderStateMixin {
  
  Widget layerSheet() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: pxh(760) - px(30, extraHScale: -1.2),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(22),
            topRight: Radius.circular(22),
          ),
        ),
        child: Stack(
          children: [
            MediaQuery.removePadding(
              context: context,
              removeTop: true, //去除顶部的空白
              child: ListView(
                children: [
                  Column(
                    children: [
                      // 其他内容
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: pxh(60),
                width: double.infinity,
                child: Center(
                  child: ToggleContent(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget layerBackground() {
    return Align(
      alignment: Alignment.topCenter,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: pxh(256),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/home/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: pxh(50)),
                SfssWidget.text(
                  '时令',
                  fontSize: pxfit(36, extraWScale: 0.15, maxScale: 1.0, noLimitExtraWScale: 0.2),
                  color: Colors.white,
                ),
                SizedBox(height: pxh(4, extraWScale: 0.8, maxScale: 1.5)),
                SfssWidget.text(
                  '节气引食韵，五谷丰登香。',
                  fontSize: pxfit(12.5, extraWScale: 0.15, maxScale: 1.0, noLimitExtraWScale: 0.2),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Adapter(context: context);
    return CupertinoPageScaffold(
      child: Stack(
        children: [
          layerBackground(),
          layerSheet(),
        ],
      ),
    );
  }
}

class ToggleContent extends StatefulWidget {
  @override
  _ToggleContentState createState() => _ToggleContentState();
}
class _ToggleContentState extends State<ToggleContent> {
  bool showBadge = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: px(204),
          height: pxh(45),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    showBadge = true;
                  });
                },
                child: Container(
                  width: px(61),
                  height: pxh(19),
                  child: Row(
                    children: [
                      Container(
                        width: px(9),
                        height: pxh(19),
                        decoration: BoxDecoration(
                          color: showBadge ? SfssStyle.mainRed: Colors.grey,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      SizedBox(width: px(4)),
                      SfssWidget.text(
                        '徽章',
                        fontSize: pxfit(20),
                      ),
                    ],
                  ),
                ),
              ),
              SfssWidget.text(
                '/',
                fontSize: pxfit(20),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showBadge = false;
                  });
                },
                child: Container(
                  width: px(61),
                  height: pxh(19),
                  child: Row(
                    children: [
                      Container(
                        width: px(9),
                        height: pxh(19),
                        decoration: BoxDecoration(
                          color: showBadge ? Colors.grey : SfssStyle.mainRed,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                      SizedBox(width: px(4)),
                      SfssWidget.text(
                        '笔记',
                        fontSize: pxfit(20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: pxh(10)),
        showBadge ? BadgeContent() : NoteContent(),
      ],
    );
  }
}


class BadgeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRow(),
        buildRow(),
        buildRow(),
      ],
    );
  }

  Widget buildRow() {
    return Container(
      height: pxh(136),
      child: Row(
        children: [
          Expanded(
            flex: 49,
            child: Container(),
          ),
          buildCircle(),
          Expanded(
            flex: 20,
            child: Container(),
          ),
          buildCircle(),
          Expanded(
            flex: 20,
            child: Container(),
          ),
          buildCircle(),
          Expanded(
            flex: 49,
            child: Container(),
          ),
        ],
      ),
    );
  }

  Widget buildCircle() {
    return Expanded(
      flex: 84,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: px(84),
          height: px(84),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: SfssStyle().badgeLevelColors[0],
          ),
        ),
      ),
    );
  }
}


class NoteContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}