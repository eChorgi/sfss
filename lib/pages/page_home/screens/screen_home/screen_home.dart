import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sfss/data/device_data.dart';
import 'package:sfss/enums/solar_term_enums.dart';
import 'package:sfss/pages/page_home/screens/screen_community/widgets/user_post_card.dart';
import 'package:sfss/pages/page_home/screens/screen_home/widgets/popular_topics.dart';
import 'package:sfss/pages/page_home/screens/screen_home/widgets/record_overview.dart';
import 'package:sfss/pages/page_home/screens/screen_home/widgets/diet_progress.dart';
import 'package:sfss/pages/page_home/screens/screen_home/widgets/today_food_info.dart';
import 'package:sfss/plugins/adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/utils/animation_helper.dart';
import 'package:sfss/widgets/adaptive_list_views.dart';
import 'package:sfss/widgets/heatmap_calendar.dart';
import 'package:sfss/widgets/sfss_widget.dart';
import 'package:vibration/vibration.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({ Key? key }) : super(key: key);

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> with TickerProviderStateMixin {
  late AnimationController animController;
  late AnimationController animController1;
  late Animation<double> Function(double, double) f;
  late List<Animation<double>> slideOffsets;
  late Animation<double> bgOpacity;
  late List<Animation<double>> slideOpacities;

  late Animation<double> cardOffsetX;
  late Animation<double> cardOffsetY;
  late Animation<double> cardClickScale1;
  late Animation<double> cardClickScale2;
  late Animation<double> cardOutOpacity;
  late Animation<double> cardInOpacity;
  late Animation<double> cardOutScale;
  late Animation<double> cardRotate;
  late Animation<double> cardInScale;
  int index = SolarTerm.lidong.index;
  @override
  void initState() {
    
    super.initState();
    animController = AnimationController(
      duration: const Duration(milliseconds: 2400),
      vsync: this,
    )..forward();
    animController1 = AnimationController(
      duration: const Duration(milliseconds: 3600),
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
        parent: animController,
        curve: Interval(
          begin,
          end,
          curve: Curves.ease,
        ),
      ),
    );
    int intvNum = 5;
    slideOffsets = [];
    for(int i = 0; i < intvNum; i++) {
      double interval = 1/intvNum;
      var begin = 0.3*interval * i;
      var end = interval * (i + 1);

      if (begin < 0.0) begin = 0.0;
      if (end > 1) end = 1.0;
      slideOffsets.add(f(begin, end));
    }
    slideOpacities = [];
    for(int i = 0; i < intvNum; i++) {
      double interval = 1/intvNum;
      var begin = 0.9*interval * i;
      var end = interval * (i + 1);

      if (begin < 0.0) begin = 0.0;
      if (end > 1) end = 1;
      slideOpacities.add(f(begin, end));
    }
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        // index = (index+1)%24;
      });
    });
    var ff = 0.5;
    cardOffsetX = getAnimationGenerator(animController1, beginVal: 0, endVal: 0, curve: Curves.ease)(0, 1);
    cardOffsetY = getAnimationGenerator(animController1, curve: Curves.easeOutCubic, beginVal: 0, endVal: px(80))(ff*0.08, ff*0.4);
    cardClickScale1 = getAnimationGenerator(animController1, beginVal: 1, endVal: 1.1)(0, ff*0.03);
    cardClickScale2 = getAnimationGenerator(animController1, beginVal: 1, endVal: 1.0/1.1)(ff*0.03, ff*0.06);
    cardOutScale = getAnimationGenerator(animController1, beginVal: 1, endVal: 0, curve: Curves.easeInOutCubic)(ff*0.15, ff*0.45);
    cardOutOpacity = getAnimationGenerator(animController1, beginVal: 1, endVal: 0.6, curve: Curves.ease)(ff*0.15, ff*0.4);
    cardRotate = getAnimationGenerator(animController1, beginVal: 0, endVal: Random().nextDouble()*0.1-0.05, curve: Curves.easeOutBack)(0.0, ff*0.3);
    cardInScale = getAnimationGenerator(animController1, beginVal: 0, endVal: 1, curve: Curves.elasticOut)(0.5, 1);
  }
  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
  Widget slideAnimater({required int index, required Widget child}) {
    return Opacity(
      opacity: 1-slideOpacities[index].value,
      child: Transform(
        transform: Matrix4.rotationZ(slideOpacities[index].value*0.05)*Matrix4.translationValues(Adapter.adapter?.screenW()*(slideOffsets[index].value), 0, 0),
        child: child,
      ),
    );
  }

  Widget layerSheet() {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: Adapter.adapter?.screenH() - 55 - pxh(700) + px(30, extraHScale: -1.2)),
        child: Hero(
          tag: "sheet",
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,  
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
            ),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true, //去除顶部的空白
              child: ListView(
                clipBehavior: Clip.antiAlias,
                children: [
                  Column(
                    children: [
                      SizedBox(height: pxh(22, extraWScale: 0.15, maxScale: 1.2)),
                      slideAnimater(
                        index: 0,
                        child: SfssWidget.text(
                          '早上好，来一顿热腾腾的饭菜开启今天',
                          fontSize: pxfit(14, extraWScale: 0.1, maxScale: 1.2)
                        ),
                      ),
                      SizedBox(height: pxh(15, extraWScale: 0.3, maxScale: 1.2)),
                      
                      Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: pxh(104)),
                            child: slideAnimater(
                              index: 2,
                              child: Center(
                                child: SizedBox(
                                  width: px(305),
                                  height: px(216),
                                  child: const RecordOverview()
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: slideAnimater(
                              index: 1,
                              child: GestureDetector(
                                onTap: (){
                                  animController1.forward().then((value) {
                                    // animController1.reverse();
                                  });
                                  if(animController1.value == 0 && DeviceData.hasVibrator && DeviceData.hasAmplitudeControl){
                                    Vibration.vibrate(
                                      pattern: [20, 0],
                                      intensities: [80, 0],
                                    );
                                  }
                                },
                                child: SizedBox(
                                  width: px(309),
                                  height: px(84),
                                  child: AnimatedBuilder(
                                    animation: animController1,
                                    builder: (context, child) {
                                      return Stack(
                                        children: [
                                          Opacity(
                                            opacity: 1,
                                            child: Transform.scale(
                                              scale: cardInScale.value,
                                              child: TodayFoodInfo(solarTermIndex: index, checked: true,)
                                            ),
                                          ),
                                          Opacity(
                                            opacity: cardOutOpacity.value,
                                            child: Transform.translate(
                                              offset: Offset(cardOffsetX.value, cardOffsetY.value),
                                              child: Transform.rotate(
                                                angle: cardRotate.value,
                                                child: Transform.scale(
                                                  scale: cardClickScale1.value*cardClickScale2.value*cardOutScale.value,
                                                  child: TodayFoodInfo(solarTermIndex: index,)
                                                ),
                                              ),
                                            ),
                                          )
                                        ]
                                      );
                                    }
                                  ),
                                )
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: pxh(26)),
                      SizedBox(height: pxh(20)),
                      
                      slideAnimater(
                        index: 3,
                        child:  SizedBox(
                          width: px(306),
                          height: px(199),
                          child: PopularTopics(),
                        ),
                      ),
                      SizedBox(height: pxh(20)),
                      // slideAnimater(
                      //   index: 3,
                      //   child:  SizedBox(
                      //     width: px(304),
                      //     height: pxfit(168),
                      //     child: DietProgress(),
                      //   ),
                      // ),
                      // SizedBox(height: pxh(26)),
                      SizedBox(height: 100),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget layerBackground() {
    return Align(
      alignment: Alignment.topCenter,
      child: 
      Hero(
        tag: "background",
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
                    '立冬',
                    fontSize: pxfit(36, extraWScale: 0.15, maxScale: 1.0, noLimitExtraWScale: 0.2),
                    color: Colors.white,
                  ),
                  SizedBox(height: pxh(4, extraWScale: 0.8, maxScale: 1.5)),
                  SfssWidget.text(
                    '冬时韵悠长，烹茶品暗香。',
                    fontSize: pxfit(12.5, extraWScale: 0.15, maxScale: 1.0, noLimitExtraWScale: 0.2),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    Adapter(context: context);
    return CupertinoPageScaffold(
      child: AnimatedBuilder(
        animation: animController,
        builder: (context, child) {
          return Stack(
            children: [
              layerBackground(),
              layerSheet(),
            ],
          );
        },
      ),
    );
  }
}