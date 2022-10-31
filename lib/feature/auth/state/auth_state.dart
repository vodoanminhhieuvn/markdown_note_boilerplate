import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared/http/api_exception.dart';
import '../../../shared/model/user_model/user_model.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;

  const factory AuthState.loading() = _Loading;

  const factory AuthState.loggedIn(UserModel userInfo) = _LoggedIn;

  const factory AuthState.error(ApiException error) = _Error;
}
