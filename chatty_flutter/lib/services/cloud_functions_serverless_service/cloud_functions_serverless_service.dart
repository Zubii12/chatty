import 'dart:convert';

import 'package:chatty/services/auth_service.dart';
import 'package:chatty/services/serverless_service.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*

1. register button presesd
2. send otp with firebase : return requestId
3. send the code to firebase and verify
4. from firebase add the user to database in step 3
5. save the phone number in shared pref. 


*/

const String kSharedPrefAccessPhoneKey = 'chatty_phone';

class CloudFunctionsService extends ServerlessService with AuthService {
  const CloudFunctionsService({required Client client}) : _client = client;

  final Client _client;

  @override
  Future<String?> login() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(kSharedPrefAccessPhoneKey);
  }

  @override
  Future<void> register({required String phone}) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(kSharedPrefAccessPhoneKey, phone);
  }

  @override
  Future<String> sendOTP({required String phone}) async {
    final Response response = await _client.post(
      Uri.parse('https://us-central1-chatty-6f540.cloudfunctions.net/sendOTP'),
      headers: <String, String>{
        'content-type': 'application/json',
      },
      body: jsonEncode(
        <String, dynamic>{
          'data': <String, dynamic>{
            'phone': phone,
          },
        },
      ),
    );

    if (response.statusCode >= 400) {
      throw StateError(response.body);
    }

    return jsonDecode(response.body)['result'];
  }

  @override
  Future<void> verifyOTP({
    required String phone,
    required String code,
    required String requestId,
  }) async {
    final Response response = await _client.post(
      Uri.parse('https://us-central1-chatty-6f540.cloudfunctions.net/verifyOTP'),
      headers: <String, String>{
        'content-type': 'application/json',
      },
      body: jsonEncode(
        <String, dynamic>{
          'data': <String, dynamic>{
            'phone': phone,
            'code': code,
            'requestId': requestId,
          },
        },
      ),
    );

    if (response.statusCode >= 400) {
      throw StateError(response.body);
    }
  }
}
