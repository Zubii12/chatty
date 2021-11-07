import 'package:chatty/models/index.dart';
import 'package:chatty/screens/home_page/home_page.dart';
import 'package:chatty/screens/register_page/register_page.dart';
import 'package:chatty/screens/static_pages/splash_page.dart';
import 'package:chatty/screens/static_pages/unknown_page.dart';
import 'package:chatty/screens/verify_otp_page/verify_otp_page.dart';
import 'package:chatty/shared/state/index.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'router_store.g.dart';

class RouterStore extends _RouterStore with _$RouterStore {
  RouterStore({required AuthStore authStore}) : super(authStore: authStore);
}

abstract class _RouterStore with Store {
  _RouterStore({required AuthStore authStore}) : _authStore = authStore {
    reaction<AuthState>((_) => _authStore.authState, (AuthState authState) {
      if (authState == AuthState.authenticated) {
        // Check if any route needs to be restored after login
        if (_restoreRoute != null) {
          setNewRoutePath(_restoreRoute!);
          _restoreRoute = null;
        } else {
          _routerState = const RouterState.home();
        }
      }

      if (authState == AuthState.unauthenticated) {
        _routerState = const RouterState.register();
      }
    });
  }

  final AuthStore _authStore;

  RouterState? _restoreRoute;

  @computed
  List<Page<dynamic>> get pages => <Page<dynamic>>[
        // Unauthorized stack
        if (_authStore.authState == AuthState.unauthenticated) ...<Page<dynamic>>[
          if (_routerState is Register)
            const _NoAnimationPage(child: RegisterPage(), key: ValueKey<String>('register-page')),
          if (_routerState is VerifyOTP)
            _NoAnimationPage(
              child: VerifyOTPPage(phone: (_routerState as VerifyOTP).phone),
              key: const ValueKey<String>('verify-otp-page'),
            )
        ],

        // Authorized stack
        if (_authStore.authState == AuthState.authenticated) ...<Page<dynamic>>[
          if (_routerState is Home)
            const _NoAnimationPage(child: HomePage(), key: ValueKey<String>('home-page')),
        ],

        // Exceptional stack
        if (_routerState is Unknown)
          const _NoAnimationPage(child: UnknownPage(), key: ValueKey<String>('unknown-page')),
        if (_authStore.authState == AuthState.unknown)
          const _NoAnimationPage(child: SplashPage(), key: ValueKey<String>('splash-page'))
      ];

  @readonly
  RouterState _routerState = const RouterState.unknown();

  @action
  void setNewRoutePath(RouterState newState) {
    if (_authStore.authState == AuthState.unauthenticated && newState.isAuthorized) {
      _restoreRoute = newState;

      _routerState = const RouterState.register();
    } else {
      _routerState = newState;
    }
  }

  @action
  bool handleOnPop(Route<dynamic> route, dynamic result) {
    final bool success = route.didPop(result);

    if (success) {
      if (_authStore.authState == AuthState.authenticated) {
        _routerState = const RouterState.home();
      }
      if (_authStore.authState == AuthState.unauthenticated) {
        _routerState = const RouterState.register();
      }
      if (_authStore.authState == AuthState.unknown) {
        _routerState = const RouterState.unknown();
      }
    }
    return success;
  }
}

class _NoAnimationPage extends Page<dynamic> {
  const _NoAnimationPage({
    LocalKey? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Route<dynamic> createRoute(BuildContext context) {
    return PageRouteBuilder<dynamic>(
      settings: this,
      pageBuilder: (_, __, ___) => child,
    );
  }
}
