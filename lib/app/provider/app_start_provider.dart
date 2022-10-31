import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../feature/auth/provider/auth_provider.dart';
import '../../feature/auth/state/auth_state.dart';
import '../../feature/home/provider/home_provider.dart';
import '../../feature/home/state/home_state.dart';
import '../../shared/repository/token_repository.dart';
import '../state/app_start_state.dart';

final appStartProvider =
    StateNotifierProvider<AppStartNotifier, AppStartState>((ref) {
  final loginState = ref.watch(authProvider);
  final homeState = ref.watch(homeProvider);

  late AppStartState appStartState;
  appStartState = const AppStartState.initial();

  return AppStartNotifier(appStartState, ref, loginState, homeState);
});

class AppStartNotifier extends StateNotifier<AppStartState> {
  AppStartNotifier(
    super.appStartState,
    this._reader,
    this._authState,
    this._homeState,
  ) {
    _init();
  }

  late final TokenRepository _tokenRepository =
      _reader.read(tokenRepositoryProvider);
  final AuthState _authState;
  final HomeState _homeState;
  final Ref _reader;

  Future<void> _init() async {
    _authState.maybeWhen(
      loggedIn: (userInfo) {
        state = AppStartState.authenticated(userInfo);
      },
      orElse: () {},
    );

    _homeState.maybeWhen(
      loggedOut: () {
        state = const AppStartState.unauthenticated();
      },
      orElse: () {},
    );

    final token = await _tokenRepository.fetchToken();
    final userInfo = await _tokenRepository.fetchUser();

    if (token != null && userInfo != null) {
      if (mounted) {
        state = AppStartState.authenticated(userInfo);
      }
    } else {
      if (mounted) {
        state = const AppStartState.unauthenticated();
      }
    }
  }
}
