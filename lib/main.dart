import 'package:flutter/material.dart';
import 'package:responsive_screen_utils/responsive_screenutil_init.dart';

import 'cores/constants/color.dart';
import 'cores/navigator/app_router.dart';
import 'cores/navigator/router_generator.dart';
import 'features/authentication/views/screens/auth_state_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveScreenUtilInit(
      designSize: const Size(375, 812),
      child: MaterialApp(
        title: 'VigoPlace',
        theme: ThemeData(primaryColor: kcPrimaryColor),
        initialRoute: AuthStateScreen.route,
        onGenerateRoute: RouteGenerator.generateRoute,
        navigatorKey: AppRouter.instance.navigatorKey,
      ),
    );
  }
}
