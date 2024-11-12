import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sfss/enums/solar_term_enums.dart';
import 'package:sfss/pages/page_home/screens/screen_community/widgets/user_post_card.dart';
import 'package:sfss/pages/page_home/screens/screen_home/widgets/popular_topics.dart';
import 'package:sfss/pages/page_home/screens/screen_home/widgets/record_overview.dart';
import 'package:sfss/pages/page_home/screens/screen_home/widgets/diet_progress.dart';
import 'package:sfss/pages/page_home/screens/screen_home/widgets/today_food_info.dart';
import 'package:sfss/plugins/adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/adaptive_columns.dart';
import 'package:sfss/widgets/adaptive_list_views.dart';
import 'package:sfss/widgets/diet_display.dart';
import 'package:sfss/widgets/heatmap_calendar.dart';
import 'package:sfss/widgets/sfss_widget.dart';


class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(covariant _SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxExtent || minHeight != oldDelegate.minExtent || child != oldDelegate.child;
  }
}
class ScreenHistory extends StatefulWidget {
  const ScreenHistory({ Key? key }) : super(key: key);

  @override
  State<ScreenHistory> createState() => _ScreenHistoryState();
}

class _ScreenHistoryState extends State<ScreenHistory> with TickerProviderStateMixin {
  late AnimationController animController;
  late Animation<double> Function(double, double) f;
  late List<Animation<double>> slideOffsets;
  late Animation<double> bgOpacity;
  late List<Animation<double>> slideOpacities;
  int index = 0;
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
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        index = (index+1)%24;
      });
    });
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
    print(1-slideOpacities[0].value);
    return Align(
      alignment: Alignment.topCenter,
      child: Hero(
        tag: "sheet",
        child: CustomScrollView(
          clipBehavior: Clip.antiAlias,
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(height: Adapter.adapter?.screenH() - 55 - pxh(700) + px(30, extraHScale: -1.2),),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                minHeight: pxh(74+MediaQuery.of(context).padding.top, maxScale: 1.5),
                maxHeight: pxh(101+MediaQuery.of(context).padding.top, maxScale: 1.5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22),
                    )
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: pxh(17, maxScale: 1.5)+MediaQuery.of(context).padding.top),
                      Expanded(
                        child: Container(
                          height: pxh(77, maxScale: 1.5),
                          width: pxh(77, maxScale: 1.5),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/avatar_echorgi.png'),
                            ),
                            shape: BoxShape.circle
                          ),
                        ),
                      ),
                      SizedBox(height: pxh(7, maxScale: 1.5)),
                    ],
                  ),
                ),
              
              )
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    // SizedBox(height: pxh(17, maxScale: 1.5)),
                    // Container(
                    //   height: pxh(77, maxScale: 1.5),
                    //   width: pxh(77, maxScale: 1.5),
                    //   decoration: BoxDecoration(
                    //     image: DecorationImage(
                    //       image: AssetImage('assets/images/avatar_echorgi.png'),
                    //     ),
                    //     shape: BoxShape.circle
                    //   ),
                    // ),
                    SfssWidget.text(
                      '旺旺君贝',
                      fontSize: pxh(20, maxScale: 1.5),
                    ),
                    SizedBox(height: pxh(4, maxScale: 1.5)),
                    SfssWidget.text(
                      '爱吃好吃滴',
                      fontSize: pxh(12, maxScale: 1.5),
                      color: const Color(0xFFAEB3BB),
                    ),
                    SizedBox(height: pxh(12, maxScale: 1.5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            SfssWidget.text(
                              '22',
                              fontSize: pxh(16, maxScale: 1.5),
                            ),
                            SizedBox(height: pxh(8, maxScale: 1.5)),
                            SfssWidget.text(
                              '记录',
                              fontSize: pxh(16, maxScale: 1.5),
                            ),
                          ],
                        ),
                        SizedBox(width: pxh(60, maxScale: 1.5)),
                        Column(
                          children: [
                            SfssWidget.text(
                              '92',
                              fontSize: pxh(16, maxScale: 1.5),
                            ),
                            SizedBox(height: pxh(8, maxScale: 1.5)),
                            SfssWidget.text(
                              '卡片',
                              fontSize: pxh(16, maxScale: 1.5),
                            ),
                          ],
                        ),
                        SizedBox(width: pxh(60, maxScale: 1.5)),
                        Column(
                          children: [
                            SfssWidget.text(
                              '102',
                              fontSize: pxh(16, maxScale: 1.5),
                            ),
                            SizedBox(height: pxh(8, maxScale: 1.5)),
                            SfssWidget.text(
                              '徽章',
                              fontSize: pxh(16, maxScale: 1.5),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: pxh(10, maxScale: 1.5)),
                    SizedBox(
                      height: pxh(110, maxScale: 1.5),
                      width: pxh(304, maxScale: 1.5),
                      child: DietDisplay()
                    ),
                    SizedBox(height: pxh(13, maxScale: 1.5)),
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                minHeight: pxh(50, maxScale: 1.5),
                maxHeight: pxh(50, maxScale: 1.5),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                      SizedBox(width: px(50, maxScale: 1.5)),
                      SizedBox(
                        height: pxh(22, maxScale: 1.5),
                        child: Column(
                          children: [
                            SfssWidget.text(
                              '精选',
                              fontSize: pxh(16, maxScale: 1.5),
                              color: SfssStyle.mainRed
                            ),
                            SizedBox(height: 4,),
                            Container(
                              width: px(18, maxScale: 1.5),
                              height: px(2, maxScale: 1.5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(px(4)),
                                color: SfssStyle.mainRed
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: px(26, maxScale: 1.5),),
                      SizedBox(
                        height: pxh(22, maxScale: 1.5),
                        child: Column(
                          children: [
                            SfssWidget.text(
                              '纵览',
                              fontSize: pxh(16, maxScale: 1.5),
                              color: SfssStyle.mainGrey
        
                            ),
                            SizedBox(height: 4,),
                            Container(
                              width: px(18, maxScale: 1.5),
                              height: px(2, maxScale: 1.5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(px(4)),
                                color: Colors.transparent
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: px(26, maxScale: 1.5),),
                      SizedBox(
                        height: pxh(22, maxScale: 1.5),
                        child: Column(
                          children: [
                            SfssWidget.text(
                              '图鉴',
                              fontSize: pxh(16, maxScale: 1.5),
                              color: SfssStyle.mainGrey
        
                            ),
                            SizedBox(height: 4,),
                            Container(
                              width: px(18, maxScale: 1.5),
                              height: px(2, maxScale: 1.5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(px(4)),
                                color: Colors.transparent
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: AdaptiveColumns(
                  spacingH: px(10),
                  children: [
                    UserPostCard(imageUrl: 'assets/images/foods/0.jpg', avatarUrl: 'assets/images/foods/0.jpg', title: '炒年糕🍚，让人垂涎欲滴的美味', likeCount: 12, userName: '美食达人小张🍴',),
                    UserPostCard(imageUrl: 'assets/images/foods/1.jpg', avatarUrl: 'assets/images/foods/1.jpg', title: '午后蛋糕🍰，惬意时光', likeCount: 12, userName: '甜品爱好者🍩',),
                    UserPostCard(imageUrl: 'assets/images/foods/2.jpg', avatarUrl: 'assets/images/foods/2.jpg', title: '深夜食堂🌙，下雨天自制冰饮和日式拉面更配哦', likeCount: 12, userName: '夜宵达人🍜',),
                    UserPostCard(imageUrl: 'assets/images/foods/3.jpg', avatarUrl: 'assets/images/foods/3.jpg', title: '午后沙拉🥗一人食，享受片刻的宁静', likeCount: 12, userName: '孤独美食家🍴',),
                    UserPostCard(imageUrl: 'assets/images/foods/4.jpg', avatarUrl: 'assets/images/foods/4.jpg', title: '秋日蟹黄🦀，鲜美无比', likeCount: 12, userName: '海鲜探索者🦐',),
                    UserPostCard(imageUrl: 'assets/images/foods/5.jpg', avatarUrl: 'assets/images/foods/5.jpg', title: '虾仁番茄拉面🍜，美味无敌', likeCount: 12, userName: '拉面大师🍜',),
                    UserPostCard(imageUrl: 'assets/images/foods/6.jpg', avatarUrl: 'assets/images/foods/6.jpg', title: '晨光鸡蛋面🍜，满满幸福感', likeCount: 12, userName: '早餐专家🍳',),
                    UserPostCard(imageUrl: 'assets/images/foods/7.jpg', avatarUrl: 'assets/images/foods/7.jpg', title: '炸鸡火鸡面🍗，香辣美味', likeCount: 12, userName: '炸鸡爱好者🍗',),
                    UserPostCard(imageUrl: 'assets/images/foods/8.jpg', avatarUrl: 'assets/images/foods/8.jpg', title: '精致日式午餐🍱，享受美好时光', likeCount: 12, userName: '日式美食家🍣',),
                    UserPostCard(imageUrl: 'assets/images/foods/9.jpg', avatarUrl: 'assets/images/foods/9.jpg', title: '牛排意面🍝，再冲一包挂耳咖啡☕', likeCount: 12, userName: '西餐爱好者🍝',),
                    UserPostCard(imageUrl: 'assets/images/foods/10.jpg', avatarUrl: 'assets/images/foods/10.jpg', title: '在家自制鸡公煲🍲，不输饭店', likeCount: 12, userName: '水果达人🍉',),
                    UserPostCard(imageUrl: 'assets/images/foods/11.jpg', avatarUrl: 'assets/images/foods/11.jpg', title: '小蛋糕🧁，治愈一切', likeCount: 12, userName: '甜点大师🍰',),
                    UserPostCard(imageUrl: 'assets/images/foods/12.jpg', avatarUrl: 'assets/images/foods/12.jpg', title: '麦门🍔，快餐迷的最爱', likeCount: 12, userName: '快餐迷🍟',),
                    UserPostCard(imageUrl: 'assets/images/foods/13.jpg', avatarUrl: 'assets/images/foods/13.jpg', title: '大口汉堡🍔，满足感爆棚', likeCount: 12, userName: '汉堡控🍔',),
                    UserPostCard(imageUrl: 'assets/images/foods/14.jpg', avatarUrl: 'assets/images/foods/14.jpg', title: '鸡蛋炒面', likeCount: 12, userName: '炒面高手',),
                    UserPostCard(imageUrl: 'assets/images/foods/15.jpg', avatarUrl: 'assets/images/foods/15.jpg', title: '芋圆西米露，香甜顺滑', likeCount: 12, userName: '甜品探索者',),
                    UserPostCard(imageUrl: 'assets/images/foods/0.jpg', avatarUrl: 'assets/images/foods/0.jpg', title: '炒年糕，让人垂涎欲滴的美味', likeCount: 12, userName: '美食达人小张',),
                    UserPostCard(imageUrl: 'assets/images/foods/1.jpg', avatarUrl: 'assets/images/foods/1.jpg', title: '午后蛋糕惬意时光', likeCount: 12, userName: '甜品爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/2.jpg', avatarUrl: 'assets/images/foods/2.jpg', title: '深夜食堂，下雨天自制冰饮和日式拉面更配哦', likeCount: 12, userName: '夜宵达人',),
                    UserPostCard(imageUrl: 'assets/images/foods/3.jpg', avatarUrl: 'assets/images/foods/3.jpg', title: '午后沙拉一人食，享受片刻的宁静', likeCount: 12, userName: '孤独美食家',),
                    UserPostCard(imageUrl: 'assets/images/foods/4.jpg', avatarUrl: 'assets/images/foods/4.jpg', title: '秋日蟹黄', likeCount: 12, userName: '海鲜探索者',),
                    UserPostCard(imageUrl: 'assets/images/foods/5.jpg', avatarUrl: 'assets/images/foods/5.jpg', title: '虾仁番茄拉面', likeCount: 12, userName: '拉面大师',),
                    UserPostCard(imageUrl: 'assets/images/foods/6.jpg', avatarUrl: 'assets/images/foods/6.jpg', title: '晨光鸡蛋面，满满幸福感', likeCount: 12, userName: '早餐专家',),
                    UserPostCard(imageUrl: 'assets/images/foods/7.jpg', avatarUrl: 'assets/images/foods/7.jpg', title: '炸鸡火鸡面', likeCount: 12, userName: '炸鸡爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/8.jpg', avatarUrl: 'assets/images/foods/8.jpg', title: '精致日式午餐', likeCount: 12, userName: '日式美食家',),
                    UserPostCard(imageUrl: 'assets/images/foods/9.jpg', avatarUrl: 'assets/images/foods/9.jpg', title: '牛排意面，再冲一包挂耳咖啡', likeCount: 12, userName: '西餐爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/10.jpg', avatarUrl: 'assets/images/foods/10.jpg', title: '在家自制鸡公煲，不输饭店', likeCount: 12, userName: '水果达人',),
                    UserPostCard(imageUrl: 'assets/images/foods/11.jpg', avatarUrl: 'assets/images/foods/11.jpg', title: '小蛋糕治愈一切', likeCount: 12, userName: '甜点大师',),
                    UserPostCard(imageUrl: 'assets/images/foods/12.jpg', avatarUrl: 'assets/images/foods/12.jpg', title: '麦门！', likeCount: 12, userName: '快餐迷',),
                    UserPostCard(imageUrl: 'assets/images/foods/13.jpg', avatarUrl: 'assets/images/foods/13.jpg', title: '大口汉堡', likeCount: 12, userName: '汉堡控',),
                    UserPostCard(imageUrl: 'assets/images/foods/14.jpg', avatarUrl: 'assets/images/foods/14.jpg', title: '鸡蛋炒面', likeCount: 12, userName: '炒面高手',),
                    UserPostCard(imageUrl: 'assets/images/foods/15.jpg', avatarUrl: 'assets/images/foods/15.jpg', title: '芋圆西米露，香甜顺滑', likeCount: 12, userName: '甜品探索者',),
                    UserPostCard(imageUrl: 'assets/images/foods/0.jpg', avatarUrl: 'assets/images/foods/0.jpg', title: '炒年糕，让人垂涎欲滴的美味', likeCount: 12, userName: '美食达人小张',),
                    UserPostCard(imageUrl: 'assets/images/foods/1.jpg', avatarUrl: 'assets/images/foods/1.jpg', title: '午后蛋糕惬意时光', likeCount: 12, userName: '甜品爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/2.jpg', avatarUrl: 'assets/images/foods/2.jpg', title: '深夜食堂，下雨天自制冰饮和日式拉面更配哦', likeCount: 12, userName: '夜宵达人',),
                    UserPostCard(imageUrl: 'assets/images/foods/3.jpg', avatarUrl: 'assets/images/foods/3.jpg', title: '午后沙拉一人食，享受片刻的宁静', likeCount: 12, userName: '孤独美食家',),
                    UserPostCard(imageUrl: 'assets/images/foods/4.jpg', avatarUrl: 'assets/images/foods/4.jpg', title: '秋日蟹黄', likeCount: 12, userName: '海鲜探索者',),
                    UserPostCard(imageUrl: 'assets/images/foods/5.jpg', avatarUrl: 'assets/images/foods/5.jpg', title: '虾仁番茄拉面', likeCount: 12, userName: '拉面大师',),
                    UserPostCard(imageUrl: 'assets/images/foods/6.jpg', avatarUrl: 'assets/images/foods/6.jpg', title: '晨光鸡蛋面，满满幸福感', likeCount: 12, userName: '早餐专家',),
                    UserPostCard(imageUrl: 'assets/images/foods/7.jpg', avatarUrl: 'assets/images/foods/7.jpg', title: '炸鸡火鸡面', likeCount: 12, userName: '炸鸡爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/8.jpg', avatarUrl: 'assets/images/foods/8.jpg', title: '精致日式午餐', likeCount: 12, userName: '日式美食家',),
                    UserPostCard(imageUrl: 'assets/images/foods/9.jpg', avatarUrl: 'assets/images/foods/9.jpg', title: '牛排意面，再冲一包挂耳咖啡', likeCount: 12, userName: '西餐爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/10.jpg', avatarUrl: 'assets/images/foods/10.jpg', title: '在家自制鸡公煲，不输饭店', likeCount: 12, userName: '水果达人',),
                    UserPostCard(imageUrl: 'assets/images/foods/11.jpg', avatarUrl: 'assets/images/foods/11.jpg', title: '小蛋糕治愈一切', likeCount: 12, userName: '甜点大师',),
                    UserPostCard(imageUrl: 'assets/images/foods/12.jpg', avatarUrl: 'assets/images/foods/12.jpg', title: '麦门！', likeCount: 12, userName: '快餐迷',),
                    UserPostCard(imageUrl: 'assets/images/foods/13.jpg', avatarUrl: 'assets/images/foods/13.jpg', title: '大口汉堡', likeCount: 12, userName: '汉堡控',),
                    UserPostCard(imageUrl: 'assets/images/foods/14.jpg', avatarUrl: 'assets/images/foods/14.jpg', title: '鸡蛋炒面', likeCount: 12, userName: '炒面高手',),
                    UserPostCard(imageUrl: 'assets/images/foods/15.jpg', avatarUrl: 'assets/images/foods/15.jpg', title: '芋圆西米露，香甜顺滑', likeCount: 12, userName: '甜品探索者',),
                    UserPostCard(imageUrl: 'assets/images/foods/0.jpg', avatarUrl: 'assets/images/foods/0.jpg', title: '炒年糕，让人垂涎欲滴的美味', likeCount: 12, userName: '美食达人小张',),
                    UserPostCard(imageUrl: 'assets/images/foods/1.jpg', avatarUrl: 'assets/images/foods/1.jpg', title: '午后蛋糕惬意时光', likeCount: 12, userName: '甜品爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/2.jpg', avatarUrl: 'assets/images/foods/2.jpg', title: '深夜食堂，下雨天自制冰饮和日式拉面更配哦', likeCount: 12, userName: '夜宵达人',),
                    UserPostCard(imageUrl: 'assets/images/foods/3.jpg', avatarUrl: 'assets/images/foods/3.jpg', title: '午后沙拉一人食，享受片刻的宁静', likeCount: 12, userName: '孤独美食家',),
                    UserPostCard(imageUrl: 'assets/images/foods/4.jpg', avatarUrl: 'assets/images/foods/4.jpg', title: '秋日蟹黄', likeCount: 12, userName: '海鲜探索者',),
                    UserPostCard(imageUrl: 'assets/images/foods/5.jpg', avatarUrl: 'assets/images/foods/5.jpg', title: '虾仁番茄拉面', likeCount: 12, userName: '拉面大师',),
                    UserPostCard(imageUrl: 'assets/images/foods/6.jpg', avatarUrl: 'assets/images/foods/6.jpg', title: '晨光鸡蛋面，满满幸福感', likeCount: 12, userName: '早餐专家',),
                    UserPostCard(imageUrl: 'assets/images/foods/7.jpg', avatarUrl: 'assets/images/foods/7.jpg', title: '炸鸡火鸡面', likeCount: 12, userName: '炸鸡爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/8.jpg', avatarUrl: 'assets/images/foods/8.jpg', title: '精致日式午餐', likeCount: 12, userName: '日式美食家',),
                    UserPostCard(imageUrl: 'assets/images/foods/9.jpg', avatarUrl: 'assets/images/foods/9.jpg', title: '牛排意面，再冲一包挂耳咖啡', likeCount: 12, userName: '西餐爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/10.jpg', avatarUrl: 'assets/images/foods/10.jpg', title: '在家自制鸡公煲，不输饭店', likeCount: 12, userName: '水果达人',),
                    UserPostCard(imageUrl: 'assets/images/foods/11.jpg', avatarUrl: 'assets/images/foods/11.jpg', title: '小蛋糕治愈一切', likeCount: 12, userName: '甜点大师',),
                    UserPostCard(imageUrl: 'assets/images/foods/12.jpg', avatarUrl: 'assets/images/foods/12.jpg', title: '麦门！', likeCount: 12, userName: '快餐迷',),
                    UserPostCard(imageUrl: 'assets/images/foods/13.jpg', avatarUrl: 'assets/images/foods/13.jpg', title: '大口汉堡', likeCount: 12, userName: '汉堡控',),
                    UserPostCard(imageUrl: 'assets/images/foods/14.jpg', avatarUrl: 'assets/images/foods/14.jpg', title: '鸡蛋炒面', likeCount: 12, userName: '炒面高手',),
                    UserPostCard(imageUrl: 'assets/images/foods/15.jpg', avatarUrl: 'assets/images/foods/15.jpg', title: '芋圆西米露，香甜顺滑', likeCount: 12, userName: '甜品探索者',),
                    UserPostCard(imageUrl: 'assets/images/foods/0.jpg', avatarUrl: 'assets/images/foods/0.jpg', title: '炒年糕，让人垂涎欲滴的美味', likeCount: 12, userName: '美食达人小张',),
                    UserPostCard(imageUrl: 'assets/images/foods/1.jpg', avatarUrl: 'assets/images/foods/1.jpg', title: '午后蛋糕惬意时光', likeCount: 12, userName: '甜品爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/2.jpg', avatarUrl: 'assets/images/foods/2.jpg', title: '深夜食堂，下雨天自制冰饮和日式拉面更配哦', likeCount: 12, userName: '夜宵达人',),
                    UserPostCard(imageUrl: 'assets/images/foods/3.jpg', avatarUrl: 'assets/images/foods/3.jpg', title: '午后沙拉一人食，享受片刻的宁静', likeCount: 12, userName: '孤独美食家',),
                    UserPostCard(imageUrl: 'assets/images/foods/4.jpg', avatarUrl: 'assets/images/foods/4.jpg', title: '秋日蟹黄', likeCount: 12, userName: '海鲜探索者',),
                    UserPostCard(imageUrl: 'assets/images/foods/5.jpg', avatarUrl: 'assets/images/foods/5.jpg', title: '虾仁番茄拉面', likeCount: 12, userName: '拉面大师',),
                    UserPostCard(imageUrl: 'assets/images/foods/6.jpg', avatarUrl: 'assets/images/foods/6.jpg', title: '晨光鸡蛋面，满满幸福感', likeCount: 12, userName: '早餐专家',),
                    UserPostCard(imageUrl: 'assets/images/foods/7.jpg', avatarUrl: 'assets/images/foods/7.jpg', title: '炸鸡火鸡面', likeCount: 12, userName: '炸鸡爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/8.jpg', avatarUrl: 'assets/images/foods/8.jpg', title: '精致日式午餐', likeCount: 12, userName: '日式美食家',),
                    UserPostCard(imageUrl: 'assets/images/foods/9.jpg', avatarUrl: 'assets/images/foods/9.jpg', title: '牛排意面，再冲一包挂耳咖啡', likeCount: 12, userName: '西餐爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/10.jpg', avatarUrl: 'assets/images/foods/10.jpg', title: '在家自制鸡公煲，不输饭店', likeCount: 12, userName: '水果达人',),
                    UserPostCard(imageUrl: 'assets/images/foods/11.jpg', avatarUrl: 'assets/images/foods/11.jpg', title: '小蛋糕治愈一切', likeCount: 12, userName: '甜点大师',),
                    UserPostCard(imageUrl: 'assets/images/foods/12.jpg', avatarUrl: 'assets/images/foods/12.jpg', title: '麦门！', likeCount: 12, userName: '快餐迷',),
                    UserPostCard(imageUrl: 'assets/images/foods/13.jpg', avatarUrl: 'assets/images/foods/13.jpg', title: '大口汉堡', likeCount: 12, userName: '汉堡控',),
                    UserPostCard(imageUrl: 'assets/images/foods/14.jpg', avatarUrl: 'assets/images/foods/14.jpg', title: '鸡蛋炒面', likeCount: 12, userName: '炒面高手',),
                    UserPostCard(imageUrl: 'assets/images/foods/15.jpg', avatarUrl: 'assets/images/foods/15.jpg', title: '芋圆西米露，香甜顺滑', likeCount: 12, userName: '甜品探索者',),
                    UserPostCard(imageUrl: 'assets/images/foods/0.jpg', avatarUrl: 'assets/images/foods/0.jpg', title: '炒年糕，让人垂涎欲滴的美味', likeCount: 12, userName: '美食达人小张',),
                    UserPostCard(imageUrl: 'assets/images/foods/1.jpg', avatarUrl: 'assets/images/foods/1.jpg', title: '午后蛋糕惬意时光', likeCount: 12, userName: '甜品爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/2.jpg', avatarUrl: 'assets/images/foods/2.jpg', title: '深夜食堂，下雨天自制冰饮和日式拉面更配哦', likeCount: 12, userName: '夜宵达人',),
                    UserPostCard(imageUrl: 'assets/images/foods/3.jpg', avatarUrl: 'assets/images/foods/3.jpg', title: '午后沙拉一人食，享受片刻的宁静', likeCount: 12, userName: '孤独美食家',),
                    UserPostCard(imageUrl: 'assets/images/foods/4.jpg', avatarUrl: 'assets/images/foods/4.jpg', title: '秋日蟹黄', likeCount: 12, userName: '海鲜探索者',),
                    UserPostCard(imageUrl: 'assets/images/foods/5.jpg', avatarUrl: 'assets/images/foods/5.jpg', title: '虾仁番茄拉面', likeCount: 12, userName: '拉面大师',),
                    UserPostCard(imageUrl: 'assets/images/foods/6.jpg', avatarUrl: 'assets/images/foods/6.jpg', title: '晨光鸡蛋面，满满幸福感', likeCount: 12, userName: '早餐专家',),
                    UserPostCard(imageUrl: 'assets/images/foods/7.jpg', avatarUrl: 'assets/images/foods/7.jpg', title: '炸鸡火鸡面', likeCount: 12, userName: '炸鸡爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/8.jpg', avatarUrl: 'assets/images/foods/8.jpg', title: '精致日式午餐', likeCount: 12, userName: '日式美食家',),
                    UserPostCard(imageUrl: 'assets/images/foods/9.jpg', avatarUrl: 'assets/images/foods/9.jpg', title: '牛排意面，再冲一包挂耳咖啡', likeCount: 12, userName: '西餐爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/10.jpg', avatarUrl: 'assets/images/foods/10.jpg', title: '在家自制鸡公煲，不输饭店', likeCount: 12, userName: '水果达人',),
                    UserPostCard(imageUrl: 'assets/images/foods/11.jpg', avatarUrl: 'assets/images/foods/11.jpg', title: '小蛋糕治愈一切', likeCount: 12, userName: '甜点大师',),
                    UserPostCard(imageUrl: 'assets/images/foods/12.jpg', avatarUrl: 'assets/images/foods/12.jpg', title: '麦门！', likeCount: 12, userName: '快餐迷',),
                    UserPostCard(imageUrl: 'assets/images/foods/13.jpg', avatarUrl: 'assets/images/foods/13.jpg', title: '大口汉堡', likeCount: 12, userName: '汉堡控',),
                    UserPostCard(imageUrl: 'assets/images/foods/14.jpg', avatarUrl: 'assets/images/foods/14.jpg', title: '鸡蛋炒面', likeCount: 12, userName: '炒面高手',),
                    UserPostCard(imageUrl: 'assets/images/foods/15.jpg', avatarUrl: 'assets/images/foods/15.jpg', title: '芋圆西米露，香甜顺滑', likeCount: 12, userName: '甜品探索者',),
                    UserPostCard(imageUrl: 'assets/images/foods/0.jpg', avatarUrl: 'assets/images/foods/0.jpg', title: '炒年糕，让人垂涎欲滴的美味', likeCount: 12, userName: '美食达人小张',),
                    UserPostCard(imageUrl: 'assets/images/foods/1.jpg', avatarUrl: 'assets/images/foods/1.jpg', title: '午后蛋糕惬意时光', likeCount: 12, userName: '甜品爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/2.jpg', avatarUrl: 'assets/images/foods/2.jpg', title: '深夜食堂，下雨天自制冰饮和日式拉面更配哦', likeCount: 12, userName: '夜宵达人',),
                    UserPostCard(imageUrl: 'assets/images/foods/3.jpg', avatarUrl: 'assets/images/foods/3.jpg', title: '午后沙拉一人食，享受片刻的宁静', likeCount: 12, userName: '孤独美食家',),
                    UserPostCard(imageUrl: 'assets/images/foods/4.jpg', avatarUrl: 'assets/images/foods/4.jpg', title: '秋日蟹黄', likeCount: 12, userName: '海鲜探索者',),
                    UserPostCard(imageUrl: 'assets/images/foods/5.jpg', avatarUrl: 'assets/images/foods/5.jpg', title: '虾仁番茄拉面', likeCount: 12, userName: '拉面大师',),
                    UserPostCard(imageUrl: 'assets/images/foods/6.jpg', avatarUrl: 'assets/images/foods/6.jpg', title: '晨光鸡蛋面，满满幸福感', likeCount: 12, userName: '早餐专家',),
                    UserPostCard(imageUrl: 'assets/images/foods/7.jpg', avatarUrl: 'assets/images/foods/7.jpg', title: '炸鸡火鸡面', likeCount: 12, userName: '炸鸡爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/8.jpg', avatarUrl: 'assets/images/foods/8.jpg', title: '精致日式午餐', likeCount: 12, userName: '日式美食家',),
                    UserPostCard(imageUrl: 'assets/images/foods/9.jpg', avatarUrl: 'assets/images/foods/9.jpg', title: '牛排意面，再冲一包挂耳咖啡', likeCount: 12, userName: '西餐爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/10.jpg', avatarUrl: 'assets/images/foods/10.jpg', title: '在家自制鸡公煲，不输饭店', likeCount: 12, userName: '水果达人',),
                    UserPostCard(imageUrl: 'assets/images/foods/11.jpg', avatarUrl: 'assets/images/foods/11.jpg', title: '小蛋糕治愈一切', likeCount: 12, userName: '甜点大师',),
                    UserPostCard(imageUrl: 'assets/images/foods/12.jpg', avatarUrl: 'assets/images/foods/12.jpg', title: '麦门！', likeCount: 12, userName: '快餐迷',),
                    UserPostCard(imageUrl: 'assets/images/foods/13.jpg', avatarUrl: 'assets/images/foods/13.jpg', title: '大口汉堡', likeCount: 12, userName: '汉堡控',),
                    UserPostCard(imageUrl: 'assets/images/foods/14.jpg', avatarUrl: 'assets/images/foods/14.jpg', title: '鸡蛋炒面', likeCount: 12, userName: '炒面高手',),
                    UserPostCard(imageUrl: 'assets/images/foods/15.jpg', avatarUrl: 'assets/images/foods/15.jpg', title: '芋圆西米露，香甜顺滑', likeCount: 12, userName: '甜品探索者',),
                    UserPostCard(imageUrl: 'assets/images/foods/0.jpg', avatarUrl: 'assets/images/foods/0.jpg', title: '炒年糕，让人垂涎欲滴的美味', likeCount: 12, userName: '美食达人小张',),
                    UserPostCard(imageUrl: 'assets/images/foods/1.jpg', avatarUrl: 'assets/images/foods/1.jpg', title: '午后蛋糕惬意时光', likeCount: 12, userName: '甜品爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/2.jpg', avatarUrl: 'assets/images/foods/2.jpg', title: '深夜食堂，下雨天自制冰饮和日式拉面更配哦', likeCount: 12, userName: '夜宵达人',),
                    UserPostCard(imageUrl: 'assets/images/foods/3.jpg', avatarUrl: 'assets/images/foods/3.jpg', title: '午后沙拉一人食，享受片刻的宁静', likeCount: 12, userName: '孤独美食家',),
                    UserPostCard(imageUrl: 'assets/images/foods/4.jpg', avatarUrl: 'assets/images/foods/4.jpg', title: '秋日蟹黄', likeCount: 12, userName: '海鲜探索者',),
                    UserPostCard(imageUrl: 'assets/images/foods/5.jpg', avatarUrl: 'assets/images/foods/5.jpg', title: '虾仁番茄拉面', likeCount: 12, userName: '拉面大师',),
                    UserPostCard(imageUrl: 'assets/images/foods/6.jpg', avatarUrl: 'assets/images/foods/6.jpg', title: '晨光鸡蛋面，满满幸福感', likeCount: 12, userName: '早餐专家',),
                    UserPostCard(imageUrl: 'assets/images/foods/7.jpg', avatarUrl: 'assets/images/foods/7.jpg', title: '炸鸡火鸡面', likeCount: 12, userName: '炸鸡爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/8.jpg', avatarUrl: 'assets/images/foods/8.jpg', title: '精致日式午餐', likeCount: 12, userName: '日式美食家',),
                    UserPostCard(imageUrl: 'assets/images/foods/9.jpg', avatarUrl: 'assets/images/foods/9.jpg', title: '牛排意面，再冲一包挂耳咖啡', likeCount: 12, userName: '西餐爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/10.jpg', avatarUrl: 'assets/images/foods/10.jpg', title: '在家自制鸡公煲，不输饭店', likeCount: 12, userName: '水果达人',),
                    UserPostCard(imageUrl: 'assets/images/foods/11.jpg', avatarUrl: 'assets/images/foods/11.jpg', title: '小蛋糕治愈一切', likeCount: 12, userName: '甜点大师',),
                    UserPostCard(imageUrl: 'assets/images/foods/12.jpg', avatarUrl: 'assets/images/foods/12.jpg', title: '麦门！', likeCount: 12, userName: '快餐迷',),
                    UserPostCard(imageUrl: 'assets/images/foods/13.jpg', avatarUrl: 'assets/images/foods/13.jpg', title: '大口汉堡', likeCount: 12, userName: '汉堡控',),
                    UserPostCard(imageUrl: 'assets/images/foods/14.jpg', avatarUrl: 'assets/images/foods/14.jpg', title: '鸡蛋炒面', likeCount: 12, userName: '炒面高手',),
                    UserPostCard(imageUrl: 'assets/images/foods/15.jpg', avatarUrl: 'assets/images/foods/15.jpg', title: '芋圆西米露，香甜顺滑', likeCount: 12, userName: '甜品探索者',),
                    UserPostCard(imageUrl: 'assets/images/foods/0.jpg', avatarUrl: 'assets/images/foods/0.jpg', title: '炒年糕，让人垂涎欲滴的美味', likeCount: 12, userName: '美食达人小张',),
                    UserPostCard(imageUrl: 'assets/images/foods/1.jpg', avatarUrl: 'assets/images/foods/1.jpg', title: '午后蛋糕惬意时光', likeCount: 12, userName: '甜品爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/2.jpg', avatarUrl: 'assets/images/foods/2.jpg', title: '深夜食堂，下雨天自制冰饮和日式拉面更配哦', likeCount: 12, userName: '夜宵达人',),
                    UserPostCard(imageUrl: 'assets/images/foods/3.jpg', avatarUrl: 'assets/images/foods/3.jpg', title: '午后沙拉一人食，享受片刻的宁静', likeCount: 12, userName: '孤独美食家',),
                    UserPostCard(imageUrl: 'assets/images/foods/4.jpg', avatarUrl: 'assets/images/foods/4.jpg', title: '秋日蟹黄', likeCount: 12, userName: '海鲜探索者',),
                    UserPostCard(imageUrl: 'assets/images/foods/5.jpg', avatarUrl: 'assets/images/foods/5.jpg', title: '虾仁番茄拉面', likeCount: 12, userName: '拉面大师',),
                    UserPostCard(imageUrl: 'assets/images/foods/6.jpg', avatarUrl: 'assets/images/foods/6.jpg', title: '晨光鸡蛋面，满满幸福感', likeCount: 12, userName: '早餐专家',),
                    UserPostCard(imageUrl: 'assets/images/foods/7.jpg', avatarUrl: 'assets/images/foods/7.jpg', title: '炸鸡火鸡面', likeCount: 12, userName: '炸鸡爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/8.jpg', avatarUrl: 'assets/images/foods/8.jpg', title: '精致日式午餐', likeCount: 12, userName: '日式美食家',),
                    UserPostCard(imageUrl: 'assets/images/foods/9.jpg', avatarUrl: 'assets/images/foods/9.jpg', title: '牛排意面，再冲一包挂耳咖啡', likeCount: 12, userName: '西餐爱好者',),
                    UserPostCard(imageUrl: 'assets/images/foods/10.jpg', avatarUrl: 'assets/images/foods/10.jpg', title: '在家自制鸡公煲，不输饭店', likeCount: 12, userName: '水果达人',),
                    UserPostCard(imageUrl: 'assets/images/foods/11.jpg', avatarUrl: 'assets/images/foods/11.jpg', title: '小蛋糕治愈一切', likeCount: 12, userName: '甜点大师',),
                    UserPostCard(imageUrl: 'assets/images/foods/12.jpg', avatarUrl: 'assets/images/foods/12.jpg', title: '麦门！', likeCount: 12, userName: '快餐迷',),
                    UserPostCard(imageUrl: 'assets/images/foods/13.jpg', avatarUrl: 'assets/images/foods/13.jpg', title: '大口汉堡', likeCount: 12, userName: '汉堡控',),
                    UserPostCard(imageUrl: 'assets/images/foods/14.jpg', avatarUrl: 'assets/images/foods/14.jpg', title: '鸡蛋炒面', likeCount: 12, userName: '炒面高手',),
                    UserPostCard(imageUrl: 'assets/images/foods/15.jpg', avatarUrl: 'assets/images/foods/15.jpg', title: '芋圆西米露，香甜顺滑', likeCount: 12, userName: '甜品探索者',),
                  ],
                ),
              )
            
          ],
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
                   '往迹',
                    fontSize: pxfit(36, extraWScale: 0.15, maxScale: 1.0, noLimitExtraWScale: 0.2),
                    color: Colors.white,
                  ),
                  SizedBox(height: pxh(4, extraWScale: 0.8, maxScale: 1.5)),
                  SfssWidget.text(
                    '墨香留古韵，笔端记流年。',
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