import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sfss/data/sfss_data.dart';
import 'package:sfss/plugins/widget_adapter.dart';
import 'package:sfss/styles/sfss_style.dart';
import 'package:sfss/utils/animation_helper.dart';
import 'package:sfss/widgets/adaptive_widget.dart';
import 'package:sfss/widgets/sfss_widget.dart';
import 'package:visibility_detector/visibility_detector.dart';

class FoodCard extends StatefulWidget {
  final String name, desc;
  final int solarTermIndex;
  final int id;
  final void Function(int) onAnim;
  final bool Function(int) judgeAnimationEnable;
  const FoodCard({super.key, required this.name, required this.desc, required this.solarTermIndex, required this.onAnim, required this.judgeAnimationEnable, required this.id});

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> with TickerProviderStateMixin {
  bool visible = false;
  int randomVal = Random().nextInt(50)+50;
  late AnimationController controller;
  late AnimationController controller2;
  late Animation<double> scale;
  late Animation<double> opacity;
  late Animation<double> offset;
  late Animation<double> offset2;
  var f;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    )..forward();
    controller2 = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();
    f = getAnimationGenerator(controller, beginVal: 0.0, endVal: 1, curve: Curves.easeOutBack);
    offset = f(0.0, 1.0);
    f = getAnimationGenerator(controller2, beginVal: 0.0, endVal: 1, curve: Curves.easeOutBack);
    offset2 = f(0.0, 1.0);
  }
  @override void dispose() {
    // TODO: implement dispose
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AdaptiveWidget(builder: (context, adapter){
      PxFunction px = adapter.px;
      return VisibilityDetector(
        key: Key(widget.solarTermIndex.toString()+widget.name+widget.desc),
        onVisibilityChanged: (info) {
          if(info.visibleFraction > 0 && visible == false) {
            // controller2.animateTo(0, duration: Duration(minutes: 0));
            controller2.animateTo(1,duration: Duration(milliseconds: 300)).then((_) {
              widget.onAnim(widget.id);
              return null;
            });
            setState(() {
              visible = true;
            });
          }
        },
        child: AnimatedBuilder(
          animation: Listenable.merge([controller, controller2]),
          builder: (context, child) => Transform.translate(
            offset: widget.judgeAnimationEnable(widget.id)?Offset(0, px(randomVal)*(1-offset.value*0.7)*(1-offset2.value)):Offset(0, 0),
            child: SfssWidget.card(
              width: px(100),
              
              colors: SfssStyle.solarTermColors[widget.solarTermIndex],
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: px(23.0, maxScale: 1)),
                    child: SfssWidget.text(
                      widget.name,
                      fontSize: px(24, maxScale: 1.5),
                      color: Colors.white
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: px(0.0, maxScale: 1), left: px(20, maxScale: 1), right: px(20, maxScale: 1), bottom: px(22, maxScale: 1)),
                    child: SfssWidget.text(
                      widget.desc,
                      fontSize: px(10, maxScale: 1.5),
                      color: Colors.white,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      strutStyle: StrutStyle(
                        height: 1.8
                      ),
                      textAlign: TextAlign.center
                    ),
                  ),
                ]
              )
            ),
          ),
        ),
      );
    }, 
      uiWidth: 152, 
      uiHeight: 111
    );
  }
}