import 'package:flutter/material.dart';
import 'package:framework/base_widget.dart';
import 'package:framework/provider.dart';

import './navigator.dart';

class LoginWidget extends BaseWidgetState {
  LoginWidget(Provider provider) : super(provider, isWhitelist: true);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Login')),
        body: SingleChildScrollView(
          controller: ScrollController(),
          child: Form(
            child: Center(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 60),
                  Text('Authorized: ${sharedModel.isAuthorized}'),
                  ElevatedButton(
                    onPressed: () {
                      goNext(TestNavigator.HOME);
                    },
                    child: const Text('Go Home'),
                  ),
                  const SizedBox(height: 60),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        sharedModel.isAuthorized = true;
                      });
                    },
                    child: const Text('Authenticate'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
