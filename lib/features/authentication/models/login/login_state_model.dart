import '../../../../cores/utils/status_enum.dart';

class LoginStateModel {
  LoginStateModel({
    this.username = '',
    this.password = '',
    this.rememberMe = false,
    this.errorText = '',
    this.status = StatusEnum.unknown,
  });

  final String username;
  final String password;
  final bool rememberMe;
  final String errorText;
  final StatusEnum status;

  LoginStateModel copyWith({
    String? username,
    String? password,
    bool? rememberMe,
    String? errorText,
    StatusEnum? status,
  }) {
    return LoginStateModel(
      username: username ?? this.username,
      password: password ?? this.password,
      rememberMe: rememberMe ?? this.rememberMe,
      errorText: errorText ?? this.errorText,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
    };
  }
}
