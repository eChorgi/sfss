export 'pages/login/pageLogin.dart';
export 'pages/welcome/page_welcome_login.dart';
export 'pages/register/pageRegister.dart';
export 'pages/home/pagePome.dart';
export 'pages/detail/pageDetail.dart';

import 'pages/login/pageLogin.dart';
import 'pages/welcome/page_welcome_login.dart';
import 'pages/register/pageRegister.dart';
import 'pages/home/page_home.dart';
import 'pages/detail/pageDetail.dart';

import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> appRoutes = {
  '/':(context) {
    return const PageWelcomeLogin();
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