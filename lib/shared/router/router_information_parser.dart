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
      default:
        return const RouterState.unknown();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(RouterState configuration) {
    if (configuration is Home) {
      setWebPageTitle('Chatty');
      return const RouteInformation(location: '/users');
    }
  }
}
