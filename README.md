# Best Flutter Framework

- This is a radical new approach to creating user interfaces in the world of Flutter. While the traditional framework
  is no longer needed in order to learn the difference between the StatelessWidget and StatefulWidget classes.
  It is assured that the code will be reduced by the number of lines, and further on it will be possible to initialize
  form elements even in the constructor instead of overriding the initState function.
  If you are new to Flutter, you don't need to spend time learning how to implement Route, State and InheritedWidget in Flutter.
  If you have OOP skills, then it will be easier for you to implement class inheritance.
  We support web, mobile and desktop environments and provide support as needed.

## Simple example

See also [sample project](example) which contains a working demo.


## Begin

Write an implementation for the base_app.dart, base_navigator.dart, shared_model.dart classes.

- The main app should extend the BaseAppState class and override the build function with inclusion of these lines:

``` dart
  @override
  Widget build(BuildContext context) {
    return Provider(
        appWidget: this,
        sharedModel: sharedModel,
        child: MaterialApp(
            onGenerateRoute: sharedModel.navigator.onGenerateRoute,
            ...
```

- In BaseNavigator override the createWidget function. Pass a Provider to the Widget(s) constructor.

``` dart
  @override
  BaseWidgetState createWidget(RouteSettings, provider provider) {
    switch (settings.name) {
      case 'login':
        return LoginWidget(provider);
      case 'house':
        return HomeWidget(provider);
      ...
```

- The SharedModel used to store the state of components and variables, and to receive
  access to this model from anywhere via Provider. Example: Provider.of(context).sharedModel.locale

- The easiest way to initialize the app is by calling the createApp() in the main function

``` dart
  void main() async {
    runApp(MyAppState().createApp());
  }
```

## See Also

- https://pub.dev/packages/framework
- https://pub.dev/packages/l10n_flutter
- https://pub.dev/packages/form_components
- https://pub.dev/packages/expansion_datagrid