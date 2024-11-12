import 'dart:math';

import 'package:extra_hittest_area/extra_hittest_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfss/enums/solar_term_enums.dart';
import 'package:sfss/pages/home/screens/community/user_post_card.dart';
import 'package:sfss/pages/home/screens/home/popular_topics.dart';
import 'package:sfss/pages/home/screens/home/record_overview.dart';
import 'package:sfss/pages/home/screens/home/diet_progress.dart';
import 'package:sfss/pages/home/screens/home/today_food_info.dart';
import 'package:sfss/plugins/adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/adaptive_list_views.dart';
import 'package:sfss/widgets/heatmap_calendar.dart';
import 'package:sfss/widgets/sfss_widget.dart';

class ScreenEditRecord extends StatefulWidget {
  final Function onClickBack;
  const ScreenEditRecord({ Key? key, required this.onClickBack }) : super(key: key);

  @override
  State<ScreenEditRecord> createState() => _ScreenEditRecordState();
}

class _ScreenEditRecordState extends State<ScreenEditRecord> with TickerProviderStateMixin {
  var teat;
  late AnimationController animController;
  late Animation<double> Function(double, double) f;
  late List<Animation<double>> slideOffsets;
  late Animation<double> bgOpacity;
  late List<Animation<double>> slideOpacities;
  @override
  void initState() {

    super.initState();
    animController = AnimationController(
      duration: const Duration(milliseconds: 2400),
      vsync: this,
    )..forward();
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
          child: Column(
            children: [
              SizedBox(
                height: pxh(67),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SizedBox(width: px(44),),
                    Padding(
                      padding: EdgeInsets.only(right: px(117)),
                      child: GestureDetectorHitTestWithoutSizeLimit(
                        extraHitTestArea: EdgeInsets.all(px(10)),
                        onTap: (){
                          widget.onClickBack();
                          setState(() {
                            teat = 1;
                          });
                        },
                        child: SizedBox(
                          width: px(10, maxScale: 1.5),
                          height: px(20, maxScale: 1.5),
                          child: SvgPicture.asset(
                            'assets/images/go_back.svg',
                          )
                        ),
                      ),
                    ),
                    SfssWidget.text(
                      '食记',
                      fontSize: pxfit(25, maxScale: 1.5)
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: px(80)),
                      child: Container(
                        width: px(56, maxScale: 1.5),
                        height: px(29, maxScale: 1.5),
                        decoration: BoxDecoration(
                          color: SfssStyle.mainRed,
                          borderRadius: BorderRadius.circular(px(7, maxScale: 1.5))
                        ),
                        child: Center(
                          child: SfssWidget.text(
                            '保存',
                            color: Colors.white,
                            fontSize: px(14)
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: pxh(55, maxScale: 1.5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: px(42)),
                    child: SizedBox(
                      height: pxh(27, maxScale: 1.5),
                      child: CupertinoTextField(
                        placeholderStyle: TextStyle(
                          color: const Color(0xFFA4AAB3),
                          fontFamily: SfssStyle.mainFont,
                          fontSize: px(20, maxScale: 1.5),
                        ),
                        style: TextStyle(
                          color: SfssStyle.mainGrey,
                          fontFamily: SfssStyle.mainFont,
                          fontSize: px(20, maxScale: 1.5),
                        ),
                        placeholder: '请输入标题',
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: px(42), top: px(10), right: px(42)),
                    child: SizedBox(
                      height: double.infinity,
                      child: CupertinoTextField(
                        maxLines: null,
                        strutStyle: StrutStyle(
                          height: 1.5
                        ),
                        textAlignVertical: TextAlignVertical.top,
                        placeholderStyle: TextStyle(
                          color: const Color(0xFFA4AAB3),
                          fontFamily: SfssStyle.mainFont,
                          fontSize: px(14, maxScale: 1.5),
                        ),
                        style: TextStyle(
                          color: SfssStyle.mainGrey,
                          fontFamily: SfssStyle.mainFont,
                          fontSize: px(14, maxScale: 1.5),
                        ),
                        placeholder: '请输入食记正文',
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              )
            ],
          ),
        )
      ),
    );
  }
  Widget layerBackground() {
    return Align(
      alignment: Alignment.topCenter,
      child: 
      Stack(
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
      )
    );
  }

  Widget layerButton(){
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: 127,
        child: Column(
          
          children: [
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: Row(
                children: [
                  SizedBox(
                    width: px(32),
                  ),
                  Container(
                    width: 43,
                    height: 43,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 15,
                        spreadRadius: -4
                      )]
                    ),
                    child: Center(
                      child: SizedBox(
                        height: 18,
                        width: 18,
                        child: SvgPicture.asset('assets/images/add_icon.svg')
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: px(293),
              height: 47,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 16,
                        height: 14,
                        child: SvgPicture.asset('assets/images/topic_icon.svg')
                      ),
                      SizedBox(width: 10,),
                      SfssWidget.text(
                        '话题',
                        fontSize: 14
                      )
                    ],
                  ),
                  Container(
                    height: 15,
                    width: 0.5,
                    color: const Color(0xFFA4AAB3),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 16,
                        height: 14,
                        child: SvgPicture.asset('assets/images/camera_icon.svg')
                      ),
                      SizedBox(width: 10,),
                      SfssWidget.text(
                        '拍摄',
                        fontSize: 14
                      )
                    ],
                  ),
                  Container(
                    height: 15,
                    width: 0.5,
                    color: const Color(0xFFA4AAB3),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 16,
                        height: 14,
                        child: SvgPicture.asset('assets/images/album_icon.svg')
                      ),
                      SizedBox(width: 10,),
                      SfssWidget.text(
                        '相册',
                        fontSize: 14
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Adapter(context: context);
    return CupertinoPageScaffold(
      child: AnimatedBuilder(
        animation: animController,
        builder: (context, child) {
          return GestureDetector(
            onVerticalDragUpdate: (details) {
              if(details.delta.distance > 10) {
                SystemChannels.textInput.invokeMethod('TextInput.hide');
              }
            },
            child: Stack(
              children: [
                layerBackground(),
                layerSheet(),
                layerButton()
              ],
            ),
          );
        },
      ),
    );
  }
}