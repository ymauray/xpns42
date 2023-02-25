// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_state.g.dart';

@immutable
class FormState {
  const FormState({
    this.isRegistrationForm = false,
    this.loading = false,
  });
  final bool isRegistrationForm;
  final bool loading;

  FormState copyWith({
    bool? isRegistrationForm,
    bool? loading,
  }) {
    return FormState(
      isRegistrationForm: isRegistrationForm ?? this.isRegistrationForm,
      loading: loading ?? this.loading,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isRegistrationForm': isRegistrationForm,
      'loading': loading,
    };
  }

  factory FormState.fromMap(Map<String, dynamic> map) {
    return FormState(
      isRegistrationForm: map['isRegistrationForm'] as bool,
      loading: map['loading'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory FormState.fromJson(String source) =>
      FormState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'FormState(isRegistrationForm: $isRegistrationForm, loading: $loading)';

  @override
  bool operator ==(covariant FormState other) {
    if (identical(this, other)) return true;

    return other.isRegistrationForm == isRegistrationForm &&
        other.loading == loading;
  }

  @override
  int get hashCode => isRegistrationForm.hashCode ^ loading.hashCode;
}

@riverpod
class FormStateController extends _$FormStateController {
  @override
  FormState build() => const FormState();

  void toggle() {
    state = state.copyWith(isRegistrationForm: !state.isRegistrationForm);
  }

  void toggleLoading() {
    state = state.copyWith(loading: !state.loading);
  }
}
