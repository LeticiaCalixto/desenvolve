import 'package:desenvolve/app/presentation_layer/pages/auth/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/core/injection_container.dart';
import 'app/presentation_layer/pages/auth/login_page.dart';

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
        home: const LoginPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
