import 'package:flutter/material.dart';

import 'intro_screen.dart';

class AuthStateScreen extends StatelessWidget {
  const AuthStateScreen({Key? key}) : super(key: key);

  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<AuthenticatedStateCubit, AuthenticatedStatus>(
    //   builder: (context, state) {
    //     switch (state) {
    //       case AuthenticatedStatus.authenticated:
    //         return const HomeTabWidget();
    //       case AuthenticatedStatus.unauthenticated:
    //         return const IntroScreen();

    //       default:
    //         return const IntroScreen();
    //     }
    //   },
    // );

     return const IntroScreen();
  }
}
