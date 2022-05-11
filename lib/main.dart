import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_screen_utils/responsive_screenutil_init.dart';

import 'bloc_provider_helper.dart';
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
    return MultiBlocProvider(
      providers: BlocProviderHelper.call(context),
      child: ResponsiveScreenUtilInit(
        designSize: const Size(428, 926),
        child: MaterialApp(
          title: 'VigoPlace',
          theme: ThemeData(
            primaryColor: kcPrimaryColor,
            scaffoldBackgroundColor: kcWhite,
          ),
          initialRoute: AuthStateScreen.route,
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorKey: AppRouter.instance.navigatorKey,
        ),
      ),
    );
  }
}
