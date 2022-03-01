import 'package:flutter/material.dart';
import 'package:framework/base_widget.dart';
import 'package:framework/provider.dart';

class NotFoundWidget extends BaseWidgetState {

  NotFoundWidget(Provider provider) : super(provider, isWhitelist: true);

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page not found.'),
      ),
      body: Container(
        margin: const EdgeInsets.only(
            top: 50.0
        ),
        alignment: Alignment.center,
        child: const Text('Page not found.'),
      ),
    );
  }
}
