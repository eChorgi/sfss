import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:sfss/enums/solar_term_enums.dart';
import 'package:sfss/plugins/widget_adapter.dart';
import 'package:sfss/utils/animation_helper.dart';
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

class _BadgeDisplayState extends State<BadgeDisplay> with TickerProviderStateMixin {
  ValueNotifier<double> angleX = ValueNotifier(0);
  ValueNotifier<double> angleY = ValueNotifier(0);
  ValueNotifier<double> angleZ = ValueNotifier(0);
  double oldAngleX = 0;
  double oldAngleY = 0;
  double oldAngleZ = 0;
  late Animation<double> f;
  late AnimationController controller;
  
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this
    );
    f = Tween<double>(begin: 0, end: 1).animate(controller);
    gyroscopeEventStream().listen((GyroscopeEvent event) {
      
      // print(
      //     "Gyroscope event: x: ${event.x}, y: ${event.y}, z: ${event.z}"
      // );
      if(mounted && controller.status != AnimationStatus.forward) {
        
        oldAngleX = angleX.value;
        oldAngleY = angleY.value;
        oldAngleZ = angleZ.value;
        
        angleX.value += event.x;
        angleX.value = min(2, max(-2, angleX.value));
        angleY.value += event.y;
        angleY.value = min(2, max(-2, angleY.value));
        angleZ.value += event.z;
        angleZ.value = min(2, max(-2, angleZ.value));

        if(angleX.value != oldAngleX || angleY.value != oldAngleY || angleZ.value != oldAngleZ) {
          controller.forward(from: 0);
        }
      }
    },
    onError: (error){
      print(error);
    },
    cancelOnError: true
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return AdaptiveWidget(uiWidth: 85, uiHeight: 130, 
    builder: (context, adapter){
      PxFunction px = adapter.px;
      return Column(
        children: [
          ValueListenableBuilder(
            valueListenable: angleX,
            builder: (context, value, child) {
              return AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return Transform(
                    transform: Matrix4.rotationX(angleX.value/8 * f.value + oldAngleX/8*(1-f.value))*Matrix4.rotationY(angleY.value/8 * f.value + oldAngleY/8*(1-f.value)),
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: SizedBox(
                        width: px(85),
                        child: SolarTermBadge(index: widget.index, level: widget.current < 0.2*widget.total?0: widget.current < 0.6*widget.total?1:2,)
                      ),
                    ),
                  );
                }
              );
            }
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
            '已收集${widget.current}/${widget.total}个\n',
            fontSize: px(9)
          )
        ],
      );
    });
  }
}