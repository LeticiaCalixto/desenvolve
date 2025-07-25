import 'package:flutter/material.dart';

class NavigationController extends ChangeNotifier {
  int _currentIndex = 0;
  bool _showBottomNavigation = true;

  int get currentIndex => _currentIndex;
  bool get showBottomNavigation => _showBottomNavigation;

  void setCurrentIndex(int index) {
    if (_currentIndex != index) {
      _currentIndex = index;
      notifyListeners();
    }
  }

  void setBottomNavigationVisibility(bool visible) {
    if (_showBottomNavigation != visible) {
      _showBottomNavigation = visible;
      notifyListeners();
    }
  }

  void navigateToTab(int index) {
    setCurrentIndex(index);
  }

  // Method to hide bottom navigation for specific screens
  void hideBottomNavigation() {
    setBottomNavigationVisibility(false);
  }

  // // Method to show bottom navigation
  // void showBottomNavigation() {
  //   setBottomNavigationVisibility(true);
  // }
}
