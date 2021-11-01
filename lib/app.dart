import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ChattyApp extends HookWidget {
  const ChattyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) => 'Chatty',
    );
  }
}
