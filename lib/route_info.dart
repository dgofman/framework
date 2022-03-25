import 'package:flutter/cupertino.dart';
import 'package:framework/base_widget.dart';

class RouteInfo {
  final Widget widget;
  final BaseWidgetState stateWidget;
  final RouteSettings settings;
  RouteInfo(this.widget, this.stateWidget, this.settings);
}
