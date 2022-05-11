import 'package:vigo_place/features/authentication/repository/login_repository.dart';

import '../../../cores/utils/session_manager.dart';
import '../models/login/login_user_data_model.dart';

class LoginService {
  static final SessionManager _sessionManager = SessionManager.instance;
  static final LoginRepository _loginRepository = LoginRepository();

  Future<LoginUserDataModel> loginUser(Map<String, dynamic> data) async {
    final Map<String, dynamic> result = await _loginRepository.loginUser(data);

    _sessionManager.setLoginData(result);

    return LoginUserDataModel.fromMap(result);
  }
}
