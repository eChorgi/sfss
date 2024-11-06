import 'package:flutter/material.dart';

class Adapt {
    late double _width;
    late double _height;
    late double _topbarH;
    late double _botbarH;
    late double _pixelRatio;
    static Adapt? adapt = null;
    static int? _uiwidth;
    Adapt({required BuildContext context, uiwidth = 1045}) {
      MediaQueryData mediaQuery = MediaQuery.of(context);
      _width = mediaQuery.size.width;
      _height = mediaQuery.size.height;
      _topbarH = mediaQuery.padding.top;
      _botbarH = mediaQuery.padding.bottom;
      _pixelRatio = mediaQuery.devicePixelRatio;
      _uiwidth = uiwidth;
      adapt = this;
    }
    var _ratio;
    init(int uiwidth){
        _ratio = _width / uiwidth;
    }
    static px(number){
      if(adapt == null) {
        return 0;
      }
      if(adapt?._ratio == null){adapt?.init(_uiwidth!);}
      return number * adapt?._ratio;
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

double px(number) {
  return Adapt.px(number);
}