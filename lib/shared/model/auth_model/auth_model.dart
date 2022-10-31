import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../user_model/user_model.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

AuthModel authModelFromJson(String str) =>
    AuthModel.fromJson(json.decode(str) as Map<String, dynamic>);

String authModelToString(AuthModel data) => json.encode(data.toJson());

@freezed
class AuthModel with _$AuthModel {
  const factory AuthModel({
    required UserModel user,
    required String token,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}
