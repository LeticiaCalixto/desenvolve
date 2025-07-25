import 'package:desenvolve/app/core/routes/app_routes.dart';
import 'package:desenvolve/app/core/routes/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/core/injection_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        initialRoute: AppRoutes.login,
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
