import 'package:flutter/material.dart';

Animation<double> Function(double, double) getAnimationGenerator(AnimationController controller, {double beginVal = 0, double endVal = 1, Curve curve = Curves.ease}) {
  return (double begin, double end) => Tween<double>(
    begin: beginVal,
    end: endVal,
  ).animate(
    CurvedAnimation(
      parent: controller,
      curve: Interval(
        begin,
        end,
        curve: curve,
      ),
    ),
  );
}

List<Animation<double>> getContinuousAnimations(AnimationController ?controller, int intvNum, Animation<double> Function(double, double) ?animationGenerator, {double begin = 0, double end = 1, Curve curve = Curves.ease, double smooth = 0.5}) {
  if(controller == null && animationGenerator == null) throw Exception('both is null');
  animationGenerator ??= getAnimationGenerator(controller!, beginVal: begin, endVal: end, curve: curve);
  List<Animation<double>> animations = [];
  for(int i = 0; i < intvNum; i++) {
    double interval = 1/intvNum;
    var begin = (1-smooth)*interval * i;
    var end = interval * (i + 1);

    if (begin < 0.0) begin = 0.0;
    if (end > 1) end = 1.0;
    animations.add(animationGenerator(begin, end));
  }
  return animations;
}