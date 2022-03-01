import 'package:flutter/material.dart';
import 'package:framework/base_navigator.dart';
import 'package:framework/provider.dart';
import 'package:framework/shared_model.dart';

class BaseWidget extends StatefulWidget {
  final BaseWidgetState Function() _factory;
  const BaseWidget(this._factory, {Key? key}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _factory();
}

abstract class BaseWidgetState extends State<BaseWidget> with AutomaticKeepAliveClientMixin<BaseWidget> {
  final bool isWhitelist;
  final Provider _provider;

  late Text? popupMessage;

  BaseWidgetState(this._provider, {this.isWhitelist = false});

  Provider get provider => _provider;
  SharedModel get sharedModel => provider.sharedModel;
  INavigator get navigator => sharedModel.navigator;
  Locale? get locale => sharedModel.locale;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void setState(VoidCallback? fn) {
    if (fn != null) {
      try {
        super.setState(fn);
      } catch (ex) {
        fn();
      }
    }
  }

  GestureTapCallback get goBack => () {
    Navigator.pop(context);
  };

  void goNext(String name, [Object? argument]) {
    navigator.routeName = name;
    if (argument == null) {
      Navigator.of(context).pushReplacementNamed(name);
    } else {
      final route = navigator.createRoute(RouteSettings(name: name, arguments: argument));
      Navigator.push(context, route);
    }
  }

  Drawer createDrawer(BuildContext context, List<Widget> children) {
    return Drawer(
      child: ListView(
        primary: false, //https://api.flutter.dev/flutter/widgets/ScrollView/physics.html
        padding: EdgeInsets.zero,
        children: children,
      ),
    );
  }
}