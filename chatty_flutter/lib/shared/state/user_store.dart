part of state;

class UserStore extends _UserStore with _$UserStore {
  UserStore({required ContentService contentService, required AuthStore authStore})
      : super(contentService: contentService, authStore: authStore);
}

abstract class _UserStore with Store {
  _UserStore({required ContentService contentService, required AuthStore authStore})
      : _contentService = contentService,
        _authStore = authStore {
    reaction<AuthState>((_) => _authStore.authState, (AuthState authState) {
      if (authState == AuthState.authenticated) {
        _fetchUserData();
      }
    });
  }

  final ContentService _contentService;
  final AuthStore _authStore;

  late int id;

  @readonly
  bool _isProfileCompleted = false;

  @readonly
  StateModel<User> _userDataState = const StateModel<User>.loading();

  @action
  Future<void> _fetchUserData() async {
    try {
      _userDataState = const StateModel<User>.loading();

      final User user = await _contentService //
          .getUserData(phone: _authStore.authData!.phone)
          .timeout(const Duration(seconds: 10));

      _userDataState = StateModel<User>.fulfilled(data: user);
      _isProfileCompleted = true;
      id = user.id;

      _fetchContacts();
    } on IncompleteProfileException {
      _userDataState = const StateModel<User>.error(message: 'Incomplete profile');
      _isProfileCompleted = false;
    } catch (e, t) {
      _userDataState = const StateModel<User>.error(message: 'Failed to fetch the user data');
      log('Fetch user data error', error: e, stackTrace: t);
    }
  }

  @readonly
  StateModel<void> _updateUserDataState = const StateModel<void>.fulfilled(data: null);

  @action
  Future<void> updateUserData({required String name, required String? photo}) async {
    try {
      _updateUserDataState = const StateModel<void>.loading();

      await _contentService
          .updateUserData(phone: _authStore.authData!.phone, name: name, photo: photo)
          .timeout(const Duration(seconds: 10));

      _fetchUserData();

      _updateUserDataState = const StateModel<void>.fulfilled(data: null);
      _isProfileCompleted = true;
    } catch (e, t) {
      _updateUserDataState = const StateModel<void>.error(
        message: 'Failed to update the user data',
      );
      log('Fetch to update user data error', error: e, stackTrace: t);
    }
  }

  @readonly
  StateModel<List<User>> _contactsState = const StateModel<List<User>>.loading();

  @readonly
  String _contactsSearchKeyword = '';

  @action
  void setContactsSearchKeyword(String newKeyword) {
    if (newKeyword == _contactsSearchKeyword) {
      return;
    }
    _contactsSearchKeyword = newKeyword;
    _fetchContacts();
  }

  @action
  Future<void> _fetchContacts() async {
    try {
      _contactsState = const StateModel<List<User>>.loading();

      final List<User> contacts = await _contentService
          .getContactsData(id: id, keyword: _contactsSearchKeyword)
          .timeout(const Duration(seconds: 10));

      _contactsState = StateModel<List<User>>.fulfilled(data: contacts);
    } catch (e, t) {
      _contactsState = const StateModel<List<User>>.error(message: 'Failed fetch the contacts');
      log('Fetch to fetch the contacts error', error: e, stackTrace: t);
    }
  }

  @readonly
  StateModel<List<User>> _searchContactsState = const StateModel<List<User>>.loading();

  @readonly
  String _addNewContactsSearchKeyword = '';

  @action
  void setAddNewContactsSearchKeyword(String newKeyword) {
    if (newKeyword == _addNewContactsSearchKeyword) {
      return;
    }
    _addNewContactsSearchKeyword = newKeyword;
    searchContacts();
  }

  @action
  Future<void> searchContacts() async {
    try {
      _searchContactsState = const StateModel<List<User>>.loading();

      List<User> contacts = <User>[];

      if (_addNewContactsSearchKeyword.isNotEmpty) {
        contacts = await _contentService
            .searchUsers(
              keyword: _addNewContactsSearchKeyword,
              phone: _authStore.authData!.phone,
              contactsId: (_contactsState as Fulfilled<List<User>>).data.map((User user) => user.id).toList(),
            )
            .timeout(const Duration(seconds: 10));
      }

      _searchContactsState = StateModel<List<User>>.fulfilled(data: contacts);
    } catch (e, t) {
      _searchContactsState = const StateModel<List<User>>.error(message: 'Failed search the contacts');
      log('Search the contacts error', error: e, stackTrace: t);
    }
  }

  @readonly
  StateModel<void> _addNewContactState = const StateModel<void>.fulfilled(data: null);

  @action
  Future<void> addNewContact({required int contactId}) async {
    try {
      _addNewContactState = const StateModel<List<User>>.loading();

      await _contentService.addNewContact(contactId: contactId, userId: id).timeout(const Duration(seconds: 10));

      _fetchContacts();
      _addNewContactState = const StateModel<void>.fulfilled(data: null);
    } catch (e, t) {
      _addNewContactState = const StateModel<void>.error(message: 'Failed to add the contact');
      log('Add the contact error', error: e, stackTrace: t);
    }
  }
}
