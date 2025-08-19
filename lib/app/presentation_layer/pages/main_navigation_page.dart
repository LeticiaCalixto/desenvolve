import 'package:desenvolve/app/presentation_layer/pages/home/home_page.dart';
import 'package:desenvolve/app/presentation_layer/pages/profile/profile_page.dart';
import 'package:desenvolve/app/presentation_layer/pages/library/library_page.dart';
import 'package:desenvolve/app/presentation_layer/pages/notifications/notifications_page.dart';
import 'package:desenvolve/app/presentation_layer/pages/contacts/contacts_page.dart';
import 'package:flutter/material.dart';

class MainNavigationPage extends StatefulWidget {
  final int initialIndex;

  const MainNavigationPage({
    super.key,
    this.initialIndex = 2,
  });

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  late int _currentIndex;
  late PageController _pageController;

  final List<Widget> _pages = [
    const ContactsPage(),
    const LibraryPage(),
    const HomePage(),
    const NotificationsPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Exibe a página baseada na navegação
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: _pages,
            ),
          ),
          // Navegação inferior
          _buildBottomNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.01,
            vertical: screenWidth * 0.015,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: _buildNavItem(
                  icon: Icons.contacts_outlined,
                  activeIcon: Icons.contacts,
                  label: 'Contatos',
                  index: 0,
                ),
              ),
              Expanded(
                child: _buildNavItem(
                  icon: Icons.menu_book_outlined,
                  activeIcon: Icons.menu_book,
                  label: 'Biblioteca',
                  index: 1,
                ),
              ),
              Expanded(
                child: _buildNavItem(
                  icon: Icons.home_outlined,
                  activeIcon: Icons.home,
                  label: 'Home',
                  index: 2,
                ),
              ),
              Expanded(
                child: _buildNavItem(
                  icon: Icons.notifications_outlined,
                  activeIcon: Icons.notifications,
                  label: 'Alertas',
                  index: 3,
                ),
              ),
              Expanded(
                child: _buildNavItem(
                  icon: Icons.person_outline,
                  activeIcon: Icons.person,
                  label: 'Perfil',
                  index: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required int index,
  }) {
    final isActive = _currentIndex == index;
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Ajuste responsivo do tamanho da fonte baseado na largura da tela
    double fontSize = screenWidth > 400 ? screenWidth * 0.03 : screenWidth * 0.025;
    
    // Labels mais curtos para telas pequenas
    String displayLabel = label;
    if (screenWidth < 380) {
      switch (label) {
        case 'Biblioteca':
          displayLabel = 'Biblio';
          break;
        case 'Contatos':
          displayLabel = 'Contato';
          break;
        case 'Alertas':
          displayLabel = 'Alerta';
          break;
        default:
          displayLabel = label;
      }
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
        _pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: screenWidth * 0.015,
          horizontal: screenWidth * 0.01,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              color: isActive
                  ? const Color(0xFF4ECDC4)
                  : const Color.fromARGB(255, 138, 149, 147),
              size: screenWidth * 0.055,
            ),
            SizedBox(height: screenWidth * 0.008),
            Flexible(
              child: Text(
                displayLabel,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                  color: isActive
                      ? const Color(0xFF4ECDC4)
                      : const Color.fromARGB(255, 138, 149, 147),
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
