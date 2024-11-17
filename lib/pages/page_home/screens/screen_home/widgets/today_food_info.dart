import 'package:flutter/material.dart';
import 'package:sfss/enums/solar_term_enums.dart';
import 'package:sfss/plugins/widget_adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/adaptive_widget.dart';
import 'package:sfss/widgets/sfss_widget.dart';

class TodayFoodInfo extends StatefulWidget {
  final int solarTermIndex;
  final bool checked;
  const TodayFoodInfo({super.key, this.solarTermIndex = 0, this.checked = false});

  @override
  State<TodayFoodInfo> createState() => _TodayFoodInfoState();
}

class _TodayFoodInfoState extends State<TodayFoodInfo> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveWidget(
      uiWidth: 309, 
      uiHeight: 114,
      builder: (context, adapter) {
        PxFunction px = adapter.px;
        return Column(
          children: [
            // SfssWidget.text(
            //   '今日可公开时令食物情报',
            //   fontSize: px(16)
            // ),
            // SizedBox(height: px(10),),
            // for (int i = 0; i < 24; i+=1)
              SfssWidget.card(
                width: px(308),
                height: px(83),
                // colors: SfssStyle.solarTermColors[i],
                colors: SfssStyle.solarTermColors[widget.solarTermIndex],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: px(25.0), right: px(35)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SfssWidget.text(
                            '羊肉',
                            fontSize: px(30),
                            color: Colors.white
                          ),
                          if(widget.checked)Icon(
                            Icons.check_box_rounded,
                            color: Colors.white,
                            size: px(22),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: px(10),),
                    Padding(
                      padding: EdgeInsets.only(left: px(29.0)),
                      child: SfssWidget.text(
                        '性温味甘，补中益气，暖胃驱寒，为御寒上品。',
                        fontSize: px(12),
                        color: Colors.white
                      ),
                    ),
                    SizedBox(height: px(6),)
                  ],
                )
              ),
          ],
        );
      },
    );
  }
}