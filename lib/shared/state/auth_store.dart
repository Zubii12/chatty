part of state;

enum AuthState { authenticated, unauthenticated, unknown }

class AuthStore extends _AuthStore with _$AuthStore {
  AuthStore({required AuthService authService}) : super(authService: authService);
}

abstract class _AuthStore with Store {
  _AuthStore({required AuthService authService}) : _authService = authService {
    _authenticateWithStoredToken();
  }

  final AuthService _authService;

  @readonly
  AuthData? _authData;

  @readonly
  bool _authChecked = false;

  @readonly
  bool _isConnected = true;

  @action
  Future<void> _authenticateWithStoredToken() async {
    try {
      await Future<StateError>.delayed(const Duration(seconds: 3), () {
        throw StateError('sal');
      });
    } on StateError {
      _authData = null;
    } catch (e, _) {
      _isConnected = false;
    } finally {
      _authChecked = true;
    }
  }

  @computed
  AuthState get authState {
    if (!_authChecked) {
      return AuthState.unknown;
    }
    if (_authData != null) {
      return AuthState.authenticated;
    }

    return AuthState.unauthenticated;
  }
}
