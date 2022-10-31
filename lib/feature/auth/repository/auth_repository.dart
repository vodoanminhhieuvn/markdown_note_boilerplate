import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/http/api_exception.dart';
import '../../../shared/http/api_provider.dart';
import '../../../shared/model/model.dart';
import '../../../shared/repository/token_repository.dart';
import '../../../shared/util/validator.dart';
import '../state/auth_state.dart';

abstract class AuthRepositoryProtocol {
  Future<AuthState> login(String email, String password);

  Future<AuthState> signUp(String name, String email, String password);
}

final authRepositoryProvider = Provider(AuthRepository.new);

class AuthRepository implements AuthRepositoryProtocol {
  AuthRepository(this._reader);

  late final ApiProvider _api = _reader.read(apiProvider);
  final Ref _reader;

  @override
  Future<AuthState> login(String email, String password) async {
    if (!Validator.isValidPassWord(password)) {
      return const AuthState.error(
        ApiException.errorWithMessage('Minimum 8 characters required'),
      );
    }
    if (!Validator.isValidEmail(email)) {
      return const AuthState.error(
        ApiException.errorWithMessage('Please enter a valid email address'),
      );
    }
    final params = {
      'email': email,
      'password': password,
    };
    final loginResponse = await _api.post('auth/signin', jsonEncode(params));

    return loginResponse.when(
      success: (success) async {
        final tokenRepository = _reader.read(tokenRepositoryProvider);

        final authResponse =
            AuthModel.fromJson(success as Map<String, dynamic>);

        await tokenRepository.saveToken(authResponse.token);
        await tokenRepository.saveUser(authResponse.user);

        return AuthState.loggedIn(authResponse.user);
      },
      error: (error) {
        return AuthState.error(error);
      },
    );
  }

  @override
  Future<AuthState> signUp(String name, String email, String password) async {
    if (!Validator.isValidPassWord(password)) {
      return const AuthState.error(
        ApiException.errorWithMessage('Minimum 8 characters required'),
      );
    }
    if (!Validator.isValidEmail(email)) {
      return const AuthState.error(
        ApiException.errorWithMessage('Please enter a valid email address'),
      );
    }
    final params = {
      'name': name,
      'email': email,
      'password': password,
    };
    final loginResponse = await _api.post('auth/signup', jsonEncode(params));

    return loginResponse.when(
      success: (success) async {
        final tokenRepository = _reader.read(tokenRepositoryProvider);
        final authResponse =
            AuthModel.fromJson(success as Map<String, dynamic>);

        await tokenRepository.saveToken(authResponse.token);
        await tokenRepository.saveUser(authResponse.user);

        return AuthState.loggedIn(authResponse.user);
      },
      error: (error) {
        return AuthState.error(error);
      },
    );
  }
}
