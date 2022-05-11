// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import '../../../../cores/utils/status_enum.dart';

class LoginStateModel {
  LoginStateModel({
    this.username = '',
    this.password = '',
    this.errorText = '',
    this.status = StatusEnum.unknown,
  });

  final String username;
  final String password;
  final String errorText;
  final StatusEnum status;

  LoginStateModel copyWith({
    String? username,
    String? password,
    String? errorText,
    StatusEnum? status,
  }) {
    return LoginStateModel(
      username: username ?? this.username,
      password: password ?? this.password,
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
