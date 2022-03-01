import 'package:flutter/material.dart';

class SplashWidget extends StatelessWidget {

  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Padding(padding: EdgeInsets.only(top: 20.0)),
              Text(
                'Please wait...',
                style: TextStyle(fontSize: 20.0),
              ),
              Padding(padding: EdgeInsets.only(top: 20.0)),
              CircularProgressIndicator(
                backgroundColor: Colors.white,
                strokeWidth: 1,
              )
            ],
          ),
        ),
      );
}
