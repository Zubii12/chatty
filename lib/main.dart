import 'dart:async';
import 'dart:developer';

import 'package:chatty/app.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  runZonedGuarded(() async {
    try {
      setPathUrlStrategy();
      WidgetsFlutterBinding.ensureInitialized();

      runApp(const ProviderScope(child: ChattyApp()));
    } catch (error, stackTrace) {
      log('1Zone Error', error: error, stackTrace: stackTrace, zone: Zone.current);
      log('1Zone z_error: $error');
      log('1z_stackTrace: $stackTrace');
      log('1z_zone ${Zone.current}');
    }
  }, (Object error, StackTrace stackTrace) {
    log('2Zone Error', error: error, stackTrace: stackTrace, zone: Zone.current);
    log('2Zone z_error: $error');
    log('2z_stackTrace: $stackTrace');
    log('2z_zone ${Zone.current}');
  });
}
