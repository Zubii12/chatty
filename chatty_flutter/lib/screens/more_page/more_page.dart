import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MorePage extends HookWidget {
  const MorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('morepage'),
      ),
    );
  }
}
