import 'package:flutter/material.dart';
import 'package:sfss/plugins/widget_adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/adaptive_widget.dart';
import 'package:sfss/widgets/sfss_widget.dart';

class DietDisplay extends StatefulWidget {
  const DietDisplay({super.key});

  @override
  State<DietDisplay> createState() => _DietDisplayState();
}

class _DietDisplayState extends State<DietDisplay> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveWidget(
      builder: (context, adpter){
        PxFunction px = adpter.px;
        return SfssWidget.card(
          colors: SfssStyle.solarTermColors[3],
          child: Column(
            children: [
              SizedBox(
                height: px(21),
              ),
              Row(
                children: [
                  SizedBox(
                    width: px(35),
                  ),
                  SfssWidget.text(
                    '时令饮食计划',
                    fontSize: px(20),
                    color: Colors.white
                  ),
                  SizedBox(width: px(58),),
                  RichText(
                    //第13天
                    text: TextSpan(
                      text: '第',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: SfssStyle.mainFont,
                        fontSize: px(12)
                      ),
                      children: [
                        TextSpan(
                          text: '13',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: SfssStyle.mainFont,
                            fontSize: px(20)
                          )
                        ),
                        TextSpan(
                          text: '天',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: SfssStyle.mainFont,
                            fontSize: px(12)
                          )
                        )
                      ]
                    )
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: px(35), top: px(8), right: px(35)),
                child: SfssWidget.text(
                  "本计划共计1年，能够让您顺应饮食节气调节自己的每日饮食，平衡四时节气。",
                  fontSize: px(12),
                  color: Colors.white,
                  strutStyle: StrutStyle(
                    height: 1.7
                  ),
                ),
              ),
            ]
          )
        );
      }, uiWidth: 304, uiHeight: 110
    );
  }
}