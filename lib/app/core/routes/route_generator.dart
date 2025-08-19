import 'package:desenvolve/app/presentation_layer/pages/auth/login_page.dart';
import 'package:desenvolve/app/presentation_layer/pages/home/components/alert_symptoms_page.dart';
import 'package:desenvolve/app/presentation_layer/pages/home/components/disease_page.dart';
import 'package:desenvolve/app/presentation_layer/pages/home/components/nutrition_page.dart';
import 'package:desenvolve/app/presentation_layer/pages/home/components/development_page.dart';
import 'package:desenvolve/app/presentation_layer/pages/home/components/sleep_care_page.dart';
import 'package:desenvolve/app/presentation_layer/pages/home/components/vaccination_page.dart';
import 'package:desenvolve/app/presentation_layer/pages/main_navigation_page.dart';
import 'package:desenvolve/app/presentation_layer/pages/profile/profile_page.dart';
import 'package:desenvolve/app/presentation_layer/pages/splash/post_login_splash_page.dart';
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

      case AppRoutes.postLoginSplash:
        return MaterialPageRoute(
          builder: (_) => const PostLoginSplashPage(),
          settings: settings,
        );

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const MainNavigationPage(initialIndex: 2),
          settings: settings,
        );

      case AppRoutes.disease:
        return MaterialPageRoute(
          builder: (_) => DiseasePage(),
          settings: settings,
        );

      case AppRoutes.alertSymptoms:
        return MaterialPageRoute(
          builder: (_) => const AlertSymptomsPage(),
          settings: settings,
        );

      case AppRoutes.vaccination:
        return MaterialPageRoute(
          builder: (_) => const VaccinationPage(),
          settings: settings,
        );

      case AppRoutes.nutrition:
        return MaterialPageRoute(
          builder: (_) => const NutritionPage(),
          settings: settings,
        );

      case AppRoutes.development:
        return MaterialPageRoute(
          builder: (_) => const DevelopmentPage(),
          settings: settings,
        );

      case AppRoutes.SleepCare:
        return MaterialPageRoute(
          builder: (_) => const SleepCarePage(),
          settings: settings,
        );

      case AppRoutes.milestones:
        return MaterialPageRoute(
          builder: (_) => const MainNavigationPage(initialIndex: 2),
          settings: settings,
        );

      case AppRoutes.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfilePage(),
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
          child: Text('Página em construção!'),
        ),
      ),
    );
  }
}
