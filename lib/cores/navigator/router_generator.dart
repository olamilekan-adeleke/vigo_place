import 'package:flutter/material.dart';

import '../../features/authentication/views/screens/auth_state_screen.dart';
import '../../features/authentication/views/screens/login/login_screen.dart';
import '../../features/authentication/views/screens/sign_up/sign_up_screen.dart';
import '../../features/home/views/screens/home_screen.dart';
import 'error_route_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;

    switch (settings.name) {
      case AuthStateScreen.route:
        return MaterialPageRoute(builder: (_) => const AuthStateScreen());

      case LoginScreen.route:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case SignUpScreen.route:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case HomeScreen.route:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        // If there is no such named route in the switch statement, e.g. /third
        return errorRoute();
    }
  }
}
