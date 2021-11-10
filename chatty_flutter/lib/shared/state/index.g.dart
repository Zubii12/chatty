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

  final _$_contactsStateAtom = Atom(name: '_UserStore._contactsState');

  StateModel<List<User>> get contactsState {
    _$_contactsStateAtom.reportRead();
    return super._contactsState;
  }

  @override
  StateModel<List<User>> get _contactsState => contactsState;

  @override
  set _contactsState(StateModel<List<User>> value) {
    _$_contactsStateAtom.reportWrite(value, super._contactsState, () {
      super._contactsState = value;
    });
  }

  final _$_contactsSearchKeywordAtom =
      Atom(name: '_UserStore._contactsSearchKeyword');

  String get contactsSearchKeyword {
    _$_contactsSearchKeywordAtom.reportRead();
    return super._contactsSearchKeyword;
  }

  @override
  String get _contactsSearchKeyword => contactsSearchKeyword;

  @override
  set _contactsSearchKeyword(String value) {
    _$_contactsSearchKeywordAtom
        .reportWrite(value, super._contactsSearchKeyword, () {
      super._contactsSearchKeyword = value;
    });
  }

  final _$_searchContactsStateAtom =
      Atom(name: '_UserStore._searchContactsState');

  StateModel<List<User>> get searchContactsState {
    _$_searchContactsStateAtom.reportRead();
    return super._searchContactsState;
  }

  @override
  StateModel<List<User>> get _searchContactsState => searchContactsState;

  @override
  set _searchContactsState(StateModel<List<User>> value) {
    _$_searchContactsStateAtom.reportWrite(value, super._searchContactsState,
        () {
      super._searchContactsState = value;
    });
  }

  final _$_addNewContactsSearchKeywordAtom =
      Atom(name: '_UserStore._addNewContactsSearchKeyword');

  String get addNewContactsSearchKeyword {
    _$_addNewContactsSearchKeywordAtom.reportRead();
    return super._addNewContactsSearchKeyword;
  }

  @override
  String get _addNewContactsSearchKeyword => addNewContactsSearchKeyword;

  @override
  set _addNewContactsSearchKeyword(String value) {
    _$_addNewContactsSearchKeywordAtom
        .reportWrite(value, super._addNewContactsSearchKeyword, () {
      super._addNewContactsSearchKeyword = value;
    });
  }

  final _$_addNewContactStateAtom =
      Atom(name: '_UserStore._addNewContactState');

  StateModel<void> get addNewContactState {
    _$_addNewContactStateAtom.reportRead();
    return super._addNewContactState;
  }

  @override
  StateModel<void> get _addNewContactState => addNewContactState;

  @override
  set _addNewContactState(StateModel<void> value) {
    _$_addNewContactStateAtom.reportWrite(value, super._addNewContactState, () {
      super._addNewContactState = value;
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

  final _$_fetchContactsAsyncAction = AsyncAction('_UserStore._fetchContacts');

  @override
  Future<void> _fetchContacts() {
    return _$_fetchContactsAsyncAction.run(() => super._fetchContacts());
  }

  final _$searchContactsAsyncAction = AsyncAction('_UserStore.searchContacts');

  @override
  Future<void> searchContacts() {
    return _$searchContactsAsyncAction.run(() => super.searchContacts());
  }

  final _$addNewContactAsyncAction = AsyncAction('_UserStore.addNewContact');

  @override
  Future<void> addNewContact({required int contactId}) {
    return _$addNewContactAsyncAction
        .run(() => super.addNewContact(contactId: contactId));
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  void setContactsSearchKeyword(String newKeyword) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setContactsSearchKeyword');
    try {
      return super.setContactsSearchKeyword(newKeyword);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAddNewContactsSearchKeyword(String newKeyword) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setAddNewContactsSearchKeyword');
    try {
      return super.setAddNewContactsSearchKeyword(newKeyword);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
