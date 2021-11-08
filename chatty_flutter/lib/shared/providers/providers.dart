import 'package:chatty/services/cloud_functions_serverless_service/cloud_functions_serverless_service.dart';
import 'package:chatty/services/hasura_content_service/hasura_content_service.dart';
import 'package:chatty/shared/graphql/client.dart';
import 'package:chatty/shared/router/router_store.dart';
import 'package:chatty/shared/state/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

/* Util layer */

final Provider<GQClient> gqClientPOD = Provider<GQClient>((ProviderReference ref) {
  return const GQClient();
});

/* Service layer */

final Provider<CloudFunctionsService> cloudFunctionsServicePOD = Provider<CloudFunctionsService>((
  ProviderReference ref,
) {
  final http.Client client = http.Client();
  return CloudFunctionsService(client: client);
});

final Provider<HasuraContentService> hasuraContentServicePOD = Provider<HasuraContentService>((
  ProviderReference ref,
) {
  final GQClient gqClient = ref.watch(gqClientPOD);
  return HasuraContentService(client: gqClient);
});

/* Global state layer */

final Provider<AuthStore> authStorePOD = Provider<AuthStore>((ProviderReference ref) {
  final CloudFunctionsService cloudFunctionsService = ref.watch(cloudFunctionsServicePOD);
  return AuthStore(authService: cloudFunctionsService);
});

final Provider<UserStore> userStorePOD = Provider<UserStore>((ProviderReference ref) {
  final AuthStore authStore = ref.watch(authStorePOD);
  final HasuraContentService contentService = ref.watch(hasuraContentServicePOD);
  return UserStore(authStore: authStore, contentService: contentService);
});

final Provider<RouterStore> routerStorePOD = Provider<RouterStore>((ProviderReference ref) {
  final AuthStore authStore = ref.watch(authStorePOD);
  final UserStore userStore = ref.watch(userStorePOD);
  return RouterStore(authStore: authStore, userStore: userStore);
});
