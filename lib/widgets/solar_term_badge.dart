import 'package:flutter/material.dart';
import 'package:sfss/plugins/adapter.dart';
import 'package:sfss/plugins/widget_adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/adaptive_widget.dart';

class SolarTermBadge extends StatefulWidget {
  final int index;
  final int level;
  const SolarTermBadge({super.key, required this.index, required this.level});

  @override
  State<SolarTermBadge> createState() => _SolarTermBadgeState();
}

class _SolarTermBadgeState extends State<SolarTermBadge> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveWidget(
      uiWidth: 85, 
      uiHeight: 85,
      builder: (context, adapter){
        PxFunction px = adapter.px;
        return Center(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: SfssStyle.badgeLevelColors[widget.level],
              //圆形
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: Offset(0, px(4)),
                  blurRadius: px(18),
                  spreadRadius: -px(9),
                )
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(px(6.0)),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: Offset(0, px(4)),
                      blurRadius: px(18),
                      spreadRadius: -px(9),
                    )
                  ],
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/badge/badge_${widget.index+1}.png'
                    )
                  )
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}