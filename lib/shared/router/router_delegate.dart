import 'package:chatty/models/index.dart';
import 'package:chatty/shared/router/router_store.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class ChattyRouterDelegate extends RouterDelegate<RouterState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RouterState> {
  ChattyRouterDelegate({
    required RouterStore routerStore,
  })  : navigatorKey = GlobalKey<NavigatorState>(),
        _routerStore = routerStore {
    reactionDisposer = reaction(
      (_) => _routerStore.pages.last.key,
      (_) => notifyListeners(),
    );
  }

  @override
  final GlobalKey<NavigatorState> navigatorKey;
  final RouterStore _routerStore;

  ReactionDisposer? reactionDisposer;

  @override
  RouterState get currentConfiguration => _routerStore.routerState;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: _routerStore.pages,
      onPopPage: _routerStore.handleOnPop,
    );
  }

  @override
  Future<void> setNewRoutePath(RouterState configuration) {
    _routerStore.setNewRoutePath(configuration);
    return SynchronousFuture(null);
  }

  @override
  void dispose() {
    reactionDisposer?.call();
    super.dispose();
  }
}
