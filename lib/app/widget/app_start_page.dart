import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../feature/auth/view/sign_in_page.dart';
import '../../feature/home/views/home_page.dart';
import '../../shared/widget/connection_unvailable_widget.dart';
import '../../shared/widget/loading_widget.dart';
import '../provider/app_start_provider.dart';

class AppStartPage extends ConsumerWidget {
  const AppStartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStartProvider);

    return state.maybeWhen(
      initial: () => const LoadingWidget(),
      authenticated: (userInfo) => HomePage(
        userInfo: userInfo,
      ),
      unauthenticated: SignInPage.new,
      internetUnAvailable: () => const ConnectionUnavailableWidget(),
      orElse: () => const LoadingWidget(),
    );
  }
}
