part of state;

enum AuthState { authenticated, unauthenticated, unknown }

class AuthStore extends _AuthStore with _$AuthStore {
  AuthStore({required AuthService authService}) : super(authService: authService);
}

abstract class _AuthStore with Store {
  _AuthStore({required AuthService authService}) : _authService = authService {
    _loginWithStoredPhone();
  }

  final AuthService _authService;

  @readonly
  AuthData? _authData;

  @readonly
  bool _authChecked = false;

  @readonly
  bool _isConnected = true;

  @action
  Future<void> _loginWithStoredPhone() async {
    try {
      final String? phone = await _authService.login().timeout(const Duration(seconds: 20));

      if (phone != null) {
        _authData = AuthData(phone: phone);
        _isConnected = true;
      }
    } catch (e, t) {
      log('Login with stored phone error', error: e, stackTrace: t);
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

  @readonly
  StateModel<String> _sendOTPState = const StateModel<String>.loading();

  @action
  Future<void> sendOTP({required String phone}) async {
    try {
      _sendOTPState = const StateModel<String>.loading();

      final String requestId = await _authService //
          .sendOTP(phone: phone)
          .timeout(const Duration(seconds: 20));

      _sendOTPState = StateModel<String>.fulfilled(data: requestId);
    } catch (e, t) {
      _sendOTPState = const StateModel<String>.error(message: 'Failed to send the code.');
      log('Send OTP error: ', error: e, stackTrace: t);
    }
  }

  @readonly
  StateModel<void> _verifyOTPState = const StateModel<void>.fulfilled(data: null);

  @action
  Future<void> verifyOTP({
    required String phone,
    required String code,
    required String requestId,
  }) async {
    try {
      _verifyOTPState = const StateModel<void>.loading();

      await _authService
          .verifyOTP(phone: phone, code: code, requestId: requestId)
          .timeout(const Duration(seconds: 10));

      await _authService.register(phone: phone).timeout(const Duration(seconds: 10));
      _authData = AuthData(phone: phone);
      _verifyOTPState = const StateModel<void>.fulfilled(data: null);
    } catch (e, t) {
      _verifyOTPState = const StateModel<void>.error(message: 'Failed to verify the code.');
      log('Verify OTP error: ', error: e, stackTrace: t);
    }
  }
}
