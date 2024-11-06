import 'package:flutter/cupertino.dart';
import 'package:sfss/plugins/adapt.dart';
import 'package:sfss/styles/mainStyle.dart';


class SfssWidget{
  static Widget button({ required String text, TextStyle ? textStyle, EdgeInsetsGeometry ?padding, Color ?color, Color ?borderColor, double ? borderWidth, CupertinoDynamicColor ?disabledColor, double ?minSize, double ?pressedOpacity, BorderRadius ?borderRadius, Alignment ?alignment, Color ?focusColor, FocusNode ?focusNode, void Function(bool) ?onFocusChange, bool ?autofocus,  required void Function()? onPressed}) {
    return _button(padding:padding, color: color ?? const Color(0xFF791414), borderColor: borderColor, borderWidth: borderWidth, disabledColor:disabledColor, minSize:minSize, pressedOpacity:pressedOpacity, borderRadius:borderRadius, alignment:alignment, focusColor:focusColor, focusNode:focusNode, onFocusChange:onFocusChange, autofocus:autofocus,  onPressed: onPressed,
      child: Text(
        text,
        style: textStyle?? TextStyle(
          color: const Color(0xFFFFFFFF),
          fontFamily: SfssStyle.mainFont,
          fontSize: px(64),
        ),
      ),
    );
  }

  static Widget _button({ required Widget child,  EdgeInsetsGeometry ?padding, Color ?color, Color ?borderColor, double ?borderWidth, CupertinoDynamicColor ?disabledColor, double ?minSize, double ?pressedOpacity, BorderRadius ?borderRadius = BorderRadius.zero, Alignment ?alignment, Color ?focusColor, FocusNode ?focusNode, void Function(bool) ?onFocusChange, bool ?autofocus, void Function()? onLongPress, required void Function()? onPressed,}) {
    return CupertinoButton(
      padding:padding,
      color: color ?? const Color(0xFF791414),
      disabledColor:disabledColor ?? CupertinoColors.quaternarySystemFill,
      minSize:minSize,
      pressedOpacity:pressedOpacity ?? 0.4,
      borderRadius:borderRadius ?? BorderRadius.circular(px(11)),
      alignment:alignment ?? Alignment.center,
      focusColor:focusColor,
      focusNode:focusNode,
      onFocusChange:onFocusChange,
      autofocus:autofocus ?? false,
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? const Color(0x00000000), width: borderWidth ?? 1),
          borderRadius: borderRadius ?? BorderRadius.circular(px(11)),
        ),
        child: child,
      ),
    );
  }
}