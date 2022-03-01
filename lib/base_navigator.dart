import 'package:flutter/material.dart';
import 'package:framework/base_widget.dart';
import 'package:framework/provider.dart';
import 'package:framework/route_info.dart';

abstract class BaseNavigator implements INavigator {
  late String _routeName;

  @override
  String get routeName => _routeName;

  @override
  set routeName(String name) => _routeName = name;

  @override
  get onGenerateRoute {
      return  (RouteSettings settings) {
        return createRoute(settings);
      };
  }

  @override
  MaterialPageRoute createRoute(RouteSettings settings) {
    return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) {
          final provider = Provider.of(context);
          BaseWidgetState stateWidget = createWidget(settings, provider);
          if (!provider.sharedModel.isAuthorized && !stateWidget.isWhitelist) {
            stateWidget = landingPage(settings, provider);
          }
          final widget = BaseWidget(() => stateWidget);
          provider.sharedModel.routeInfo = RouteInfo(widget, stateWidget, settings);
          return widget;
        }
    );
  }

  BaseWidgetState landingPage(RouteSettings settings, Provider provider);
}

abstract class INavigator {
  get onGenerateRoute;
  String get routeName;
  set routeName(String name);
  BaseWidgetState createWidget(RouteSettings settings, Provider provider);
  MaterialPageRoute createRoute(RouteSettings settings);
}