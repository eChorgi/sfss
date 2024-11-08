import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sfss/plugins/adapt.dart';
import 'package:sfss/styles/sfssStyle.dart';
import 'package:sfss/widgets/sfssWidget.dart';

class DietProgress extends StatefulWidget {
  final double? width;
  final double? height;
  final bool ?isEnpty;
  const DietProgress({ super.key, this.width, this.height, this.isEnpty});

  @override
  State<DietProgress> createState() => _DietProgressState();
}

class _DietProgressState extends State<DietProgress> {
  var shrinkScale = 0.0;
  @override
  Widget build(BuildContext context) {
    if(widget.isEnpty == true) {
      return SfssWidget.card(
        width: px(304),
        height: pxfit(45),
        child: Center(
          child: SfssWidget.text(
            '您尚未开展饮食计划',
            color: Colors.white,
            fontSize: pxfit(20),
          ),
        )
      );
    }
    return SfssWidget.card(
      width: px(304),
      height: px(168, extraWScale: shrinkScale, noLimitExtraWScale: shrinkScale, maxScale: 1),
      child: Center(
        child: SizedBox(
          width: px(254),
          height: px(136, extraWScale: shrinkScale, noLimitExtraWScale: shrinkScale, maxScale: 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SfssWidget.text(
                '您正在进行',
                fontSize: px(15, extraWScale: shrinkScale, noLimitExtraWScale: shrinkScale, maxScale: 0.8),
                color: Colors.white,
              ),
              SizedBox(height: px(13, extraWScale: shrinkScale, noLimitExtraWScale: shrinkScale, maxScale: 1)),
              SfssWidget.text(
                '时令饮食计划',
                fontSize: px(24, extraWScale: shrinkScale, noLimitExtraWScale: shrinkScale, maxScale: 0.8),
                color: Colors.white,
              ),
              SizedBox(height: px(23, extraWScale: shrinkScale, noLimitExtraWScale: shrinkScale, maxScale: 1)),
              SfssWidget.text(
                '下一餐推荐食用',
                fontSize: px(15, extraWScale: shrinkScale, noLimitExtraWScale: shrinkScale, maxScale: 0.8),
                color: Colors.white,
              ),
              SizedBox(height: px(13, extraWScale: shrinkScale, noLimitExtraWScale: shrinkScale, maxScale: 1)),
              SfssWidget.text(
                '西瓜牛油果',
                fontSize: px(24, extraWScale: shrinkScale, noLimitExtraWScale: shrinkScale, maxScale: 0.8),
                color: Colors.white,
              ),
            ],
          ),
        ),
      )
    );
  }
}