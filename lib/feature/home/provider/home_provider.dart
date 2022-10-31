import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/repository/token_repository.dart';
import '../state/home_state.dart';

final homeProvider = StateNotifierProvider<HomeProvider, HomeState>((ref) {
  return HomeProvider(ref);
});

class HomeProvider extends StateNotifier<HomeState> {
  HomeProvider(this._reader) : super(const HomeState.loading());
  final Ref _reader;
  late final TokenRepository _tokenRepository =
      _reader.read(tokenRepositoryProvider);

  Future<void> logout() async {
    await _tokenRepository.remove();
    state = const HomeState.loggedOut();
  }
}
