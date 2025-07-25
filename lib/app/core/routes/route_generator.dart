import 'package:desenvolve/app/presentation_layer/pages/auth/login_page.dart';
import 'package:desenvolve/app/presentation_layer/pages/home/home_page.dart';
import 'package:desenvolve/app/presentation_layer/pages/main_navigation_page.dart';
import 'package:flutter/material.dart';
import 'app_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: settings,
        );

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
          settings: settings,
        );

      case AppRoutes.healthLibrary:
        return MaterialPageRoute(
          builder: (_) => const MainNavigationPage(initialIndex: 4),
          settings: settings,
        );

      case AppRoutes.activities:
        return MaterialPageRoute(
          builder: (_) => const MainNavigationPage(initialIndex: 1),
          settings: settings,
        );

      case AppRoutes.milestones:
        return MaterialPageRoute(
          builder: (_) => const MainNavigationPage(initialIndex: 2),
          settings: settings,
        );

      case AppRoutes.profile:
        return MaterialPageRoute(
          builder: (_) => const MainNavigationPage(initialIndex: 3),
          settings: settings,
        );

      // case AppRoutes.articleDetail:
      //   final article = settings.arguments as HealthArticle;
      //   return MaterialPageRoute(
      //     builder: (_) => ArticleDetailPage(article: article),
      //     settings: settings,
      //   );

      // case AppRoutes.categoryArticles:
      //   final category = settings.arguments as HealthCategory;
      //   return MaterialPageRoute(
      //     builder: (_) => CategoryArticlesPage(category: category),
      //     settings: settings,
      //   );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Erro')),
        body: const Center(
          child: Text('Página não encontrada'),
        ),
      ),
    );
  }
}
