import 'package:flutter/material.dart';
import 'package:provider_app/route/routes_name.dart';
import 'package:provider_app/screens/value_notifier.dart';

import '../screens/home_screen.dart';
import '../screens/slider_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.slider:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SliderScreen());
      case RoutesName.value:
        return MaterialPageRoute(
            builder: (BuildContext context) => ValueNotifierScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
