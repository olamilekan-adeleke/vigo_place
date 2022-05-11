import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cores/utils/status_enum.dart';

class AuthenticatedStateCubit extends Cubit<AuthenticatedStatus> {
  AuthenticatedStateCubit({
    required this.authStatus,
  }) : super(AuthenticatedStatus.unauthenticated);

  AuthenticatedStatus authStatus;

  void updateState(AuthenticatedStatus authStatus) {
    this.authStatus = authStatus;
    emit(authStatus);
  }
}
