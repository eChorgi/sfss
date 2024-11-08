import 'package:flutter/material.dart';
import 'dart:math';

import 'package:sfss/plugins/adapter.dart';

class WidgetAdapter {
    late double _width;
    late double _height;
    late double _pixelRatio;
    late double _scaleW;
    late double _scaleH;
    static double? _uiwidth;
    static double? _uiheight;
    static const int UI_HEIGHT = 844;
    static const int UI_WIDTH = 390;
    WidgetAdapter({required BoxConstraints boxConstraints, scaleW, scaleH, widgetUiWidth, widgetUiHeight}) {
      _width = boxConstraints.maxWidth;
      if(boxConstraints.maxHeight == double.infinity) {
        _height = UI_HEIGHT.toDouble();
      }
      else{
        _height = boxConstraints.maxHeight;
      }
      _uiwidth = widgetUiWidth.toDouble();
      _uiheight = widgetUiWidth.toDouble();
      
      _scaleW = widgetUiWidth==null?1.0:UI_WIDTH/widgetUiWidth;
      _scaleH = widgetUiHeight==null?1.0:UI_HEIGHT/widgetUiHeight;

      _scaleH *= scaleH??1;
      _scaleW *= scaleW??1;
    }
    var _ratio;
    var _ratioH;
    init(double uiwidth, double uiheight){
        _ratio = _scaleW * _width / uiwidth;
        _ratioH = _scaleH * _height / uiheight;
    }
    pxW(number){
      if(_ratio == null){init(_uiwidth!, _uiheight!);}
      return number * _ratio;
    }
    pxH(number){
      if(_ratio == null){init(_uiwidth!, _uiheight!);}
      return number * _ratioH;
    }
    onepx(){
        return 1/_pixelRatio;
    }
    screenW(){
        return _width;
    }
    screenH(){
        return _height;
    }

  double px(number, {double noLimitExtraWScale = 0, double noLimitExtraHScale = 0,double extraWScale = 0, double extraHScale = 0, double? min, double? max, double? minScale, double? maxScale}) {
    maxOf(double n1, double n2) => n1 > n2 ? n1 : n2;
    double res = pxW(number);
    if(extraHScale != 0) {
      res = res + pxh(extraHScale * number)-extraHScale * number;
    }
    if(extraWScale != 0) {
      res = res + px(extraWScale * number)-extraWScale * number;
    }
    if(min != null) {
      res = res < min ? min : res;
    }
    else if(minScale != null) {
      res = res < minScale * number ? minScale * number : res;
    }
    if(max != null) {
      res = res > max ? max : res;
    }
    else if(maxScale != null) {
      res = res > maxScale * number ? maxScale * number : res;
    }
    if(noLimitExtraHScale != 0) {
      res = res + pxh(noLimitExtraHScale * number)-noLimitExtraHScale * number;
    }
    if(noLimitExtraWScale != 0) {
      res = res + px(noLimitExtraWScale * number)-noLimitExtraWScale * number;
    }
    return res;
  }


  double pxh(number, {double noLimitExtraWScale = 0, double noLimitExtraHScale = 0, double extraWScale = 0, double extraHScale = 0, double? min, double? max, double? minScale, double? maxScale}) {
    maxOf(double n1, double n2) => n1 > n2 ? n1 : n2;
    double res = pxH(number);
    if(extraHScale != 0) {
      res = res + pxh(extraHScale * number)-extraHScale * number;
    }
    if(extraWScale != 0) {
      res = res + px(extraWScale * number)-extraWScale * number;
    }
    if(min != null) {
      res = res < min ? min : res;
    }
    else if(minScale != null) {
      res = res < minScale * number ? minScale * number : res;
    }
    if(max != null) {
      res = res > max ? max : res;
    }
    else if(maxScale != null) {
      res = res > maxScale * number ? maxScale * number : res;
    }
    if(noLimitExtraHScale != 0) {
      res = res + pxh(noLimitExtraHScale * number)-noLimitExtraHScale * number;
    }
    if(noLimitExtraWScale != 0) {
      res = res + px(noLimitExtraWScale * number)-noLimitExtraWScale * number;
    }
    return res;
  }

  double pxfit(number, {double noLimitExtraWScale = 0, double noLimitExtraHScale = 0, double extraWScale = 0, double extraHScale = 0, double? min, double? max, double? minScale, double? maxScale, double wscale = 1, double hscale = 1}) {
    minOf(double n1, double n2) => n1 < n2 ? n1 : n2;
    var res = pxh(extraHScale * number) + px(extraWScale * number) + minOf(wscale*px(number, min: min, max: max, minScale: minScale, maxScale: maxScale), hscale*pxh(number, min: min, max: max, minScale: minScale, maxScale: maxScale));
    if(min != null) {
      res = res < min ? min : res;
    }
    else if(minScale != null) {
      res = res < minScale * number ? minScale * number : res;
    }
    if(max != null) {
      res = res > max ? max : res;
    }
    else if(maxScale != null) {
      res = res > maxScale * number ? maxScale * number : res;
    }
    if(noLimitExtraHScale != 0) {
      res = res + pxh(noLimitExtraHScale * number)-noLimitExtraHScale * number;
    }
    if(noLimitExtraWScale != 0) {
      res = res + px(noLimitExtraWScale * number)-noLimitExtraWScale * number;
    }
    return res;
  }
}