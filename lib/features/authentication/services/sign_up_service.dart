import '../repository/sign_up_repository.dart';

class SignUpService {
  static final SignUpRepository _signUpRepository = SignUpRepository();

  Future<void> registerUser(Map<String, dynamic> data) async {
    await _signUpRepository.registerUser(data);
  }
}
