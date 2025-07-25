import 'package:desenvolve/app/core/service/navigation_service.dart';
import 'package:desenvolve/app/presentation_layer/widgets/custom_button_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/core/injection_container.dart';
import 'app/core/routes/route_generator.dart';
import 'app/core/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  // Rotas que NÃO devem ter bottom navigation
  static const List<String> _routesWithoutBottomNav = [
    AppRoutes.login,
    '/splash',
    '/onboarding',
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: InjectionContainer.providers,
      child: MaterialApp(
        title: 'Desenvolve+',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF4ECDC4),
          ),
          useMaterial3: true,
        ),
        navigatorKey: NavigationService.navigatorKey,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: AppRoutes.login,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          if (child == null) return const SizedBox.shrink();

          // Verifica a rota atual
          final currentRoute = ModalRoute.of(context)?.settings.name;
          final shouldShowBottomNav = currentRoute != null &&
              !_routesWithoutBottomNav.contains(currentRoute);

          if (shouldShowBottomNav) {
            return Scaffold(
              body: child,
              bottomNavigationBar: CustomBottomNavigation(
                currentIndex: _getCurrentIndex(currentRoute),
                onTap: _onNavItemTapped,
              ),
            );
          }

          return child;
        },
      ),
    );
  }

  int _getCurrentIndex(String? currentRoute) {
    switch (currentRoute) {
      case AppRoutes.home:
        return 0;
      case AppRoutes.activities:
        return 1;
      case AppRoutes.milestones:
        return 2;
      case AppRoutes.profile:
        return 3;
      case AppRoutes.healthLibrary:
        return 4;
      default:
        return _currentIndex;
    }
  }

  void _onNavItemTapped(int index) {
    if (_currentIndex != index) {
      setState(() {
        _currentIndex = index;
      });

      switch (index) {
        case 0:
          NavigationService.navigateAndReplace(AppRoutes.home);
          break;
        case 1:
          NavigationService.navigateAndReplace(AppRoutes.activities);
          break;
        case 2:
          NavigationService.navigateAndReplace(AppRoutes.milestones);
          break;
        case 3:
          NavigationService.navigateAndReplace(AppRoutes.profile);
          break;
        case 4:
          NavigationService.navigateAndReplace(AppRoutes.healthLibrary);
          break;
      }
    }
  }
}
