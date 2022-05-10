import 'package:flutter/material.dart';

import 'cores/constants/color.dart';
import 'cores/navigator/app_router.dart';
import 'cores/navigator/router_generator.dart';
import 'features/authentication/views/screens/auth_state_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VigoPlace',
      theme: ThemeData(primaryColor: kcPrimaryColor),
      initialRoute: AuthStateScreen.route,
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: AppRouter.instance.navigatorKey,
    );
  }
}
