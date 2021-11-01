import 'package:chatty/models/index.dart';
import 'package:chatty/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'router_store.g.dart';

class RouterStore extends _RouterStore with _$RouterStore {
  RouterStore() : super();
}

abstract class _RouterStore with Store {
  _RouterStore();

  @computed
  List<Page<dynamic>> get pages {
    return <Page<dynamic>>[
      const _NoAnimationPage(
        child: HomePage(),
        key: ValueKey<String>('home-page'),
      ),
    ];
  }

  @readonly
  RouterState _routerState = const RouterState.unknown();

  @action
  void setNewRoutePath(RouterState newState) => _routerState = newState;

  @action
  bool handleOnPop(Route<dynamic> route, dynamic result) {
    final bool success = route.didPop(result);

    if (success) {
      _routerState = const RouterState.home();
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
