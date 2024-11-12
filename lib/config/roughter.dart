export '../__old/login/pageLogin.dart';
export '../pages/page_welcome_login/page_welcome_login.dart';
export '../__old/register/pageRegister.dart';
export '../__old/pagePome.dart';
export '../__old/detail/pageDetail.dart';

import 'package:sfss/pages/page_record_edit/page_record_edit.dart';

import '../__old/login/pageLogin.dart';
import '../pages/page_welcome_login/page_welcome_login.dart';
import '../__old/register/pageRegister.dart';
import '../pages/page_home/page_home.dart';
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
  '/recordEdit': (context) {
    return const PageRecordEdit();
  },
};