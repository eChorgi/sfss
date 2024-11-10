import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sfss/pages/home/screens/solar_term/badge_display.dart';
import 'package:sfss/plugins/adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/adaptive_list_views.dart';
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
  late AnimationController loadAnimController;
  late Animation<double> Function(double, double) f;
  late List<Animation<double>> slideOffsets;
  late List<Animation<double>> slideOpacities;
  late List<Animation<double>> slideScales;

  late AnimationController clickAnimController;
  late Animation<double> clickOffset;
  late Animation<double> clickScale;

  @override
  void initState() {

    super.initState();
    loadAnimController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..forward();
    clickAnimController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    // Future.delayed(Duration(seconds: 1), (){
    //   animController.forward();
    // });
    f = (double begin, double end) => Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: loadAnimController,
        curve: Interval(
          begin,
          end,
          curve: Curves.ease,
        ),
      ),
    );
    int intvNum = 24;
    slideOffsets = [];
    for(int i = 0; i < intvNum; i++) {
      double interval = 1/intvNum;
      var begin = 0.2*interval * i;
      var end = 1*interval * (i + 1);

      if (begin < 0.0) begin = 0.0;
      if (end > 1) end = 1.0;
      slideOffsets.add(f(begin, end));
    }
    slideOpacities = [];
    for(int i = 0; i < intvNum; i++) {
      double interval = 1/intvNum;
      var begin = 0.4*interval * i;
      var end = interval * (i + 1);

      if (begin < 0.0) begin = 0.0;
      if (end > 1) end = 1;
      slideOpacities.add(f(begin, end));
    }
    f = (double begin, double end) => Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: loadAnimController,
        curve: Interval(
          begin,
          end,
          curve: Curves.easeOutBack,
        ),
      ),
    );
    slideScales = [];
    for(int i = 0; i < intvNum; i++) {
      double interval = 1/intvNum;
      var begin = 0.9*interval * i;
      var end = interval * (i + 1);

      if (begin < 0.0) begin = 0.0;
      if (end > 1) end = 1;
      slideScales.add(f(begin, end));
    }


    f = (double begin, double end) => Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: clickAnimController,
        curve: Interval(
          begin,
          end,
          curve: Curves.easeOutBack,
        ),
      ),
    );
    clickOffset = f(0, 1);
    
  }
  Widget slideAnimater({required int index, required Widget child}) {
    return Transform.scale(
      scale: slideScales[index].value,
      child: Opacity(
        opacity: 1-slideOpacities[index].value,
        child: Transform.translate(
          offset: Offset(0, Adapter.adapter?.screenW()*(slideOffsets[index].value)),
          child: child,
        ),
      ),
    );
  }
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
              // contents: [],
              onTap: (i) {
                index = i;
              },
            ),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true, //去除顶部的空白
                child: Padding(
                  padding: EdgeInsets.only(left: px(40), right: px(40)),
                  child: AdaptiveListViews(
                    maxWidth: 80,
                    minWidth: 80,
                    spacingW: px(20),
                    spacingH: px(23),
                    chilren: [
                      for (int i = 0; i < 24; i +=1)...[
                        slideAnimater(
                          index: i,
                          child: SizedBox(
                            width: px(100),
                            child: BadgeDisplay(index: i,current: (2*i+i*i+i~/3+i*i*i)%51,total: 50,)
                          ),
                        ),
                      ]
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
    return AnimatedBuilder(
      animation: loadAnimController,
      builder: (context, child)=>CupertinoPageScaffold(
        child: Stack(
          children: [
            layerBackground(),
            layerSheet(),
          ],
        ),
      )
    );
  }
}