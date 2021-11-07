import 'package:chatty/services/cloud_functions_serverless_service/cloud_functions_serverless_service.dart';
import 'package:chatty/shared/router/router_store.dart';
import 'package:chatty/shared/state/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

// Service layer

final Provider<CloudFunctionsService> cloudFunctionsServicePOD =
    Provider<CloudFunctionsService>((ProviderReference ref) {
  final http.Client client = http.Client();
  return CloudFunctionsService(client: client);
});

// Global state layer

final Provider<AuthStore> authStorePOD = Provider<AuthStore>((ProviderReference ref) {
  final CloudFunctionsService cloudFunctionsService = ref.watch(cloudFunctionsServicePOD);
  return AuthStore(authService: cloudFunctionsService);
});

final Provider<RouterStore> routerStorePOD = Provider<RouterStore>((ProviderReference ref) {
  final AuthStore authStore = ref.watch(authStorePOD);
  return RouterStore(authStore: authStore);
});
