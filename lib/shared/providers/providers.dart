import 'package:chatty/shared/router/router_store.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final Provider<RouterStore> routerStorePOD = Provider<RouterStore>((ProviderReference ref) {
  return RouterStore();
});
