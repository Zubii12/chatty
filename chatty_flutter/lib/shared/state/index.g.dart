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

  final _$_sendOTPStateAtom = Atom(name: '_AuthStore._sendOTPState');

  StateModel<String> get sendOTPState {
    _$_sendOTPStateAtom.reportRead();
    return super._sendOTPState;
  }

  @override
  StateModel<String> get _sendOTPState => sendOTPState;

  @override
  set _sendOTPState(StateModel<String> value) {
    _$_sendOTPStateAtom.reportWrite(value, super._sendOTPState, () {
      super._sendOTPState = value;
    });
  }

  final _$_verifyOTPStateAtom = Atom(name: '_AuthStore._verifyOTPState');

  StateModel<void> get verifyOTPState {
    _$_verifyOTPStateAtom.reportRead();
    return super._verifyOTPState;
  }

  @override
  StateModel<void> get _verifyOTPState => verifyOTPState;

  @override
  set _verifyOTPState(StateModel<void> value) {
    _$_verifyOTPStateAtom.reportWrite(value, super._verifyOTPState, () {
      super._verifyOTPState = value;
    });
  }

  final _$_loginWithStoredPhoneAsyncAction =
      AsyncAction('_AuthStore._loginWithStoredPhone');

  @override
  Future<void> _loginWithStoredPhone() {
    return _$_loginWithStoredPhoneAsyncAction
        .run(() => super._loginWithStoredPhone());
  }

  final _$sendOTPAsyncAction = AsyncAction('_AuthStore.sendOTP');

  @override
  Future<void> sendOTP({required String phone}) {
    return _$sendOTPAsyncAction.run(() => super.sendOTP(phone: phone));
  }

  final _$verifyOTPAsyncAction = AsyncAction('_AuthStore.verifyOTP');

  @override
  Future<void> verifyOTP(
      {required String phone,
      required String code,
      required String requestId}) {
    return _$verifyOTPAsyncAction.run(
        () => super.verifyOTP(phone: phone, code: code, requestId: requestId));
  }

  @override
  String toString() {
    return '''
authState: ${authState}
    ''';
  }
}

mixin _$UserStore on _UserStore, Store {
  final _$_isProfileCompletedAtom =
      Atom(name: '_UserStore._isProfileCompleted');

  bool get isProfileCompleted {
    _$_isProfileCompletedAtom.reportRead();
    return super._isProfileCompleted;
  }

  @override
  bool get _isProfileCompleted => isProfileCompleted;

  @override
  set _isProfileCompleted(bool value) {
    _$_isProfileCompletedAtom.reportWrite(value, super._isProfileCompleted, () {
      super._isProfileCompleted = value;
    });
  }

  final _$_userDataStateAtom = Atom(name: '_UserStore._userDataState');

  StateModel<User> get userDataState {
    _$_userDataStateAtom.reportRead();
    return super._userDataState;
  }

  @override
  StateModel<User> get _userDataState => userDataState;

  @override
  set _userDataState(StateModel<User> value) {
    _$_userDataStateAtom.reportWrite(value, super._userDataState, () {
      super._userDataState = value;
    });
  }

  final _$_updateUserDataStateAtom =
      Atom(name: '_UserStore._updateUserDataState');

  StateModel<void> get updateUserDataState {
    _$_updateUserDataStateAtom.reportRead();
    return super._updateUserDataState;
  }

  @override
  StateModel<void> get _updateUserDataState => updateUserDataState;

  @override
  set _updateUserDataState(StateModel<void> value) {
    _$_updateUserDataStateAtom.reportWrite(value, super._updateUserDataState,
        () {
      super._updateUserDataState = value;
    });
  }

  final _$_fetchUserDataAsyncAction = AsyncAction('_UserStore._fetchUserData');

  @override
  Future<void> _fetchUserData() {
    return _$_fetchUserDataAsyncAction.run(() => super._fetchUserData());
  }

  final _$updateUserDataAsyncAction = AsyncAction('_UserStore.updateUserData');

  @override
  Future<void> updateUserData({required String name, required String? photo}) {
    return _$updateUserDataAsyncAction
        .run(() => super.updateUserData(name: name, photo: photo));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
