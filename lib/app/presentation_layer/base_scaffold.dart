import 'package:desenvolve/app/presentation_layer/pages/main_navigation_page.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final Widget child;
  final bool showFooter;

  const BaseScaffold({
    super.key,
    required this.child,
    this.showFooter = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar:
          showFooter ? const MainNavigationPage(initialIndex: 0) : null,
    );
  }
}
