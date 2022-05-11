import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vigo_place/cores/utils/status_enum.dart';

import '../../../cores/utils/logger.dart';
import '../models/login/login_state_model.dart';
import '../services/login_service.dart';

class LoginCubit extends Cubit<LoginStateModel> {
  LoginCubit() : super(LoginStateModel());

  static final LoginService _loginService = LoginService();

  void onUsernameChanged(String username) {
    emit(state.copyWith(username: username, status: StatusEnum.unknown));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: password, status: StatusEnum.unknown));
  }

  void onRememberMeChanged(bool? rememberMe) {
    emit(state.copyWith(rememberMe: rememberMe, status: StatusEnum.unknown));
  }

  Future<void> onFormSubmitted() async {
    try {
      emit(state.copyWith(status: StatusEnum.busy));

      await _loginService.loginUser(state.toMap());

      emit(state.copyWith(status: StatusEnum.success));
    } catch (e, s) {
      LoggerHelper.log(e, s);

      emit(state.copyWith(errorText: '$e', status: StatusEnum.error));
    }
  }
}
