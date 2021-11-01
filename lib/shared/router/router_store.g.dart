// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RouterStore on _RouterStore, Store {
  Computed<List<Page<dynamic>>>? _$pagesComputed;

  @override
  List<Page<dynamic>> get pages =>
      (_$pagesComputed ??= Computed<List<Page<dynamic>>>(() => super.pages,
              name: '_RouterStore.pages'))
          .value;

  final _$_routerStateAtom = Atom(name: '_RouterStore._routerState');

  RouterState get routerState {
    _$_routerStateAtom.reportRead();
    return super._routerState;
  }

  @override
  set _routerState(RouterState value) {
    _$_routerStateAtom.reportWrite(value, super._routerState, () {
      super._routerState = value;
    });
  }

  final _$_RouterStoreActionController = ActionController(name: '_RouterStore');

  @override
  void setNewRoutePath(RouterState newState) {
    final _$actionInfo = _$_RouterStoreActionController.startAction(
        name: '_RouterStore.setNewRoutePath');
    try {
      return super.setNewRoutePath(newState);
    } finally {
      _$_RouterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool handleOnPop(Route<dynamic> route, dynamic result) {
    final _$actionInfo = _$_RouterStoreActionController.startAction(
        name: '_RouterStore.handleOnPop');
    try {
      return super.handleOnPop(route, result);
    } finally {
      _$_RouterStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pages: ${pages}
    ''';
  }
}
