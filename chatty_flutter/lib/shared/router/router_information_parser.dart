import 'package:chatty/models/index.dart';
import 'package:chatty/shared/utils/helpers.dart';
import 'package:flutter/material.dart';

class ChattyRouterInformationParser extends RouteInformationParser<RouterState> {
  @override
  Future<RouterState> parseRouteInformation(RouteInformation routeInformation) async {
    final Uri uri = Uri.parse(routeInformation.location ?? '');

    final String path = uri.path;

    if (path == '/') {
      return const RouterState.home(currentTab: HomePageTab.chats);
    } else if (path == '/contacts') {
      return const RouterState.home(currentTab: HomePageTab.contacts);
    } else if (path == '/more') {
      return const RouterState.home(currentTab: HomePageTab.more);
    } else if (path == '/register') {
      return const RouterState.register();
    } else if (path == '/splash') {
      return const RouterState.splash();
    } else if (uri.pathSegments.first == 'verify-otp-page') {
      if (uri.pathSegments.length >= 2) {
        return RouterState.verifyOTP(phone: '${uri.pathSegments[1]}');
      }
    }

    return const RouterState.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(RouterState configuration) {
    if (configuration is Home) {
      switch (configuration.currentTab) {
        case HomePageTab.chats:
          setWebPageTitle('Chatty | Chats');
          return const RouteInformation(location: '/chats');
        case HomePageTab.contacts:
          setWebPageTitle('Chatty | Contacts');
          return const RouteInformation(location: '/contacts');
        case HomePageTab.more:
          setWebPageTitle('Chatty | More');
          return const RouteInformation(location: '/more');
      }
    } else if (configuration is Register) {
      setWebPageTitle('Chatty | Register');
      return const RouteInformation(location: '/register');
    } else if (configuration is Splash) {
      setWebPageTitle('Chatty');
      return const RouteInformation(location: '/');
    } else if (configuration is VerifyOTP) {
      setWebPageTitle('Chatty | Verify OTP');
      return RouteInformation(
        location: '/verify-otp',
        state: configuration.phone,
      );
    } else if (configuration is Unknown) {
      setWebPageTitle('Chatty | Unknown ');
      return const RouteInformation(location: '/unknown');
    }

    throw Exception('Unknown configuration');
  }
}
