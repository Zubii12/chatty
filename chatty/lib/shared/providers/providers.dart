import 'package:chatty/services/rest_auth_service/rest_auth_service.dart';
import 'package:chatty/shared/router/router_store.dart';
import 'package:chatty/shared/state/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Service layer

final Provider<RestAuthService> restAuthServicePOD =
    Provider<RestAuthService>((ProviderReference ref) {
  return RestAuthService();
});

// Global state layer

final Provider<AuthStore> authStorePOD = Provider<AuthStore>((ProviderReference ref) {
  final RestAuthService authService = ref.watch(restAuthServicePOD);
  return AuthStore(authService: authService);
});

final Provider<RouterStore> routerStorePOD = Provider<RouterStore>((ProviderReference ref) {
  final AuthStore authStore = ref.watch(authStorePOD);
  return RouterStore(authStore: authStore);
});
