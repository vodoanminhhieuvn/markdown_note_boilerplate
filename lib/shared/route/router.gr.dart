// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/foundation.dart' as _i6;
import 'package:flutter/material.dart' as _i5;
import 'package:markdown_note_mobile/app/widget/app_start_page.dart' as _i1;
import 'package:markdown_note_mobile/feature/auth/view/sign_in_page.dart'
    as _i2;
import 'package:markdown_note_mobile/feature/home/views/home_page.dart' as _i3;
import 'package:markdown_note_mobile/shared/model/user_model/user_model.dart'
    as _i7;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    AppStartRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.AppStartPage(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.SignInPage(),
      );
    },
    HomeRoute.name: (routeData) {
      final args = routeData.argsAs<HomeRouteArgs>();
      return _i4.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i3.HomePage(
          key: args.key,
          userInfo: args.userInfo,
        ),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          AppStartRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          SignInRoute.name,
          path: '/signIn',
        ),
        _i4.RouteConfig(
          HomeRoute.name,
          path: '/home',
        ),
      ];
}

/// generated route for
/// [_i1.AppStartPage]
class AppStartRoute extends _i4.PageRouteInfo<void> {
  const AppStartRoute()
      : super(
          AppStartRoute.name,
          path: '/',
        );

  static const String name = 'AppStartRoute';
}

/// generated route for
/// [_i2.SignInPage]
class SignInRoute extends _i4.PageRouteInfo<void> {
  const SignInRoute()
      : super(
          SignInRoute.name,
          path: '/signIn',
        );

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i4.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({
    _i6.Key? key,
    required _i7.UserModel userInfo,
  }) : super(
          HomeRoute.name,
          path: '/home',
          args: HomeRouteArgs(
            key: key,
            userInfo: userInfo,
          ),
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({
    this.key,
    required this.userInfo,
  });

  final _i6.Key? key;

  final _i7.UserModel userInfo;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key, userInfo: $userInfo}';
  }
}
