import 'package:flutter/material.dart';
import 'package:sfss/plugins/adapter.dart';
import 'package:sfss/plugins/widget_adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/widgets/adaptive_widget.dart';

class SolarTermBadge extends StatefulWidget {
  const SolarTermBadge({super.key});

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
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: SfssStyle.badgeLevelColors[0],
            //圆形
            borderRadius: BorderRadius.circular(Adapter.adapter?.screenH()),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(0, 4),
                blurRadius: 28,
                spreadRadius: -9,
              )
            ]
          ),
          child: ClipRRect(
            child: Padding(
              padding: EdgeInsets.all(px(0.0)),
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/badge/立秋test.png'
                      )
                    )
                  ),
                ),
              ),
            )
          ),
        );
      }
    );
  }
}