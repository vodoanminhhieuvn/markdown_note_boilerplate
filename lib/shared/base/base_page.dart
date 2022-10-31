import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../l10n/l10n.dart';
import '../theme/app_color.dart';
import '../theme/app_theme.dart';
import '../theme/app_typography.dart';

export '../route/router.gr.dart';

abstract class BasePage<T extends ConsumerStatefulWidget>
    extends ConsumerState<T> {
  AppLocalizations get translate => context.l10n;

  StackRouter get router => context.router;

  AppColor get colorTheme => AppTheme().appColor;

  AppTypography get typoTheme => AppTheme().appTypo;
}

class EditorPopValue {
  const EditorPopValue({this.noteName, this.markdownNote});

  final String? noteName;
  final String? markdownNote;
}
