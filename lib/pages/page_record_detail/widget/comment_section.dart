import 'package:flutter/material.dart';
import 'package:sfss/plugins/adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/sfss_widget.dart';

class CommentSection extends StatefulWidget {
  const CommentSection({super.key});

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {

  Widget subComment({required int like_count, required String nickname, required String content, required String avatarUrl}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: px(6, maxScale: 1.5)),
          child: Container(
            width: px(26, maxScale: 1.5),
            height: px(26, maxScale: 1.5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(avatarUrl),
                fit: BoxFit.cover
              )
            ),
          ),
        ),
        SizedBox(width: px(15, maxScale: 1.5),),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SfssWidget.text(
                nickname,
                fontSize: px(12, maxScale: 1.5),
                color: SfssStyle.weakGrey
              ),
              SizedBox(height: px(6, maxScale: 1.5),),
              SfssWidget.text(
                content,
                fontSize: px(14, maxScale: 1.5),
                color: SfssStyle.mainGrey
              ),
            ],
          ),
        ),
        
        SizedBox(width: px(10, maxScale: 1.5),),
        Column(
          children: [
            Icon(
              Icons.favorite_border,
              size: px(24, maxScale: 1.5),
              color: SfssStyle.mainGrey,
            ),
            SizedBox(height: px(5, maxScale: 1.5),),
            SfssWidget.text(
              like_count.toString(),
              fontSize: px(12, maxScale: 1.5),
              color: SfssStyle.mainGrey,
            )
          ],
        ),
        SizedBox(width: px(25, maxScale: 1.5),),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: px(25, maxScale: 1.5), top: px(38, maxScale: 1.5)),
            child: subComment(
              like_count: 530,
              nickname: 'eChorgi',
              content: '黏黏糊糊才是对饭最大的尊重！ 小白想问一句，这种用牛肉的哪个部位做比较嫩比较好吃啊',
              avatarUrl: 'assets/images/avatar_echorgi.png'
            )
          ),
          SizedBox(height: px(20, maxScale: 1.5),),
          Padding(
            padding: EdgeInsets.only(left: px(50, maxScale: 1.5), bottom: px(10, maxScale: 1.5)), 
            child: subComment(
              like_count: 27,
              nickname: '旺旺君贝',
              content: '我是直接用妈妈买回来的牛腩做的，可以去菜市场买新鲜的牛腩或者牛肋条！其实烧得烂糊了啥肉都好吃',
              avatarUrl: 'assets/images/avatar_echorgi.png'
            )
          ),
          // SizedBox(height: px(20, maxScale: 1.5),),
          Padding(
            padding: EdgeInsets.only(left: px(25, maxScale: 1.5), top: px(38, maxScale: 1.5)),
            child: subComment(
              like_count: 320,
              nickname: '小白菜要吃饭',
              content: '你好，请问可以给我五块肉肉还有三块土豆吗，再来一小碗饭，一小碗就可以了，谢谢(小声)',
              avatarUrl: 'assets/images/foods/5.jpg'
              // avatarUrl: 'assets/images/avatar_echorgi.png'
            )
          ),
          SizedBox(height: px(20, maxScale: 1.5),),
          Padding(
            padding: EdgeInsets.only(left: px(50, maxScale: 1.5), bottom: px(10, maxScale: 1.5)), 
            child: subComment(
              like_count: 20,
              nickname: '旺旺君贝',
              content: '我要和他一样的，谢谢🙏',
              avatarUrl: 'assets/images/foods/4.jpg'
              // avatarUrl: 'assets/images/avatar_echorgi.png'
            )
          ),
          // SizedBox(height: px(20, maxScale: 1.5),),
          Padding(
            padding: EdgeInsets.only(left: px(25, maxScale: 1.5), top: px(38, maxScale: 1.5)),
            child: subComment(
              like_count: 251,
              nickname: '小鱼悠悠',
              content: '我要两碗咸肉菜饭，因为我饭量大，要一碗番茄牛腩，一碗咖喱牛肉，再带一万块钱，来我家',
              avatarUrl: 'assets/images/foods/3.jpg'
              // avatarUrl: 'assets/images/avatar_echorgi.png'
            )
          ),
          // SizedBox(height: px(20, maxScale: 1.5),),
          Padding(
            padding: EdgeInsets.only(left: px(50, maxScale: 1.5), bottom: px(10, maxScale: 1.5)), 
            child: subComment(
              like_count: 3,
              nickname: '小鱼悠悠',
              content: '我们食堂咖喱牛肉58一小份，88一大份 ',
              avatarUrl: 'assets/images/foods/2.jpg'
              // avatarUrl: 'assets/images/avatar_echorgi.png'
            )
          ),
          Padding(
            padding: EdgeInsets.only(left: px(25, maxScale: 1.5), top: px(38, maxScale: 1.5)),
            child: subComment(
              like_count: 21,
              nickname: '小白菜要吃饭',
              content: '我就喜欢这种黏糊糊的，啊啊啊啊看起来好好吃',
              avatarUrl: 'assets/images/foods/0.jpg'
            )
          ),
          // SizedBox(height: px(20, maxScale: 1.5),),
          Padding(
            padding: EdgeInsets.only(left: px(25, maxScale: 1.5), top: px(38, maxScale: 1.5)),
            child: subComment(
              like_count: 21,
              nickname: '小鱼悠悠',
              content: '看起来好好吃，给我吃呜呜呜',
              avatarUrl: 'assets/images/foods/1.jpg'
              // avatarUrl: 'assets/images/avatar_echorgi.png'
            )
          ),
          // SizedBox(height: px(20, maxScale: 1.5),),
        ],
      ),
    );
  }
}