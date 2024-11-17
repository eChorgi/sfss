import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfss/pages/page_home/screens/screen_community/screen_community.dart';
import 'package:sfss/__deprecated/edit_record/screen_edit_record.dart';
import 'package:sfss/pages/page_home/screens/screen_home/screen_home.dart';
import 'package:sfss/pages/page_home/screens/screen_home/widgets/diet_progress.dart';
import 'package:sfss/pages/page_home/screens/screen_history/screen_history.dart';
import 'package:sfss/pages/page_home/screens/screen_solar_term/screen_solar_term.dart';
import 'package:sfss/pages/page_record_edit/page_record_edit.dart';
import 'package:sfss/plugins/adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/fit_width_image.dart';
import 'package:sfss/widgets/image_swiper.dart';
import 'package:sfss/widgets/sfss_widget.dart';
import 'package:sfss/widgets/tab_bar.dart';

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

class PageRecordDetail extends StatefulWidget {
  const PageRecordDetail({Key? key}) : super(key: key);

  @override
  State<PageRecordDetail> createState() => _PageRecordDetailState();
}

class _PageRecordDetailState extends State<PageRecordDetail> with TickerProviderStateMixin {
  late int recordId;
  late String imageUrl;
  late PageController imagePageController;
  int imagePageIndex = 0;
  late PageController pageController;
  double overScrollAmount = 0;

  @override
  void initState() {
    super.initState();
    imagePageController = PageController();
    pageController = PageController();
  }
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    recordId = args['recordId'] ?? 0;
    imageUrl = args['imageUrl'] ?? '';
  }
  
  @override
  Widget build(BuildContext context) {
    Adapter(context: context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: pxh(54),
              color: Colors.white,
              child: Row(
                children: [
                  SizedBox(width: px(26),),
                  SizedBox(
                    width: px(10),
                    height: px(16),
                    child: SvgPicture.asset('assets/images/go_back.svg', color: const Color(0xFFB1ADAD),),
                  ),
                  SizedBox(width: px(20),),
                  Container(
                    height: px(37),
                    width: px(37),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/avatar_echorgi.png'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  SizedBox(width: px(18),),
                  SfssWidget.text(
                    '旺旺君贝',
                    fontSize: px(20),
                    color: SfssStyle.mainGrey,
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Container(
                    width: px(55.5, maxScale: 1.5),
                    height: px(28.5, maxScale: 1.5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(px(7, maxScale: 1.5)),
                      color: SfssStyle.weakRed
                    ),
                    child: Center(
                      child: SfssWidget.text(
                        '关注',
                        color: Colors.white,
                        fontSize: px(13.8, maxScale: 1.5)
                      ),
                    ),
                  ),
                  SizedBox(width: px(33.5),)
                ],
              ),
            ),
            SizedBox(
              height: Adapter.adapter?.screenH() - pxh(54) - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom,
              child: GestureDetector(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                      if (notification.metrics.pixels < 0) {
                        overScrollAmount = notification.metrics.pixels;
                      } else {
                        overScrollAmount = max(0, notification.metrics.pixels - notification.metrics.maxScrollExtent);
                      }
                    print(overScrollAmount);
                    if(overScrollAmount > 20) {
                      pageController.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
                    } else if(overScrollAmount < -20) {
                      pageController.animateToPage(0, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
                    }
                    return false;
                  },
                  child: RawGestureDetector(
                    
                    child: PageView(
                      controller: pageController,
                      scrollDirection: Axis.vertical,
                      children: [
                        NotificationListener<ScrollNotification>(
                          onNotification: (_){return false;},
                          child: CustomScrollView(
                            clipBehavior: Clip.antiAlias,
                            slivers: [
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: EdgeInsets.only(left: px(30), right: px(30), top: px(16)),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Align(
                                      alignment: Alignment.topCenter,
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(px(10)),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: const Color(0x1A000000),
                                              offset: const Offset(0, 2),
                                              blurRadius: 6  ,
                                              spreadRadius: 1 
                                            )
                                          ]
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.only(left: px(10, maxScale: 1.5), right: px(10, maxScale: 1.5), top: px(16, maxScale: 1.5)),
                                          child: Column(
                                            children: [
                                              ImageSwiper(imageUrls: [imageUrl, imageUrl, imageUrl]),
                                              SizedBox(height: pxh(93)),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: px(20, maxScale: 1.5, minScale: 1.0),
                                                    height: px(18, maxScale: 1.5, minScale: 1.0),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(px(4, maxScale:1.5)),
                                                      color: SfssStyle.mainRed,
                                                    ),
                                                    child: Center(
                                                      child: SfssWidget.text(
                                                        '谱',
                                                        fontSize: px(12, maxScale: 1.5, minScale: 1.0),
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: px(11.2, maxScale: 1.5)),
                                                  SfssWidget.text(
                                                    '一人食晚餐',
                                                    fontSize: px(14, maxScale: 1.5),
                                                    color: SfssStyle.mainGrey,
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: pxh(20)),
                                              Padding(
                                                padding: EdgeInsets.only(left: px(28, maxScale: 1.5), right: px(28, maxScale: 1.5)),
                                                child: SfssWidget.text(
                                                  '人间烟火，慢食三餐。味道若能延续，记忆就会一直都在。',
                                                  fontSize: px(12, maxScale: 1.5),
                                                  color: SfssStyle.mainGrey,
                                                  textAlign: TextAlign.center,
                                                  strutStyle: StrutStyle(
                                                    height: 1.5
                                                  )
                                                ),
                                              ),
                                              SizedBox(height: pxh(93)),
                                              SizedBox(height: pxh(10)),
                                            ],
                                          ),
                                        )
                                      )
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      
                        CustomScrollView(
                          
                          clipBehavior: Clip.antiAlias,
                          slivers: [
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: EdgeInsets.only(left: px(30), right: px(30), top: px(16)),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(px(10)),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color(0x1A000000),
                                            offset: const Offset(0, 2),
                                            blurRadius: 6  ,
                                            spreadRadius: 1 
                                          )
                                        ]
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.only(left: px(10, maxScale: 1.5), right: px(10, maxScale: 1.5), top: px(16, maxScale: 1.5)),
                                        child: Column(
                                          children: [
                                            ImageSwiper(imageUrls: [imageUrl, imageUrl, imageUrl]),
                                            SizedBox(height: pxh(93)),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: px(20, maxScale: 1.5, minScale: 1.0),
                                                  height: px(18, maxScale: 1.5, minScale: 1.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(px(4, maxScale:1.5)),
                                                    color: SfssStyle.mainRed,
                                                  ),
                                                  child: Center(
                                                    child: SfssWidget.text(
                                                      '谱',
                                                      fontSize: px(12, maxScale: 1.5, minScale: 1.0),
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: px(11.2, maxScale: 1.5)),
                                                SfssWidget.text(
                                                  '一人食晚餐',
                                                  fontSize: px(14, maxScale: 1.5),
                                                  color: SfssStyle.mainGrey,
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: pxh(20)),
                                            Padding(
                                              padding: EdgeInsets.only(left: px(28, maxScale: 1.5), right: px(28, maxScale: 1.5)),
                                              child: SfssWidget.text(
                                                '喜欢黏糊糊的口感，自己炖的牛肉超级软烂香滑。还有胡萝卜排骨玉米汤，鲜甜香浓，可以下三碗米饭 ！喜欢黏糊糊的口感，自己炖的牛肉超级软烂香滑。还有胡萝卜排骨玉米汤，鲜甜香浓，可以下三碗米饭 ！喜欢黏糊糊的口感，自己炖的牛肉超级软烂香滑。还有胡萝卜排骨玉米汤，鲜甜香浓，可以下三碗米饭 ！喜欢黏糊糊的口感，自己炖的牛肉超级软烂香滑。还有胡萝卜排骨玉米汤，鲜甜香浓，可以下三碗米饭 ！喜欢黏糊糊的口感，自己炖的牛肉超级软烂香滑。还有胡萝卜排骨玉米汤，鲜甜香浓，可以下三碗米饭 ！喜欢黏糊糊的口感，自己炖的牛肉超级软烂香滑。还有胡萝卜排骨玉米汤，鲜甜香浓，可以下三碗米饭 ！喜欢黏糊糊的口感，自己炖的牛肉超级软烂香滑。还有胡萝卜排骨玉米汤，鲜甜香浓，可以下三碗米饭 ！喜欢黏糊糊的口感，自己炖的牛肉超级软烂香滑。还有胡萝卜排骨玉米汤，鲜甜香浓，可以下三碗米饭 ！',
                                                fontSize: px(12, maxScale: 1.5),
                                                color: SfssStyle.mainGrey,
                                                textAlign: TextAlign.center,
                                                strutStyle: StrutStyle(
                                                  height: 1.5
                                                )
                                              ),
                                            ),
                                            SizedBox(height: pxh(93)),
                                            // Opacity(
                                            //   opacity: 0.5,
                                            //   child: Row(
                                            //     mainAxisAlignment: MainAxisAlignment.center,
                                            //     children: [
                                            //       SfssWidget.text(
                                            //         '2天前',
                                            //         fontSize: px(10, maxScale: 1.5),
                                            //       ),
                                            //       SizedBox(width: px(10, maxScale: 1.5)),
                                            //       SfssWidget.text(
                                            //         '黑龙江',
                                            //         fontSize: px(10, maxScale: 1.5),
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                            SizedBox(height: pxh(10)),
                                          ],
                                        ),
                                      )
                                    )
                                  ),
                                ),
                              ),
                            ),
                            // SliverToBoxAdapter(
                            //   child: Padding(
                            //     padding: EdgeInsets.only(top: px(130)),
                            //     child: SizedBox(
                            //       width: double.infinity,
                            //       height: 3.0/4*Adapter.adapter?.screenH(),
                            //       child: Center(child: ImageSwiper(imageUrls: [imageUrl, imageUrl, imageUrl])),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
