import 'package:flutter/material.dart';
import 'package:sfss/plugins/widget_adapter.dart';

class AdaptiveWidget extends StatefulWidget {
  final int uiWidth;
  final int uiHeight;
  final Widget Function(BuildContext, WidgetAdapter) builder;
  const AdaptiveWidget({super.key,required this.builder, required this.uiWidth, required this.uiHeight});

  @override
  State<AdaptiveWidget> createState() => AdaptiveWidgetState();
}

class AdaptiveWidgetState extends State<AdaptiveWidget> {
  

  WidgetAdapter ?adapter;
  dynamic px;
  dynamic pxh;
  dynamic pxfit;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        adapter ??= WidgetAdapter(boxConstraints: constraints, widgetUiWidth: widget.uiWidth, widgetUiHeight: widget.uiHeight);
        return widget.builder(context, adapter!);
      });
  }
}