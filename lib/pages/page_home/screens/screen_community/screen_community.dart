import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sfss/pages/home/screens/community/user_post_card.dart';
import 'package:sfss/widgets/adaptive_columns.dart';
import 'package:sfss/widgets/adaptive_list_views.dart';
import 'package:sfss/pages/home/screens/home/diet_progress.dart';
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
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: Adapter.adapter?.screenH() - 55 - pxh(700) + px(30, extraHScale: -1.2)),
        child: Hero(
          tag: "sheet",
          child: Container(
            height: pxh(700)-px(30, extraHScale: -1.2),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFFF8F8F8),  
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: pxh(14, extraWScale: 0.3, maxScale: 1.2)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: px(28, maxScale: 1)),
                    Container(
                      width: px(280),
                      height: px(25),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F1F1),
                        borderRadius: BorderRadius.circular(px(12.5)),
                      ),
                      child: Align(
                        alignment: Alignment(-1, 0),
                        child: Row(
                          children: [
                            SizedBox(width: px(10, maxScale: 1.5),),
                            SizedBox(
                              height: px(16, maxScale: 1.5),
                              width: px(16, maxScale: 1.5),
                              child: SvgPicture.asset(
                                'assets/images/search_icon.svg',
                                color: const Color(0xFF8F9BAF),
                              )
                            ),
                            SizedBox(width: px(5, maxScale: 1.5),),
                            Expanded(
                              child: CupertinoTextField(
                                placeholderStyle: TextStyle(
                                  color: const Color(0xFF8F9BAF),
                                  fontFamily: SfssStyle.mainFont,
                                  fontSize: px(12, maxScale: 1.5),
                                ),
                                style: TextStyle(
                                  color: const Color(0xFF4A5568),
                                  fontFamily: SfssStyle.mainFont,
                                  fontSize: px(12, maxScale: 1.5),
                                ),
                                placeholder: '搜索一下',
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                            SizedBox(width: px(8, maxScale: 1.5),)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: px(14, maxScale: 1)),
                    Image.asset("assets/images/Ellipse 2.png", width: px(35, maxScale: 1), height: px(35, maxScale:1),),
                    SizedBox(width: px(28, maxScale: 1)),

                  ],
                ),
                SizedBox(
                  height: pxh(40,maxScale: 1),
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: pxh(35,maxScale: 1),
                      width: px(319),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // SizedBox(width: px(8, maxScale: 1),),
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
                          // SizedBox(width: px(8),),
                          
                        ],
                      ),
                    ),
                  ),
                ),
                // Center(
                //   child: Padding(
                //     padding: EdgeInsets.only(right: px(34)),
                //     child: Container(
                //       height: 0.9,
                //       width: px(247),
                //       color: const Color(0xFFC4C6CB),
                //     ),
                //   ),
                // ),
                SizedBox(height: pxh(4, extraWScale: 0.3, maxScale: 1.2)),
                
                Expanded(
                child: Align(
                  alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(left: px(10), right: px(10)),
                      child: AdaptiveListViews(
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