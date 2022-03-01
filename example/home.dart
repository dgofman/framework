import 'package:flutter/material.dart';
import 'package:framework/base_widget.dart';
import 'package:framework/provider.dart';

import './navigator.dart';

class HomeWidget extends BaseWidgetState {
  HomeWidget(Provider provider) : super(provider);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: SingleChildScrollView(
          controller: ScrollController(),
          child: Form(
            child: Column(
              children: <Widget>[
                TextButton(
                    child: const Text('Dark Theme'),
                    onPressed: () {
                      Provider.changeTheme(context, ThemeData.dark());
                    }),
                TextButton(
                    child: const Text('Light Theme'),
                    onPressed: () {
                      Provider.changeTheme(context, ThemeData.light());
                    }),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      goNext(TestNavigator.ABOUT);
                    },
                    child: const Text('Go About'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
