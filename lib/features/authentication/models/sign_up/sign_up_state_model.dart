import '../../../../cores/utils/status_enum.dart';

class SignUpStateModel {
  SignUpStateModel({
    this.username = '',
    this.email = '',
    this.fullname = '',
    this.dob = '',
    this.password = '',
    this.errorText = '',
    this.status = StatusEnum.unknown,
  });

  final String username;
  final String email;
  final String fullname;
  final String dob;
  final String password;
  final String errorText;
  final StatusEnum status;

  SignUpStateModel copyWith({
    String? username,
    String? email,
    String? fullname,
    String? dob,
    String? password,
    String? errorText,
    StatusEnum? status,
  }) {
    return SignUpStateModel(
      username: username ?? this.username,
      email: email ?? this.email,
      fullname: fullname ?? this.fullname,
      dob: dob ?? this.dob,
      password: password ?? this.password,
      errorText: errorText ?? this.errorText,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'fullname': fullname,
      'dob': dob,
      'password': password,
    };
  }
}
