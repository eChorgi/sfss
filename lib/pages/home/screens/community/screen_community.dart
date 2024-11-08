import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sfss/pages/home/screens/community/user_post_card.dart';
import 'package:sfss/pages/home/wigets/diet_progress.dart';
import 'package:sfss/plugins/adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/sfss_widget.dart';


class ScreenCommunity extends StatefulWidget {
  const ScreenCommunity({ Key? key }) : super(key: key);

  @override
  State<ScreenCommunity> createState() => _ScreenCommunityState();
}

class _ScreenCommunityState extends State<ScreenCommunity> with TickerProviderStateMixin {
  late AnimationController animController;
  late Animation<double> Function(double, double) f;
  late List<Animation<double>> slideOffsets;
  late List<Animation<double>> slideOpacities;
  @override
  void initState() {
    super.initState();
    animController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
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
    int intvNum = 7;
    slideOffsets = [];
    for(int i = 0; i < intvNum; i++) {
      double interval = 1/intvNum;
      var begin = 0.1*interval * i;
      var end = interval * (i + 1);

      if (begin < 0.0) begin = 0.0;
      if (end > 1) end = 1.0;
      slideOffsets.add(f(begin, end));
    }
    slideOpacities = [];
    for(int i = 0; i < intvNum; i++) {
      double interval = 0.25/intvNum;
      var begin = 0.1*interval * i;
      var end = interval * (i + 1);

      if (begin < 0.0) begin = 0.0;
      if (end > 0.25) end = 0.25;
      slideOpacities.add(f(begin, end));
    }
  }
  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }
  Widget layerSheet(int indexSelected) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Hero(
        tag: "loginSheetToMainSheet",
        child: Container(
          height: pxh(680)-px(20, extraHScale: -1.2),
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
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: pxh(50,maxScale: 1),
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          height: pxh(35,maxScale: 1),
                          width: px(319),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: px(23, maxScale: 1),),
                              // Column(
                              //   children: [
                              //     SizedBox(height: 9,),
                              SfssWidget.text(
                              "推荐",
                              fontSize: px(15, maxScale:1),
                              color: indexSelected==0?SfssStyle.mainRed:SfssStyle.mainGrey
                              ),
                              //     SizedBox(height: 6,),
                              //     Container(
                              //       height: 2,
                              //       width: 23,
                              //       decoration: BoxDecoration(
                              //         color: indexSelected==0?SfssStyle.mainRed:Colors.transparent,
                              //         borderRadius: BorderRadius.circular(12),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              SfssWidget.text(
                              "/",
                              fontSize: px(12, maxScale:1),
                              color: SfssStyle.mainGrey
                              ),
                              SfssWidget.text(
                              "菜谱",
                              fontSize: px(15, maxScale:1),
                              color: indexSelected==1?SfssStyle.mainRed:SfssStyle.mainGrey
                              ),
                              SfssWidget.text(
                              "/",
                              fontSize: px(12, maxScale:1),
                              color: SfssStyle.mainGrey
                              ),
                              SfssWidget.text(
                              "饮食",
                              fontSize: px(15, maxScale:1),
                              color: indexSelected==2?SfssStyle.mainRed:SfssStyle.mainGrey
                              ),
                              SfssWidget.text(
                              "/",
                              fontSize: px(12, maxScale:1),
                              color: SfssStyle.mainGrey
                              ),
                              SfssWidget.text(
                              "关注",
                              fontSize: px(15, maxScale:1),
                              color: indexSelected==3?SfssStyle.mainRed:SfssStyle.mainGrey
                              ),
                              SizedBox(width: px(8),),
                              Image.asset("assets/images/Ellipse 2.png", width: px(35, maxScale: 1), height: px(35, maxScale:1),),
                              
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(right: px(34)),
                        child: Container(
                          height: 0.9,
                          width: px(247),
                          color: const Color(0xFFC4C6CB),
                        ),
                      ),
                    ),
                    SizedBox(height: pxh(15, extraWScale: 0.3, maxScale: 1.2)),
                    SizedBox(
                      width: 202,
                      height: 402 ,
                        child: UserPostCard()
                    )
                    
                  ],
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
      child: Container(
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
              '坊间',
              fontSize: pxfit(36, extraWScale: 0.15, maxScale: 1.0, noLimitExtraWScale: 0.2),
              color: Colors.white,
            ),
            SizedBox(height: pxh(4, extraWScale: 0.8, maxScale: 1.5)),
            SfssWidget.text(
              '秋风摇黄叶，炉火煮新茶。',
              fontSize: pxfit(12.5, extraWScale: 0.15, maxScale: 1.0, noLimitExtraWScale: 0.2),
              color: Colors.white,
            ),
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
          return Stack(
            children: [
              layerBackground(),
              layerSheet(0),
            ],
          );
        },
      ),
    );
  }
}