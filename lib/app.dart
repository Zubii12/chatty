import 'package:chatty/shared/providers/providers.dart';
import 'package:chatty/shared/router/router_delegate.dart';
import 'package:chatty/shared/router/router_information_parser.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChattyApp extends HookWidget {
  const ChattyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routerDelegatePOD = useState(AutoDisposeProvider<ChattyRouterDelegate>((ref) {
      final routerStore = ref.watch(routerStorePOD);
      return ChattyRouterDelegate(routerStore: routerStore);
    }));
    final routerDelegate = useProvider(routerDelegatePOD.value);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) => 'Chatty',
      routerDelegate: routerDelegate,
      routeInformationParser: ChattyRouterInformationParser()
    );
  }
}
