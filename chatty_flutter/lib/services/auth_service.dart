abstract class AuthService {
  Future<String?> login();

  Future<void> register({required String phone});

  Future<String> sendOTP({required String phone});

  Future<void> verifyOTP({
    required String phone,
    required String code,
    required String requestId,
  });
}
