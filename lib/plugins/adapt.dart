import 'package:flutter/material.dart';

class Adapt {
    late double _width;
    late double _height;
    late double _topbarH;
    late double _botbarH;
    late double _pixelRatio;
    static Adapt? adapt;
    static int? _uiwidth;
    static int? _uiheight;
    static const int UI_HEIGHT = 844;
    static const int UI_WIDTH = 390;
    Adapt({required BuildContext context, uiwidth = UI_WIDTH, uiheight = UI_HEIGHT}) {
      MediaQueryData mediaQuery = MediaQuery.of(context);
      _width = mediaQuery.size.width;
      _height = mediaQuery.size.height;
      _topbarH = mediaQuery.padding.top;
      _botbarH = mediaQuery.padding.bottom;
      _pixelRatio = mediaQuery.devicePixelRatio;
      _uiwidth = uiwidth;
      _uiheight = uiheight;
      adapt = this;
    }
    var _ratio;
    var _ratioH;
    init(int uiwidth, int uiheight){
        _ratio = _width / uiwidth;
        _ratioH = _height / uiheight;
    }
    static px(number){
      if(adapt == null) {
        return 0;
      }
      if(adapt?._ratio == null){adapt?.init(_uiwidth!, _uiheight!);}
      return number * adapt?._ratio;
    }
    static pxH(number){
      if(adapt == null) {
        return 0;
      }
      if(adapt?._ratio == null){adapt?.init(_uiwidth!, _uiheight!);}
      return number * adapt?._ratioH;
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

double px(number, {double? min, double? max, double? minScale, double? maxScale}) {
  double res = Adapt.px(number);
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
  print(res);
  return res;
}


double pxh(number, {double? min, double? max, double? minScale, double? maxScale}) {
  double res = Adapt.pxH(number);
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
  print(res);
  return res;
}