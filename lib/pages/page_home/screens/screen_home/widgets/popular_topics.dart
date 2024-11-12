import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sfss/enums/solar_term_enums.dart';
import 'package:sfss/plugins/widget_adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/adaptive_widget.dart';
import 'package:sfss/widgets/sfss_widget.dart';

class PopularTopics extends StatefulWidget {
  const PopularTopics({super.key});

  @override
  State<PopularTopics> createState() => _PopularTopicsState();
}

class _PopularTopicsState extends State<PopularTopics> {
  Widget topicItem({required String imageUrl, required String topic, required WidgetAdapter adapter}) {
    PxFunction px = adapter.px;
    return ClipRRect(
      borderRadius: BorderRadius.circular(px(10)),
      child: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: px(18), sigmaY: px(18), tileMode: TileMode.mirror),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover
                )
              ),
            )
          ),
          SizedBox(
            height: px(128),
            child: ClipRect(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRect(
              child: SizedBox(
                height: px(41),
                child: Center(
                  child: Row(
                    children: [
                      SizedBox(width: px(12),),
                      SfssWidget.text('#',color: Colors.white, fontSize: px(14)),
                      SizedBox(width: px(6),),
                      SfssWidget.text(topic, color: Colors.white, fontSize: px(14)),
                    ]
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return AdaptiveWidget(
      uiWidth: 306, 
      uiHeight: 199,
      builder: (context, adapter) {
        PxFunction px = adapter.px;
        return Column(
          children: [
            SfssWidget.text(
              '坊间话题',
              fontSize: px(16)
            ),
            SizedBox(height: px(10),),
            // for (int i = 0; i < 24; i+=1)
            SizedBox(
              height: px(169),
              child: ListView(
                clipBehavior: Clip.antiAlias,
                scrollDirection : Axis.horizontal,
                children: [
                  SizedBox(
                    width: px(137),
                    child: topicItem(imageUrl:'assets/images/home/background.png', topic: '我的立冬食谱', adapter: adapter)
                  ),
                  SizedBox(width: px(7),),
                  SizedBox(
                    width: px(137),
                    child: topicItem(imageUrl:'assets/images/welcome/backgroundLogin.png', topic: '十天吃遍一座城', adapter: adapter),
                  ),
                  SizedBox(width: px(7),),
                  SizedBox(
                    width: px(137),
                    child: topicItem(imageUrl:'assets/images/welcome/background.png', topic: '浙江大学十佳菜', adapter: adapter)
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}