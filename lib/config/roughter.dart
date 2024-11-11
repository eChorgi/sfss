export '../__old/login/pageLogin.dart';
export '../pages/welcome/page_welcome_login.dart';
export '../__old/register/pageRegister.dart';
export '../__old/pagePome.dart';
export '../__old/detail/pageDetail.dart';

import '../__old/login/pageLogin.dart';
import '../pages/welcome/page_welcome_login.dart';
import '../__old/register/pageRegister.dart';
import '../pages/home/page_home.dart';
import '../__old/detail/pageDetail.dart';

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