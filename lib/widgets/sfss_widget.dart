import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:sfss/plugins/adapter.dart';
import 'package:sfss/styles/sfss_style.dart';


class SfssWidget{
  static Widget assetImage(String name) {
    return LayoutBuilder(
      builder: (context, boxConstraints){
        Image image = Image.asset(
          name,
          fit: BoxFit.fitWidth,
          width: double.infinity,
        );
        double ?imgW, imgH;
        image.image
          .resolve(new ImageConfiguration())
          .addListener(
            new ImageStreamListener(
            (ImageInfo info, bool _) {
              imgW = info.image.width.toDouble();
              imgH = info.image.height.toDouble();
            })
          );
        var displayH = imgH!*boxConstraints.maxWidth/imgW!;
        return Image.asset(
          name,
          fit: BoxFit.fitWidth,
          width: double.infinity,
          height: max(100, min(200, displayH)),
        );
      }
    );
  }

  static Widget text(String content, {Color ?color, double ?fontSize, String? fontFamily, TextAlign ?textAlign, TextOverflow ?overflow, int ?maxLines, TextDecoration ?decoration}) {
    return Text(
      content,
      style: TextStyle(
        color: color ?? SfssStyle.mainGrey,
        fontSize: fontSize ?? pxh(20),
        fontFamily: fontFamily ?? SfssStyle.mainFont,
      ),
      maxLines: maxLines,
      overflow: overflow,
    );
  }
  static Widget button({ required String text, Decoration ?decoration, double ?fontSize, TextStyle ? textStyle, EdgeInsetsGeometry ?padding, Color ?color, Color ?borderColor, double ? borderWidth, CupertinoDynamicColor ?disabledColor, double ?minSize, double ?pressedOpacity, BorderRadius ?borderRadius, Alignment ?alignment, Color ?focusColor, FocusNode ?focusNode, void Function(bool) ?onFocusChange, bool ?autofocus,  required void Function()? onPressed}) {
    return _button(decoration:decoration, padding:padding, color: color ?? const Color(0xFF791414), borderColor: borderColor, borderWidth: borderWidth, disabledColor:disabledColor, minSize:minSize, pressedOpacity:pressedOpacity, borderRadius:borderRadius, alignment:alignment, focusColor:focusColor, focusNode:focusNode, onFocusChange:onFocusChange, autofocus:autofocus,  onPressed: onPressed,
      child: Text(
        text,
        style: textStyle?? TextStyle(
          color: const Color(0xFFFFFFFF),
          fontFamily: SfssStyle.mainFont,
          fontSize: fontSize??px(20),
        ),
      ),
    );
  }
  static BottomNavigationBarItem tabBarItem(String text) {
    return BottomNavigationBarItem(
      icon: Row(
        children: [
          const SizedBox(
            height: 14,
            width: 9.5,
          ),
          Text(
            text,
            style: TextStyle(
              color: const Color(0xFF4A5568),
              fontSize: 14.5,
              fontFamily: SfssStyle.mainFont,
            ),
          ),
        ],
      ),
      activeIcon: Row(
        children: [
          Container(
            height: 14,
            width: 7.5,
            decoration: BoxDecoration(
              color: SfssStyle.mainRed,
              borderRadius: const BorderRadius.all(Radius.circular(2))
            ),
          ),
          const SizedBox(
            width: 2,
          ),
          Text(
            text,
            style: TextStyle(
              color: SfssStyle.mainRed,
              fontSize: 14.5,
              fontFamily: SfssStyle.mainFont,
            ),
          ),
        ],
      ),
    );
  }
  static Widget card({double ?height, double ?width, bool ?isFrosted, Widget ?child}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(pxfit(10)),
        image: (isFrosted ?? true) ? const DecorationImage(
          image: AssetImage("assets/images/home/frosted_spots.jpg"),
          scale: 0.7,
          repeat: ImageRepeat.repeat,
        ):null,
        gradient: const RadialGradient(
          center: Alignment(-0.77, 0.52),
          radius: 1.76,
          colors: [
            Color(0xFF7A1515),
            Color(0xFF934141),
            Color(0xFF9D5353)
          ],
        ),
        border: Border.all(
          color: const Color(0x2BFFFFFF),
          width: pxfit(0.86),
          strokeAlign: BorderSide.strokeAlignInside
        ),
      ),
      child: child,
    );
  }

  static Widget _button({ required Widget child, Decoration? decoration, EdgeInsetsGeometry ?padding, Color ?color, Color ?borderColor, double ?borderWidth, CupertinoDynamicColor ?disabledColor, double ?minSize, double ?pressedOpacity, BorderRadius ?borderRadius = BorderRadius.zero, Alignment ?alignment, Color ?focusColor, FocusNode ?focusNode, void Function(bool) ?onFocusChange, bool ?autofocus, void Function()? onLongPress, required void Function()? onPressed,}) {
    return CupertinoButton(
      padding:padding??const EdgeInsets.all(0),
      color: color ?? const Color(0xFF791414),
      disabledColor:disabledColor ?? CupertinoColors.quaternarySystemFill,
      minSize:minSize,
      pressedOpacity:pressedOpacity ?? 0.4,
      borderRadius:borderRadius ?? BorderRadius.circular(px(18, maxScale: 1)),
      alignment:alignment ?? Alignment.center,
      focusColor:focusColor,
      focusNode:focusNode,
      onFocusChange:onFocusChange,
      autofocus:autofocus ?? false,
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration: decoration??BoxDecoration(
          border: Border.all(color: borderColor ?? const Color(0x00000000), width: borderWidth ?? 1),
          borderRadius: borderRadius ?? BorderRadius.circular(px(11)),
        ),
        child: child,
      ),
    );
  }
}