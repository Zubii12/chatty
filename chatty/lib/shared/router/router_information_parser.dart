import 'package:chatty/models/index.dart';
import 'package:chatty/shared/utils/helpers.dart';
import 'package:flutter/material.dart';

class ChattyRouterInformationParser extends RouteInformationParser<RouterState> {
  @override
  Future<RouterState> parseRouteInformation(RouteInformation routeInformation) async {
    final Uri uri = Uri.parse(routeInformation.location ?? '');

    final String path = uri.path;

    switch (path) {
      case '/':
        return const RouterState.home();
      case '/splash':
        return const RouterState.splash();
      default:
        return const RouterState.unknown();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(RouterState configuration) {
    if (configuration is Home) {
      setWebPageTitle('Chatty | Home');
      return const RouteInformation(location: '/users');
    } else if (configuration is Register) {
      setWebPageTitle('Chatty | Register');
      return const RouteInformation(location: '/login');
    } else if (configuration is Splash) {
      setWebPageTitle('Chatty');
      return const RouteInformation(location: '/');
    } else if (configuration is Unknown) {
      setWebPageTitle('Unknown | Labouroo');
      return const RouteInformation(location: '/unknown');
    }

    throw Exception('Unknown configuration');
  }
}
