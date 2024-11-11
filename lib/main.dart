import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sfss/config/roughter.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(CupertinoApp(
    theme: const CupertinoThemeData(brightness: Brightness.light),
    title: '四方食事',
    initialRoute: '/',
    routes: appRoutes,
  ));
}
