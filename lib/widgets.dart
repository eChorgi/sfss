import 'package:flutter/cupertino.dart';


class Sfss{
  static Widget button({ required String text, TextStyle ? textStyle, CupertinoButtonSize ?sizeStyle, EdgeInsetsGeometry ?padding, Color ?color, Color ?borderColor, double ? borderWidth, CupertinoDynamicColor ?disabledColor, double ?minSize, double ?pressedOpacity, BorderRadius ?borderRadius, Alignment ?alignment, Color ?focusColor, FocusNode ?focusNode, void Function(bool) ?onFocusChange, bool ?autofocus, void Function()? onLongPress, required void Function()? onPressed}) {
    return _button(sizeStyle:sizeStyle, padding:padding, color: color ?? const Color(0xFF791414), borderColor: borderColor, borderWidth: borderWidth, disabledColor:disabledColor, minSize:minSize, pressedOpacity:pressedOpacity, borderRadius:borderRadius, alignment:alignment, focusColor:focusColor, focusNode:focusNode, onFocusChange:onFocusChange, autofocus:autofocus, onLongPress:onLongPress, onPressed: onPressed,
      child: Text(
        text,
        style: textStyle?? const TextStyle(
          color: Color(0xFFFFFFFF),
          fontFamily: "WYMingChao",
          fontSize: 25,
        ),
      ),
    );
  }

  static Widget _button({ required Widget child, CupertinoButtonSize ?sizeStyle, EdgeInsetsGeometry ?padding, Color ?color, Color ?borderColor, double ?borderWidth, CupertinoDynamicColor ?disabledColor, double ?minSize, double ?pressedOpacity, BorderRadius ?borderRadius = BorderRadius.zero, Alignment ?alignment, Color ?focusColor, FocusNode ?focusNode, void Function(bool) ?onFocusChange, bool ?autofocus, void Function()? onLongPress, required void Function()? onPressed,}) {
    return CupertinoButton(
      sizeStyle:sizeStyle ?? CupertinoButtonSize.large,
      padding:padding,
      color: color ?? const Color(0xFF791414),
      disabledColor:disabledColor ?? CupertinoColors.quaternarySystemFill,
      minSize:minSize,
      pressedOpacity:pressedOpacity ?? 0.4,
      borderRadius:borderRadius ?? BorderRadius.circular(4),
      alignment:alignment ?? Alignment.center,
      focusColor:focusColor,
      focusNode:focusNode,
      onFocusChange:onFocusChange,
      autofocus:autofocus ?? false,
      onLongPress:onLongPress,
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? const Color(0x00000000), width: borderWidth ?? 1),
          borderRadius: borderRadius ?? BorderRadius.circular(4),
        ),
        child: child,
      ),
    );
  }
}