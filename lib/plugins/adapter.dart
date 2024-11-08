import 'package:flutter/material.dart';
import 'dart:math';

class Adapter {
    late double _width;
    late double _height;
    late double _topbarH;
    late double _botbarH;
    late double _pixelRatio;
    static Adapter? adapter;
    static int? _uiwidth;
    static int? _uiheight;
    static const int UI_HEIGHT = 844;
    static const int UI_WIDTH = 390;
    Adapter({required BuildContext context, uiwidth = UI_WIDTH, uiheight = UI_HEIGHT}) {
      MediaQueryData mediaQuery = MediaQuery.of(context);
      _width = mediaQuery.size.width;
      _height = mediaQuery.size.height;
      _topbarH = mediaQuery.padding.top;
      _botbarH = mediaQuery.padding.bottom;
      _pixelRatio = mediaQuery.devicePixelRatio;
      _uiwidth = uiwidth;
      _uiheight = uiheight;
      adapter = this;
    }
    var _ratio;
    var _ratioH;
    init(int uiwidth, int uiheight){
        _ratio = _width / uiwidth;
        _ratioH = _height / uiheight;
    }
    static px(number){
      if(adapter == null) {
        return 0;
      }
      if(adapter?._ratio == null){adapter?.init(_uiwidth!, _uiheight!);}
      return number * adapter?._ratio;
    }
    static pxH(number){
      if(adapter == null) {
        return 0;
      }
      if(adapter?._ratio == null){adapter?.init(_uiwidth!, _uiheight!);}
      return number * adapter?._ratioH;
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
    padTopH(){
        return _topbarH;
    }
    padBotH(){
        return _botbarH;
    }
}

double px(number, {double noLimitExtraWScale = 0, double noLimitExtraHScale = 0,double extraWScale = 0, double extraHScale = 0, double? min, double? max, double? minScale, double? maxScale}) {
  maxOf(double n1, double n2) => n1 > n2 ? n1 : n2;
  double res = Adapter.px(number);
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
  double res = Adapter.pxH(number);
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