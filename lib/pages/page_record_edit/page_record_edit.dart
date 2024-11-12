import 'dart:math';
import 'dart:ui';

import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:extra_hittest_area/extra_hittest_area.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:sfss/enums/solar_term_enums.dart';
import 'package:sfss/pages/home/page_home.dart';
import 'package:sfss/plugins/adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/utils/animation_helper.dart';
import 'package:sfss/widgets/no_animation_page_roughter.dart';
import 'package:sfss/widgets/sfss_widget.dart';

class PageRecordEdit extends StatefulWidget {
  const PageRecordEdit({super.key});
  @override
  State<PageRecordEdit> createState() => _PageRecordEditState();
}

class _PageRecordEditState extends State<PageRecordEdit> with TickerProviderStateMixin {
  bool isLoginShow = false;
  late AnimationController animController1;
  late Animation<double> opacity;

  late AnimationController animController2;

  late AnimationController animController3;

  late TextEditingController controller = TextEditingController();


  
  @override
  void initState() {
    super.initState();
    animController1 = AnimationController(
      duration: const Duration(milliseconds: 450),
      vsync: this,
    );
    Future.delayed(const Duration(milliseconds: 250), () {
      animController1.forward();
    });
    animController2 = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    animController3 = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    );
    
    var f = getAnimationGenerator(animController1);
    opacity = f(0, 1);
    // f = (double begin, double end) => Tween<double>(
    //   begin: 1.0,
    //   end: 0.0,
    // ).animate(
    //   CurvedAnimation(
    //     parent: animController1,
    //     curve: Interval(
    //       begin,
    //       end,
    //       curve: Curves.ease,
    //     ),
    //   ),
    // );

    // int intvNum = 5;
    // opacities = [];
    // for(int i = 0; i < intvNum; i++) {
    //   double interval = 0.6/intvNum;
    //   var begin = 0.1*interval * i;
    //   var end = interval * (i + 1);

    //   if (begin < 0.0) begin = 0.0;
    //   if (end > 0.4) end = 1.0;
    //   opacities.add(f(begin, end));
    // }
    // offsetUp = f(0.36, 0.76);
    // bgOpacity = f(0.5, 1);


    // f = (double begin, double end) => Tween<double>(
    //   begin: 1.0,
    //   end: 0.0,
    // ).animate(
    //   CurvedAnimation(
    //     parent: animController2,
    //     curve: Interval(
    //       begin,
    //       end,
    //       curve: Curves.ease,
    //     ),
    //   ),
    // );
    // intvNum = 8;
    // slideLefts = [];
    // for(int i = 0; i < intvNum; i++) {
    //   double interval = 1/intvNum;
    //   var begin = 0.1*interval * i;
    //   var end = interval * (i + 1);

    //   if (begin < 0.0) begin = 0.0;
    //   if (end > 1) end = 1.0;
    //   slideLefts.add(f(begin, end));
    // }
    // slideOpacities = [];
    // for(int i = 0; i < intvNum; i++) {
    //   double interval = 0.25/intvNum;
    //   var begin = 0.1*interval * i;
    //   var end = interval * (i + 1);

    //   if (begin < 0.0) begin = 0.0;
    //   if (end > 0.25) end = 0.25;
    //   slideOpacities.add(f(begin, end));
    // }
    // loadingScale = f(0.3, 0.5);

    // pushUpOffset = f(0.15, 0.35);

    // f = (double begin, double end) => Tween<double>(
    //   begin: 1.0,
    //   end: 0.0,
    // ).animate(
    //   CurvedAnimation(
    //     parent: animController3,
    //     curve: Interval(
    //       begin,
    //       end,
    //       curve: Curves.ease,
    //     ),
    //   ),
    // );
    // loadingLeaveScale = f(0.0, 1.0);

  }
  @override
  void dispose() {
    animController1.dispose();
    super.dispose();
  }
  Widget layerButton(){
    return Opacity(
      opacity: opacity.value,
      child: SafeArea(
        child: Align(
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
        ),
      ),
    );
  }
  Widget layerTabBarHero() {
    return Align(
      alignment: Alignment(0.0, 1.3),
      child: Hero(
        tag: 'tabBar',
        child: Container(
          width: double.infinity,
          height: 70,
          color: Colors.white,
        ),
      ),
    );
  }
  Widget layerSheet() {
    return SafeArea(
      child: Align(
        alignment: Alignment.topCenter,
          child: Padding(
          padding: EdgeInsets.zero,//.only(top: Adapter.adapter?.screenH() - 55 - pxh(700) + px(30, extraHScale: -1.2)),
          child: Hero(
            tag: 'sheet',
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
                            extraHitTestArea: EdgeInsets.all(px(20)),
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Transform.rotate(
                              angle: -pi/2,
                              child: SizedBox(
                                width: px(10, maxScale: 1.5),
                                height: px(20, maxScale: 1.5),
                                child: SvgPicture.asset(
                                  'assets/images/go_back.svg',
                                )
                              ),
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
                          child: ClipRect(
                            child: Column(
                              children: [
                                Expanded(
                                  child: CupertinoTextField(
                                    clipBehavior: Clip.none,
                                    // padding: EdgeInsets.only(bottom: 40),
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
                                SizedBox(height: 55,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ),
                  SizedBox(height: pxh(100)-55,),
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
        tag: 'background',
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
                    (ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?)?["title"] ?? '立冬',
                    fontSize: pxfit(36, extraWScale: 0.15, maxScale: 1.0, noLimitExtraWScale: 0.2),
                    color: Colors.white,
                  ),
                  SizedBox(height: pxh(4, extraWScale: 0.8, maxScale: 1.5)),
                  SfssWidget.text(
                    (ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?)?["subTitle"] ?? '立冬',
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
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          if(details.delta.distance > 10) {
            SystemChannels.textInput.invokeMethod('TextInput.hide');
          }
          if(details.delta.dy > 10) {
            // Navigator.of(context).pop();
          }
        },
        child:  AnimatedBuilder(
          animation: animController1,
          builder: (context, child) {
            return Stack(
              children: [
                layerBackground(),
                layerSheet(),
                layerButton(),
                layerTabBarHero(),
              ],
            );
          },
        ),
      ),
    );
  }
}