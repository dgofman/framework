import 'package:flutter/material.dart';
import 'package:framework/base_widget.dart';
import 'package:framework/provider.dart';

import './navigator.dart';

class AboutWidget extends BaseWidgetState {
  AboutWidget(Provider provider) : super(provider);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('About')),
        body: SingleChildScrollView(
          controller: ScrollController(),
          child: Form(
            child: Column(
              children: <Widget>[
                const SizedBox(height: 60),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      goNext(TestNavigator.HOME);
                    },
                    child: const Text('Go Home'),
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
