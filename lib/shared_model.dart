import 'package:flutter/material.dart';
import 'package:framework/base_navigator.dart';
import 'package:framework/route_info.dart';

class SharedModel {
  final INavigator navigator;

  late bool isAuthorized = false;
  late ThemeData theme;

  Locale? locale;
  RouteInfo? routeInfo;

  SharedModel({
    required this.navigator,
    ThemeData? theme
  }) : theme = theme ?? ThemeData.light();
}