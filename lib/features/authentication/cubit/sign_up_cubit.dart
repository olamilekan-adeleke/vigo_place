import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vigo_place/features/authentication/services/sign_up_service.dart';

import '../../../cores/utils/logger.dart';
import '../../../cores/utils/status_enum.dart';
import '../models/sign_up/sign_up_state_model.dart';

class SignUpCubit extends Cubit<SignUpStateModel> {
  SignUpCubit() : super(SignUpStateModel());

  static final SignUpService _signUpService = SignUpService();

  void onUsernameChanged(String username) {
    emit(state.copyWith(username: username, status: StatusEnum.unknown));
  }

  void onEmailChanged(String email) {
    emit(state.copyWith(email: email, status: StatusEnum.unknown));
  }

  void onFullnameChanged(String fullname) {
    emit(state.copyWith(fullname: fullname, status: StatusEnum.unknown));
  }

  void onDobChanged(String dob) {
    emit(state.copyWith(dob: dob, status: StatusEnum.unknown));
  }

  void onPasswordChanged(String password) {
    emit(state.copyWith(password: password, status: StatusEnum.unknown));
  }

  void onIsAcceptedChanged(bool? isAccepted) {
    emit(state.copyWith(isAccepted: isAccepted, status: StatusEnum.unknown));
  }

  Future<void> onFormSubmitted() async {
    try {
      emit(state.copyWith(status: StatusEnum.busy));

      await _signUpService.registerUser(state.toMap());

      emit(state.copyWith(status: StatusEnum.success));
    } catch (e, s) {
      LoggerHelper.log(e, s);

      emit(state.copyWith(errorText: '$e', status: StatusEnum.unknown));
    }
  }
}
