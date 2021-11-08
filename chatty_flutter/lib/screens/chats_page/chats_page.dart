import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ChatsPage extends HookWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('chatspage'),
      ),
    );
  }
}
