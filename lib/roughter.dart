export 'pages/login/page_login.dart';
export 'pages/welcome/page_welcome.dart';
export 'pages/register/page_register.dart';
export 'pages/home/page_home.dart';
export 'pages/detail/page_detail.dart';

import 'pages/login/page_login.dart';
import 'pages/welcome/page_welcome.dart';
import 'pages/register/page_register.dart';
import 'pages/home/page_home.dart';
import 'pages/detail/page_detail.dart';

import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/':(context) {
    return const PageWelcome();
  },
  '/login': (context) {
    return const PageLogin();
  },
  '/register': (context) {
    return const PageRegister();
  },
  '/home': (context) {
    return const PageHome();
  },
};