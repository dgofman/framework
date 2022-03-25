import 'package:flutter/material.dart';
import 'package:framework/base_navigator.dart';
import 'package:framework/base_widget.dart';
import 'package:framework/provider.dart';

import './about.dart';
import './home.dart';
import './login.dart';
import './not_found.dart';

class TestNavigator extends BaseNavigator {
  // ignore_for_file: constant_identifier_names
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const ABOUT = '/about';

  @override
  BaseWidgetState createWidget(RouteSettings settings, Provider provider) {
    switch (settings.name) {
      case LOGIN:
        return LoginWidget(provider);
      case HOME:
        return HomeWidget(provider);
      case ABOUT:
        return AboutWidget(provider);
      default:
        return NotFoundWidget(provider);
    }
  }

  @override
  BaseWidgetState landingPage(RouteSettings settings, Provider provider) =>
      LoginWidget(provider);
}
