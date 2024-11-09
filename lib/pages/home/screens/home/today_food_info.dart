import 'package:flutter/material.dart';
import 'package:sfss/plugins/widget_adapter.dart';
import 'package:sfss/widgets/adaptive_widget.dart';

class TodayFoodInfo extends StatefulWidget {
  const TodayFoodInfo({super.key});

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
      },
    );
  }
}