import 'package:flutter/material.dart';
import 'package:framework/shared_model.dart';

class Provider extends InheritedWidget {
  final IProvider appWidget;
  final SharedModel sharedModel;

  const Provider({
    Key? key,
    required this.appWidget,
    required this.sharedModel,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static void changeLocale(BuildContext context, Locale locale) {
    Provider.of(context).appWidget.changeLocale(context, locale);
  }

  static void changeTheme(BuildContext context, ThemeData theme) {
    Provider.of(context).appWidget.changeTheme(context, theme);
  }

  static Provider of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<Provider>()!;
  }
}

abstract class IProvider {
  void changeLocale(BuildContext context, Locale locale);
  void changeTheme(BuildContext context, ThemeData theme);
}