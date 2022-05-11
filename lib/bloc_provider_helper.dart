import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cores/utils/status_enum.dart';
import 'features/authentication/cubit/auth_state_cubit.dart';
import 'features/authentication/cubit/login_cubit.dart';

class BlocProviderHelper {
  static List<BlocProvider> call(BuildContext context) {
    return <BlocProvider>[
      BlocProvider<AuthenticatedStateCubit>(
        create: (BuildContext context) => AuthenticatedStateCubit(
          authStatus: AuthenticatedStatus.unauthenticated,
        ),
      ),
      BlocProvider<LoginCubit>(create: (BuildContext context) => LoginCubit()),
      // BlocProvider<SignUpCubit>(
      //   create: (BuildContext context) => SignUpCubit(),
      // ),
    ];
  }
}
