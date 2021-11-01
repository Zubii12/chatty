import 'package:chatty/shared/router/router_store.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final routerStorePOD = Provider<RouterStore>((ref) {
  return RouterStore();
});
