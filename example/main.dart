import 'package:flutter/material.dart';
import 'package:framework/base_app.dart';
import 'package:framework/provider.dart';
import 'package:framework/shared_model.dart';

import './navigator.dart';
import './splash.dart';

void main() async {
  runApp(TestAppState().createApp());
}

class TestAppState extends BaseAppState {
  TestAppState() :
        super(SharedModel(navigator: TestNavigator())); //Implement your own ShareModel and Navigator class.

  Future<dynamic> downloadAssetsAndData() async {
    //Write your logic here
    await Future.delayed(const Duration(seconds: 1));
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
        appWidget: this,
        sharedModel: sharedModel,
        child: MaterialApp(
          onGenerateRoute: sharedModel.navigator.onGenerateRoute,
          theme: sharedModel.theme,
          locale: sharedModel.locale,
          debugShowCheckedModeBanner: false,
          title: 'Test App',
          home: FutureBuilder<dynamic>(
            future: downloadAssetsAndData(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                goNext(ctx, TestNavigator.LOGIN);
              }
              return const SplashWidget();
            },
          ),
        ));
  }
}
