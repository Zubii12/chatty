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

  @readonly
  bool _isProfileCompleted = false;

  @readonly
  StateModel<User> _userDataState = const StateModel<User>.loading();

  @action
  Future<void> _fetchUserData() async {
    try {
      _userDataState = const StateModel<User>.loading();

      final User user = await _contentService
          .getUserData(phone: _authStore.authData!.phone)
          .timeout(const Duration(seconds: 10));

      _userDataState = StateModel<User>.fulfilled(data: user);
      _isProfileCompleted = true;
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
}
