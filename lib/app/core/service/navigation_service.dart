import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static NavigatorState? get navigator => navigatorKey.currentState;

  static Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigator!.pushNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> navigateAndReplace(String routeName,
      {Object? arguments}) {
    return navigator!.pushReplacementNamed(routeName, arguments: arguments);
  }

  static Future<dynamic> navigateAndClearStack(String routeName,
      {Object? arguments}) {
    return navigator!.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: arguments,
    );
  }

  static void goBack() {
    return navigator!.pop();
  }

  static bool canGoBack() {
    return navigator!.canPop();
  }

  // Método para navegar mantendo o bottom navigation
  static Future<dynamic> navigateWithBottomNav(String routeName,
      {Object? arguments}) {
    return navigator!.pushNamed(routeName, arguments: arguments);
  }

  // Método para verificar se a rota atual deve mostrar bottom navigation
  static bool shouldShowBottomNavigation(String? routeName) {
    const routesWithoutBottomNav = [
      '/login',
      '/onboarding',
      '/splash',
    ];

    return routeName != null && !routesWithoutBottomNav.contains(routeName);
  }
}
