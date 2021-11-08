import 'package:chatty/models/index.dart';
import 'package:chatty/screens/complete_profile_page/complete_profile_page.dart';
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
  RouterStore({required AuthStore authStore, required UserStore userStore})
      : super(authStore: authStore, userStore: userStore);
}

abstract class _RouterStore with Store {
  _RouterStore({required AuthStore authStore, required UserStore userStore})
      : _authStore = authStore,
        _userStore = userStore {
    reaction<AuthState>((_) => _authStore.authState, (AuthState authState) {
      if (authState == AuthState.authenticated) {
        // Check if any route needs to be restored after login
        if (_restoreRoute != null) {
          setNewRoutePath(_restoreRoute!);
          _restoreRoute = null;
        } else {
          if (!_routerState.isAuthorized) {
            _routerState = const RouterState.home(currentTab: HomePageTab.chats);
          }
        }
      }

      if (authState == AuthState.unauthenticated) {
        _routerState = const RouterState.register();
      }
    });
  }

  final AuthStore _authStore;
  final UserStore _userStore;

  RouterState? _restoreRoute;
  HomePageTab? _lastTab;

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
            _NoAnimationPage(
              child: HomePage(currentTab: (_routerState as Home).currentTab),
              key: ValueKey<String>('home-page${(_routerState as Home).currentTab}'),
            ),
          if (!_userStore.isProfileCompleted)
            const _NoAnimationPage(
              child: CompleteProfilePage(),
              key: ValueKey<String>('complete-profile-page'),
            ),
        ],

        // Exceptional stack
        if (_routerState is Unknown)
          const _NoAnimationPage(child: UnknownPage(), key: ValueKey<String>('unknown-page')),
        if (_authStore.authState == AuthState.unknown ||
            (_authStore.authState == AuthState.authenticated &&
                _userStore.userDataState is Loading))
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
      if (newState is Home) {
        _lastTab = newState.currentTab;
      } else if (_routerState is Home) {
        _lastTab = (_routerState as Home).currentTab;
      }
      _routerState = newState;
    }
  }

  @action
  bool handleOnPop(Route<dynamic> route, dynamic result) {
    final bool success = route.didPop(result);

    if (success) {
      if (_authStore.authState == AuthState.authenticated) {
        _routerState = RouterState.home(currentTab: _lastTab ?? HomePageTab.chats);
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

  void changeHomePageTab({required HomePageTab tab}) {
    _routerState = RouterState.home(currentTab: tab);
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
