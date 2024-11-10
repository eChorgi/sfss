import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sfss/plugins/adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/sfss_widget.dart';
import 'package:sfss/widgets/solar_term_badge.dart';
import 'package:sfss/widgets/top_toggle.dart';

class ScreenSolarTerm extends StatefulWidget {
  const ScreenSolarTerm({ Key? key }) : super(key: key);

  @override
  State<ScreenSolarTerm> createState() => _ScreenSolarTermState();
}

class _ScreenSolarTermState extends State<ScreenSolarTerm> with TickerProviderStateMixin {
  int index = 0;
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
        child: Column(
          children: [
            TopToggle(
              names: const ['徽章','笔记'], 
              contents: [
              ],
              onTap: (i) {
                index = i;
              },
            ),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true, //去除顶部的空白
                child: ListView(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 100,
                          child: SolarTermBadge()
                        )
                      ],
                    ),
                  ],
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

class BadgeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      ],
    );
  }
}