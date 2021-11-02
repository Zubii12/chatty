// GENERATED CODE - DO NOT MODIFY BY HAND

part of state;

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  Computed<AuthState>? _$authStateComputed;

  @override
  AuthState get authState =>
      (_$authStateComputed ??= Computed<AuthState>(() => super.authState,
              name: '_AuthStore.authState'))
          .value;

  final _$_authDataAtom = Atom(name: '_AuthStore._authData');

  AuthData? get authData {
    _$_authDataAtom.reportRead();
    return super._authData;
  }

  @override
  AuthData? get _authData => authData;

  @override
  set _authData(AuthData? value) {
    _$_authDataAtom.reportWrite(value, super._authData, () {
      super._authData = value;
    });
  }

  final _$_authCheckedAtom = Atom(name: '_AuthStore._authChecked');

  bool get authChecked {
    _$_authCheckedAtom.reportRead();
    return super._authChecked;
  }

  @override
  bool get _authChecked => authChecked;

  @override
  set _authChecked(bool value) {
    _$_authCheckedAtom.reportWrite(value, super._authChecked, () {
      super._authChecked = value;
    });
  }

  final _$_isConnectedAtom = Atom(name: '_AuthStore._isConnected');

  bool get isConnected {
    _$_isConnectedAtom.reportRead();
    return super._isConnected;
  }

  @override
  bool get _isConnected => isConnected;

  @override
  set _isConnected(bool value) {
    _$_isConnectedAtom.reportWrite(value, super._isConnected, () {
      super._isConnected = value;
    });
  }

  final _$_authenticateWithStoredTokenAsyncAction =
      AsyncAction('_AuthStore._authenticateWithStoredToken');

  @override
  Future<void> _authenticateWithStoredToken() {
    return _$_authenticateWithStoredTokenAsyncAction
        .run(() => super._authenticateWithStoredToken());
  }

  @override
  String toString() {
    return '''
authState: ${authState}
    ''';
  }
}
