import 'dart:convert';

import 'package:flutter/material.dart';

// ignore_for_file: lines_longer_than_80_chars

@immutable
class AuthData {
  const AuthData({
    required this.username,
    required this.password,
    required this.isRegistrationForm,
    this.secondPassword,
  });

  factory AuthData.fromJson(String source) =>
      AuthData.fromMap(json.decode(source) as Map<String, dynamic>);

  factory AuthData.fromMap(Map<String, dynamic> map) {
    return AuthData(
      username: map['username'] as String,
      password: map['password'] as String,
      secondPassword: map['secondPassword'] != null
          ? map['secondPassword'] as String
          : null,
      isRegistrationForm: map['isRegistrationForm'] as bool,
    );
  }
  final String username;
  final String password;
  final String? secondPassword;
  final bool isRegistrationForm;

  AuthData copyWith({
    String? username,
    String? password,
    String? secondPassword,
    bool? isRegistrationForm,
  }) {
    return AuthData(
      username: username ?? this.username,
      password: password ?? this.password,
      secondPassword: secondPassword ?? this.secondPassword,
      isRegistrationForm: isRegistrationForm ?? this.isRegistrationForm,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'secondPassword': secondPassword,
      'isRegistrationForm': isRegistrationForm,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'AuthDataState(username: $username, password: $password, secondPassword: $secondPassword, isRegistrationForm: $isRegistrationForm)';
  }

  @override
  bool operator ==(covariant AuthData other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.password == password &&
        other.secondPassword == secondPassword &&
        other.isRegistrationForm == isRegistrationForm;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        password.hashCode ^
        secondPassword.hashCode ^
        isRegistrationForm.hashCode;
  }
}
