import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cores/utils/status_enum.dart';
import '../../../home/views/screens/home_screen.dart';
import '../../cubit/auth_state_cubit.dart';
import 'intro_screen.dart';

class AuthStateScreen extends StatelessWidget {
  const AuthStateScreen({Key? key}) : super(key: key);

  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticatedStateCubit, AuthenticatedStatus>(
      builder: (context, state) {
        switch (state) {
          case AuthenticatedStatus.authenticated:
            return const HomeScreen();
          case AuthenticatedStatus.unauthenticated:
            return const IntroScreen();

          default:
            return const IntroScreen();
        }
      },
    );
  }
}
