import 'package:flutter/material.dart';
import 'package:framework/provider.dart';
import 'package:framework/shared_model.dart';

class _BaseApp extends StatefulWidget {
  final BaseAppState _stateWidget;
  const _BaseApp(this._stateWidget, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<_BaseApp> createState() => _stateWidget;
}

abstract class BaseAppState extends State<_BaseApp> with WidgetsBindingObserver implements IProvider {
  final SharedModel sharedModel;

  BaseAppState(this.sharedModel);

  _BaseApp createApp() => _BaseApp(this);

  @override
  void changeLocale(BuildContext context, Locale locale) async {
    setState(() {
      sharedModel.locale = locale;
    });
  }

  @override
  void changeTheme(BuildContext context, ThemeData theme) async {
    setState(() {
      sharedModel.theme = theme;
    });
  }

  void goNext(BuildContext context, String name, [Object? argument]) {
    sharedModel.navigator.routeName = name;
    Future.delayed(const Duration(milliseconds: 1), () {
      Navigator.of(context).pushReplacementNamed(name, arguments: argument);
    });
  }
}