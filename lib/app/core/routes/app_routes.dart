class AppRoutes {
  // Routes without bottom navigation
  static const String login = '/login';
  static const String onboarding = '/onboarding';
  static const String splash = '/splash';

  // Routes with bottom navigation (main tabs)
  static const String home = '/home';
  static const String disease = '/disease';
  static const String alertSymptoms = '/alert-symptoms';
  static const String milestones = '/milestones';
  static const String profile = '/profile';
  static const String healthLibrary = '/health-library';

  // Detail routes (with bottom navigation)
  static const String articleDetail = '/article-detail';
  static const String categoryArticles = '/category-articles';
  static const String createAccount = '/create-account';
  static const String forgotPassword = '/forgot-password';

  // Helper method to check if route should have bottom navigation
  static bool hasBottomNavigation(String route) {
    const routesWithoutBottomNav = [
      login,
      onboarding,
      splash,
    ];
    return !routesWithoutBottomNav.contains(route);
  }
}
