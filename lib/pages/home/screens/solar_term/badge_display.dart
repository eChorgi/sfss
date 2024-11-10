import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sfss/enums/solar_term_enums.dart';
import 'package:sfss/plugins/widget_adapter.dart';
import 'package:sfss/widgets/adaptive_widget.dart';
import 'package:sfss/widgets/sfss_widget.dart';
import 'package:sfss/widgets/solar_term_badge.dart';

class BadgeDisplay extends StatefulWidget {
  final int index;
  final int current, total;
  const BadgeDisplay({super.key, required this.index, required this.current, required this.total});

  @override
  State<BadgeDisplay> createState() => _BadgeDisplayState();
}

class _BadgeDisplayState extends State<BadgeDisplay> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveWidget(uiWidth: 85, uiHeight: 130, 
    builder: (context, adapter){
      PxFunction px = adapter.px;
      return Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: SizedBox(
              width: px(85),
              child: SolarTermBadge(index: widget.index, level: widget.current < 0.2*widget.total?0: widget.current < 0.6*widget.total?1:2,)
            ),
          ),
          SizedBox(height: px(9)),
          SfssWidget.text(
            solarTermName[widget.index],
            fontSize: px(11)
          ),
          SizedBox(height: px(5),),
          Stack(
            children: [
              Container(
                width: px(60),
                height: px(3),
                decoration: BoxDecoration(
                  color: const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(px(3))
                ),
              ),
              Container(
                width: px(60)*(widget.current.toDouble()/widget.total),
                height: px(3),
                decoration: BoxDecoration(
                  color: const Color(0xFFAD7E7E),
                  borderRadius: BorderRadius.circular(px(3))
                ),
              )
            ],
          ),
          SizedBox(height: px(6),),
          SfssWidget.text(
            '已收集${widget.current}/${widget.total}个',
            fontSize: px(9)
          )
          
          

        ],
      );
    });
  }
}