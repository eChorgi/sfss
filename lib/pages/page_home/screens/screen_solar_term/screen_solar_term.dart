import 'dart:math';

import 'package:extra_hittest_area/extra_hittest_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfss/data/device_data.dart';
import 'package:sfss/data/sfss_data.dart';
import 'package:sfss/enums/solar_term_enums.dart';
import 'package:sfss/pages/page_home/screens/screen_solar_term/widgets/badge_display.dart';
import 'package:sfss/pages/page_home/screens/screen_solar_term/widgets/food_card.dart';
import 'package:sfss/plugins/adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/adaptive_columns.dart';
import 'package:sfss/widgets/adaptive_list_views.dart';
import 'package:sfss/widgets/sfss_widget.dart';
import 'package:sfss/widgets/solar_term_badge.dart';
import 'package:sfss/widgets/top_toggle.dart';
import 'package:vibration/vibration.dart';

class ScreenSolarTerm extends StatefulWidget {
  const ScreenSolarTerm({ Key? key }) : super(key: key);

  @override
  State<ScreenSolarTerm> createState() => _ScreenSolarTermState();
}

class _ScreenSolarTermState extends State<ScreenSolarTerm> with TickerProviderStateMixin {
  int index = 0;
  int solarTermIndex = 0;
  bool isShowAll = true;
  List<bool> isCardShown = [];
  int cnt = 0;
  List<bool> vibrationFlag = List.generate(24, (_)=>true);
  List<int> sumOfData = [];
  List<bool> selectSolorTerms = List.generate(24, (index) => false);
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
    sumOfData.add(0);
    for (int i = 1; i <= 24; i ++) {
      sumOfData.add(sumOfData[i-1]+SfssData.testData[i-1].length);
    }
    isCardShown = List.generate(sumOfData[24], (index) => true);
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
      loadAnimController.addListener(() {
      if (loadAnimController.value > end && vibrationFlag[i]) {
          if(DeviceData.hasVibrator && DeviceData.hasAmplitudeControl){
            Vibration.vibrate(
              pattern: [20, 0],
              intensities: [64, 0],
            );
          }
          vibrationFlag[i] = false;
        }
      });
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
    isShowAll = selectSolorTerms.every((element) => !element);
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: Adapter.adapter?.screenH() - 55 - pxh(700) + px(30, extraHScale: -1.2)),
        child: Hero(
          tag: "sheet",
          child: Container(
            height: pxh(700) + px(30, extraHScale: -1.2),
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
                  names: const ['徽章','卡片'], 
                  // contents: [],
                  onTap: (i) {
                    setState(() {
                      index = i;
                    });
                  },
                ),
                Expanded(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true, //去除顶部的空白
                    child: [
                      AdaptiveListViews(
                        padding: EdgeInsets.only(left: px(20), right: px(20)),
                        maxWidth: 80,
                        minWidth: 80,
                        spacingW: px(20),
                        spacingH: px(23),
                        children: [
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
                      Column(
                        children: [
                          Stack(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: SfssWidget.text(
                                  '立冬',
                                  fontSize: px(24, maxScale: 1.5)
                                ),
                              ),
                              Align(
                                alignment: const Alignment(0.8, -1.0),
                                child: GestureDetectorHitTestWithoutSizeLimit(
                                  extraHitTestArea: EdgeInsets.all(px(10)),
                                  onTap: (){
                                    showCupertinoModalPopup(context: context, 
                                      builder: (context){
                                        return GestureDetectorHitTestWithoutSizeLimit(
                                          extraHitTestArea: EdgeInsets.all(px(10)),
                                          onVerticalDragUpdate: (details) {
                                            if(details.delta.distance > 20) {
                                              Navigator.of(context).pop();
                                            }
                                          },
                                          child: Container(
                                            height: px(484),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(23),
                                                topRight: Radius.circular(23),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(height: px(34),),
                                                Container(
                                                  width: px(50),
                                                  height: px(4),
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFD9D9D9),
                                                    borderRadius: BorderRadius.circular(px(4))
                                                  ),
                                                ),
                                                SizedBox(height: px(19),),
                                                SfssWidget.text(
                                                  '类型选择',
                                                  fontSize: px(20, maxScale: 1.5)
                                                ),
                                                SizedBox(height: px(12),),
                                                Container(
                                                  height: 0.53,
                                                  width: px(261),
                                                  color: Color(0xFFC4C6CB),
                                                ),
                                                SizedBox(height: px(36),),
                                                Padding(
                                                  padding: EdgeInsets.only(left: px(35), right: px(35)),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      for(int i = 0; i < 4; i ++)
                                                      Column(
                                                        children: [
                                                          for (int j = 0; j < 6; j ++)
                                                          StatefulBuilder(
                                                            builder: (context, setStateChild)=>GestureDetector(
                                                              onTap: (){
                                                                setState(() {
                                                                  setStateChild(() {
                                                                    selectSolorTerms[i+j*4] = !selectSolorTerms[i+j*4];
                                                                  });
                                                                });
                                                              },
                                                              child: Padding(
                                                                padding: EdgeInsets.only(bottom: px(21.4)),
                                                                child: Container(
                                                                  width: px(76),
                                                                  height: px(28),
                                                                  decoration: BoxDecoration(
                                                                    color: selectSolorTerms[i+j*4]?SfssStyle.solarTermColors[i+j*4][2]:Color(0xFFFBFAFA),
                                                                    borderRadius: BorderRadius.circular(px(8)),
                                                                  ),
                                                                  child: Center(
                                                                    child: SfssWidget.text(
                                                                      solarTermName[i+j*4],
                                                                      fontSize: px(16),
                                                                      color: selectSolorTerms[i+j*4]?Colors.white:null
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ]
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }
                                    );
                                  },
                                  child: Container(
                                    width: px(68.5, maxScale: 1.5),
                                    height: px(25, maxScale: 1.5),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFBFAFA),
                                      borderRadius: BorderRadius.circular(px(25, maxScale: 1.5)),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(width: px(16, maxScale: 1.5)),
                                        SfssWidget.text(
                                          '节气',
                                          fontSize: px(15, maxScale: 1.5)
                                        ),
                                        SizedBox(width: px(8, maxScale: 1.5),),
                                        SvgPicture.asset(
                                          'assets/images/arrow_down.svg',
                                          width: px(9.5, maxScale: 1.5),
                                          height: px(5.28, maxScale: 1.5),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          
                          SizedBox(height: pxh(28),),
                          Expanded(
                            child: AdaptiveListViews(
                              padding: EdgeInsets.only(left: px(20), right: px(20)),
                              maxWidth: 150,
                              minWidth: 150,
                              children: [
                              for(int i = 0; i < 24; i += 1)
                                if(selectSolorTerms[i] || isShowAll == true)
                                for (int j = 0; j < SfssData.testData[i].length; j += 1)
                                Builder(
                                  builder: (context) {
                                    var id = sumOfData[i]+j;
                                    return FoodCard(
                                      id: id,
                                      name: SfssData.testData[i][j]['name'].toString(), 
                                      desc: SfssData.testData[i][j]['desc'].toString(), 
                                      solarTermIndex: i,
                                      onAnim: (id) {
                                        isCardShown[id] = true;
                                      },
                                      judgeAnimationEnable: (id){
                                        return !isCardShown[id];
                                      },
                                    );
                                  }
                                )
                                
                                // else
                                // for (int i = 0; i < SfssData.testData[solarTermIndex].length; i += 1)
                                //   SfssWidget.card(
                                //     width: px(100),
                                    
                                //     colors: SfssStyle.solarTermColors[solarTermIndex],
                                //     child: Column(
                                //       children: [
                                //         Padding(
                                //           padding: EdgeInsets.only(top: px(23.0, maxScale: 1)),
                                //           child: SfssWidget.text(
                                //             SfssData.testData[solarTermIndex][i]['name'].toString(),
                                //             fontSize: px(24, maxScale: 1.5),
                                //             color: Colors.white
                                //           ),
                                //         ),
                                //         Padding(
                                //           padding: EdgeInsets.only(top: px(0.0, maxScale: 1), left: px(20, maxScale: 1), right: px(20, maxScale: 1), bottom: px(22, maxScale: 1)),
                                //           child: SfssWidget.text(
                                //             SfssData.testData[solarTermIndex][i]['desc'].toString(),
                                //             fontSize: px(10, maxScale: 1.5),
                                //             color: Colors.white,
                                //             maxLines: 2,
                                //             overflow: TextOverflow.ellipsis,
                                //             strutStyle: StrutStyle(
                                //               height: 2
                                //             ),
                                //             textAlign: TextAlign.center
                                //           ),
                                //         ),
                                //       ]
                                //     )
                                //   )
                              ]
                            ),
                          )
                        ],
                      )
                    ][index],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget layerBackground() {
    return Align(
      alignment: Alignment.topCenter,
      child: Hero(
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