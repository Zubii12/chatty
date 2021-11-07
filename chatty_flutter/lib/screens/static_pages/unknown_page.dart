import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UnknownPage extends HookWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Page not found.',
                  style: TextStyle(
                    fontSize: 26.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.home),
                  label: const Text('Home'),
                  onPressed: Navigator.of(context).pop,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
